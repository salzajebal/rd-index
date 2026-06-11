import { useState } from "react";

export function LandingPreview() {
  const [activeTab, setActiveTab] = useState(0);

  return (
    <div className="min-h-screen bg-white font-sans" style={{ fontFamily: "'Pretendard', 'Apple SD Gothic Neo', sans-serif" }}>

      {/* ── Navbar ── */}
      <header className="sticky top-0 z-50 bg-white border-b border-gray-100 shadow-sm">
        <div className="max-w-7xl mx-auto px-8 h-16 flex items-center justify-between">
          <div className="flex items-center gap-8">
            <div className="flex items-center gap-2">
              <span className="text-2xl font-black tracking-tight text-gray-900">MIB</span>
              <span className="text-xs font-medium text-gray-400 mt-1">글로벌 투자 거래소</span>
            </div>
            <nav className="hidden md:flex items-center gap-6">
              {["회사소개", "투자 상품", "실시간 시세", "투자정보", "고객라운지"].map((m) => (
                <a key={m} className="text-sm font-medium text-gray-600 hover:text-indigo-600 cursor-pointer transition-colors">{m}</a>
              ))}
            </nav>
          </div>
          <div className="flex items-center gap-3">
            <button className="px-4 py-2 text-sm font-medium text-indigo-600 border border-indigo-200 rounded-full hover:bg-indigo-50 transition-colors">로그인</button>
            <button className="px-4 py-2 text-sm font-semibold text-white bg-indigo-600 rounded-full hover:bg-indigo-700 transition-colors">거래 시작하기</button>
          </div>
        </div>
      </header>

      {/* ── Hero Cards (KoAct 스타일) ── */}
      <section className="max-w-7xl mx-auto px-8 py-12">
        <div className="grid grid-cols-3 gap-5">
          {/* 메인 카드 */}
          <div className="col-span-2 rounded-3xl p-8 flex flex-col justify-between min-h-72 relative overflow-hidden"
            style={{ background: "linear-gradient(135deg, #3B3AC4 0%, #6C63FF 100%)" }}>
            <div className="absolute right-0 bottom-0 opacity-10">
              <svg width="280" height="200" viewBox="0 0 280 200"><path d="M0,120 Q70,20 140,80 T280,40" stroke="white" strokeWidth="3" fill="none"/><path d="M0,160 Q70,60 140,120 T280,80" stroke="white" strokeWidth="2" fill="none"/></svg>
            </div>
            <div>
              <span className="inline-block px-3 py-1 bg-white/20 text-white text-xs rounded-full mb-4">• 실시간 거래</span>
              <h2 className="text-3xl font-bold text-white leading-snug mb-2">
                글로벌 금융시장,<br />지금 바로 투자하세요
              </h2>
              <p className="text-indigo-200 text-sm mt-2">S&P500, 다우존스, 달러 지수를 5분 단위로 거래</p>
            </div>
            <div className="flex items-center gap-4 mt-6">
              <button className="px-5 py-2.5 bg-white text-indigo-700 font-semibold text-sm rounded-full hover:bg-indigo-50 transition-colors">지금 거래하기</button>
              <span className="text-white/70 text-sm">→ 실시간 시세 보기</span>
            </div>
          </div>

          {/* 오른쪽 두 카드 */}
          <div className="flex flex-col gap-5">
            <div className="rounded-3xl p-6 flex flex-col justify-between flex-1 relative overflow-hidden"
              style={{ background: "linear-gradient(135deg, #7C3AED 0%, #A855F7 100%)" }}>
              <span className="inline-block px-3 py-1 bg-white/20 text-white text-xs rounded-full mb-3">• S&P 500</span>
              <div>
                <h3 className="text-xl font-bold text-white">5,320.00</h3>
                <p className="text-purple-200 text-xs mt-1">+0.42% 실시간 변동</p>
              </div>
              <div className="mt-3">
                <svg viewBox="0 0 120 40" className="w-full opacity-60"><polyline points="0,30 20,25 40,28 60,15 80,20 100,10 120,15" fill="none" stroke="white" strokeWidth="2"/></svg>
              </div>
            </div>
            <div className="rounded-3xl p-6 flex flex-col justify-between flex-1 relative overflow-hidden"
              style={{ background: "linear-gradient(135deg, #0EA5E9 0%, #38BDF8 100%)" }}>
              <span className="inline-block px-3 py-1 bg-white/20 text-white text-xs rounded-full mb-3">• DOW Jones</span>
              <div>
                <h3 className="text-xl font-bold text-white">39,500.00</h3>
                <p className="text-sky-100 text-xs mt-1">-0.18% 실시간 변동</p>
              </div>
              <div className="mt-3">
                <svg viewBox="0 0 120 40" className="w-full opacity-60"><polyline points="0,15 20,20 40,12 60,18 80,25 100,22 120,28" fill="none" stroke="white" strokeWidth="2"/></svg>
              </div>
            </div>
          </div>
        </div>
      </section>

      {/* ── 탭 섹션 ── */}
      <section className="max-w-7xl mx-auto px-8 pb-12">
        <div className="flex gap-2 mb-6">
          {["전체", "S&P500", "다우존스", "달러(DXY)"].map((t, i) => (
            <button key={t} onClick={() => setActiveTab(i)}
              className={`px-4 py-2 rounded-full text-sm font-medium transition-colors ${activeTab === i ? "bg-indigo-600 text-white" : "bg-gray-100 text-gray-600 hover:bg-gray-200"}`}>
              {t}
            </button>
          ))}
        </div>
        <div className="grid grid-cols-3 gap-4">
          {[
            { name: "S&P 500", price: "5,320.00", change: "+0.42%", up: true, vol: "HIGH" },
            { name: "다우존스", price: "39,500.00", change: "-0.18%", up: false, vol: "MID" },
            { name: "달러(DXY)", price: "104.50", change: "+0.05%", up: true, vol: "LOW" },
          ].map((item) => (
            <div key={item.name} className="bg-white border border-gray-100 rounded-2xl p-5 shadow-sm hover:shadow-md transition-shadow cursor-pointer">
              <div className="flex items-center justify-between mb-3">
                <span className="text-sm font-semibold text-gray-700">{item.name}</span>
                <span className={`px-2 py-0.5 rounded-full text-xs font-medium ${item.up ? "bg-rose-50 text-rose-500" : "bg-blue-50 text-blue-500"}`}>
                  {item.change}
                </span>
              </div>
              <div className="text-2xl font-bold text-gray-900 mb-1">{item.price}</div>
              <div className="flex items-center justify-between mt-3">
                <span className="text-xs text-gray-400">변동성 {item.vol}</span>
                <button className="px-3 py-1 bg-indigo-600 text-white text-xs font-semibold rounded-full">거래하기</button>
              </div>
            </div>
          ))}
        </div>
      </section>

      {/* ── Investment Philosophy (블루/퍼플 그라데이션) ── */}
      <section className="py-16" style={{ background: "linear-gradient(160deg, #1E1B4B 0%, #312E81 50%, #4C1D95 100%)" }}>
        <div className="max-w-7xl mx-auto px-8">
          <div className="text-center mb-10">
            <p className="text-indigo-300 text-sm font-medium mb-2">Investment Philosophy</p>
            <h2 className="text-3xl font-bold text-white mb-3">안전하고 투명한 거래 시스템</h2>
            <p className="text-indigo-300 text-sm">MIB는 글로벌 스탠다드에 맞는 투자 환경을 제공합니다</p>
          </div>
          <div className="grid grid-cols-2 gap-5">
            {[
              { title: "실시간 시세", desc: "Finnhub API 기반 글로벌 실시간 가격 데이터로 정확한 거래를 지원합니다", icon: "📡" },
              { title: "투명한 정산", desc: "베팅 진입가 대비 마감가를 기준으로 공정하고 투명하게 결과를 산출합니다", icon: "⚖️" },
              { title: "보안 시스템", desc: "최고 수준의 보안 체계로 회원의 자산과 개인정보를 안전하게 보호합니다", icon: "🛡️" },
              { title: "24시간 운영", desc: "글로벌 시장에 맞춰 24시간 중단 없이 거래 서비스를 제공합니다", icon: "🌍" },
            ].map((item) => (
              <div key={item.title} className="bg-white/10 backdrop-blur border border-white/10 rounded-2xl p-6 hover:bg-white/15 transition-colors">
                <div className="text-3xl mb-3">{item.icon}</div>
                <h3 className="text-white font-bold text-lg mb-2">{item.title}</h3>
                <p className="text-indigo-200 text-sm leading-relaxed">{item.desc}</p>
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* ── 공지 / 인사이트 ── */}
      <section className="py-14" style={{ background: "#EEF2FF" }}>
        <div className="max-w-7xl mx-auto px-8">
          <div className="flex items-end justify-between mb-8">
            <div>
              <p className="text-indigo-400 text-xs font-bold mb-1 tracking-widest">01. NOTICE</p>
              <h2 className="text-2xl font-bold text-gray-900">공지사항 & 인사이트</h2>
              <p className="text-gray-500 text-sm mt-1">MIB의 최신 소식과 투자 정보를 확인하세요</p>
            </div>
            <button className="text-sm text-indigo-600 font-medium hover:underline">전체보기 →</button>
          </div>
          <div className="grid grid-cols-3 gap-5">
            {[
              { badge: "공지", date: "2026.06.05", title: "6월 이벤트 안내 — 입금 보너스 최대 10%", excerpt: "이번 달 특별 프로모션으로 첫 입금 시 보너스 혜택을 드립니다." },
              { badge: "업데이트", date: "2026.06.03", title: "시스템 점검 완료 — 더욱 빠른 거래 환경", excerpt: "서버 인프라 업그레이드로 더욱 안정적인 거래 환경을 제공합니다." },
              { badge: "투자정보", date: "2026.06.01", title: "S&P500 주간 전망 — 연준 발언 주목", excerpt: "이번 주 연준 의사록 공개를 앞두고 시장 변동성이 예상됩니다." },
            ].map((n) => (
              <div key={n.title} className="bg-white rounded-2xl p-6 shadow-sm hover:shadow-md transition-shadow cursor-pointer">
                <div className="flex items-center gap-2 mb-3">
                  <span className="px-2 py-0.5 bg-indigo-50 text-indigo-600 text-xs font-semibold rounded-full">{n.badge}</span>
                  <span className="text-gray-400 text-xs">{n.date}</span>
                </div>
                <h3 className="font-bold text-gray-900 text-sm leading-snug mb-2">{n.title}</h3>
                <p className="text-gray-500 text-xs leading-relaxed">{n.excerpt}</p>
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* ── Stats ── */}
      <section className="py-12 bg-white border-t border-gray-100">
        <div className="max-w-7xl mx-auto px-8">
          <div className="grid grid-cols-4 gap-8 text-center">
            {[
              { label: "누적 회원수", value: "12,400+", unit: "명" },
              { label: "일 평균 거래량", value: "3.2억", unit: "원" },
              { label: "서비스 운영", value: "24/7", unit: "" },
              { label: "거래 정확도", value: "99.9", unit: "%" },
            ].map((s) => (
              <div key={s.label}>
                <div className="text-3xl font-black text-indigo-600">{s.value}<span className="text-lg ml-0.5">{s.unit}</span></div>
                <div className="text-sm text-gray-500 mt-1">{s.label}</div>
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* ── Footer ── */}
      <footer className="bg-gray-900 text-gray-400 py-10">
        <div className="max-w-7xl mx-auto px-8">
          <div className="flex items-start justify-between mb-6">
            <div>
              <div className="text-white font-black text-xl mb-1">MIB</div>
              <div className="text-xs">대한민국 대표 글로벌 투자 거래소</div>
            </div>
            <div className="flex gap-6 text-xs">
              {["개인정보처리방침", "이용약관", "고객센터", "1:1 문의"].map(l => (
                <a key={l} className="hover:text-white cursor-pointer transition-colors">{l}</a>
              ))}
            </div>
          </div>
          <div className="border-t border-gray-800 pt-6 text-xs text-gray-500">
            <p>Copyright © 2026 MIB Global Exchange. All rights reserved.</p>
          </div>
        </div>
      </footer>
    </div>
  );
}
