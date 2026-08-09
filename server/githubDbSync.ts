import { execSync, exec } from "child_process";
import { promisify } from "util";

const execAsync = promisify(exec);

const GITHUB_TOKEN = process.env.GITHUB_PERSONAL_ACCESS_TOKEN || "";
const GITHUB_OWNER = "salzajebal";
const GITHUB_REPO = "rd-index";
const DB_SEED_PATH = "db-seed.sql";

function getGithubApiHeaders() {
  return {
    Authorization: `token ${GITHUB_TOKEN}`,
    Accept: "application/vnd.github.v3+json",
    "Content-Type": "application/json",
    "User-Agent": "rd-index-app",
  };
}

/**
 * 프로덕션 DB를 pg_dump로 덤프하여 GitHub에 db-seed.sql로 업로드
 */
export async function pushDbToGithub(): Promise<{ success: boolean; message: string }> {
  if (!GITHUB_TOKEN) {
    return { success: false, message: "GITHUB_PERSONAL_ACCESS_TOKEN 환경변수가 없습니다" };
  }

  const dbUrl = process.env.DATABASE_URL;
  if (!dbUrl) {
    return { success: false, message: "DATABASE_URL 환경변수가 없습니다" };
  }

  try {
    // pg_dump로 SQL 덤프 생성
    console.log("[githubDbSync] Running pg_dump...");
    const { stdout: sqlDump } = await execAsync(
      `pg_dump "${dbUrl}" --no-owner --no-acl --clean --if-exists`,
      { maxBuffer: 100 * 1024 * 1024 } // 100MB buffer
    );

    const content = Buffer.from(sqlDump).toString("base64");

    // 기존 파일 SHA 확인 (업데이트 시 필요)
    let sha: string | undefined;
    try {
      const checkRes = await fetch(
        `https://api.github.com/repos/${GITHUB_OWNER}/${GITHUB_REPO}/contents/${DB_SEED_PATH}`,
        { headers: getGithubApiHeaders() }
      );
      if (checkRes.ok) {
        const data = await checkRes.json() as any;
        sha = data.sha;
      }
    } catch {
      // 파일 없으면 새로 생성
    }

    // GitHub에 업로드
    const now = new Date().toLocaleString("ko-KR", { timeZone: "Asia/Seoul" });
    const body: any = {
      message: `DB backup ${now} (KST)`,
      content,
      branch: "main",
    };
    if (sha) body.sha = sha;

    const uploadRes = await fetch(
      `https://api.github.com/repos/${GITHUB_OWNER}/${GITHUB_REPO}/contents/${DB_SEED_PATH}`,
      {
        method: "PUT",
        headers: getGithubApiHeaders(),
        body: JSON.stringify(body),
      }
    );

    if (!uploadRes.ok) {
      const err = await uploadRes.json() as any;
      return { success: false, message: `GitHub 업로드 실패: ${err.message}` };
    }

    const sqlSizeMB = (sqlDump.length / 1024 / 1024).toFixed(2);
    console.log(`[githubDbSync] DB pushed to GitHub (${sqlSizeMB}MB)`);
    return { success: true, message: `DB 백업 완료 (${sqlSizeMB}MB) → GitHub/${DB_SEED_PATH}` };
  } catch (err: any) {
    console.error("[githubDbSync] pushDbToGithub error:", err);
    return { success: false, message: err.message };
  }
}

/**
 * GitHub에서 db-seed.sql을 다운로드하여 현재 DB에 복원
 * DB가 비어있을 때만 실행 (users 테이블에 admin 계정이 없을 때)
 */
export async function restoreDbFromGithub(): Promise<void> {
  if (!GITHUB_TOKEN) {
    console.log("[githubDbSync] No GITHUB_PERSONAL_ACCESS_TOKEN, skipping DB restore");
    return;
  }

  const dbUrl = process.env.DATABASE_URL;
  if (!dbUrl) {
    console.log("[githubDbSync] No DATABASE_URL, skipping DB restore");
    return;
  }

  try {
    // DB가 이미 데이터가 있는지 확인
    const { stdout: countOut } = await execAsync(
      `psql "${dbUrl}" -t -c "SELECT COUNT(*) FROM users WHERE username='admin'" 2>/dev/null || echo "0"`,
      { timeout: 10000 }
    );
    const adminCount = parseInt(countOut.trim(), 10);
    if (adminCount > 0) {
      console.log("[githubDbSync] DB already has data, skipping restore");
      return;
    }
  } catch {
    // 테이블이 없으면 복원 필요
  }

  try {
    console.log("[githubDbSync] DB is empty, downloading db-seed.sql from GitHub...");
    const res = await fetch(
      `https://api.github.com/repos/${GITHUB_OWNER}/${GITHUB_REPO}/contents/${DB_SEED_PATH}`,
      { headers: getGithubApiHeaders() }
    );

    if (!res.ok) {
      if (res.status === 404) {
        console.log("[githubDbSync] No db-seed.sql found on GitHub, skipping restore");
      } else {
        console.error("[githubDbSync] Failed to fetch db-seed.sql:", res.status);
      }
      return;
    }

    const data = await res.json() as any;
    const sqlContent = Buffer.from(data.content, "base64").toString("utf-8");

    // 임시 파일에 저장 후 psql로 복원
    const tmpFile = `/tmp/db-seed-restore-${Date.now()}.sql`;
    const fs = await import("fs");
    fs.writeFileSync(tmpFile, sqlContent);

    console.log("[githubDbSync] Restoring DB from seed file...");
    await execAsync(`psql "${dbUrl}" -f "${tmpFile}" 2>&1`, {
      maxBuffer: 100 * 1024 * 1024,
      timeout: 300000, // 5분
    });

    // 임시 파일 삭제
    try { fs.unlinkSync(tmpFile); } catch {}

    console.log("[githubDbSync] DB restore completed successfully!");
  } catch (err: any) {
    console.error("[githubDbSync] restoreDbFromGithub error:", err.message);
  }
}
