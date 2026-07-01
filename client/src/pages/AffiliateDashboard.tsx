import { useState, useEffect, useRef } from 'react';
import { useQuery, useMutation, useQueryClient } from '@tanstack/react-query';
import { Button } from '@/components/ui/button';
import { Input } from '@/components/ui/input';
import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card';
import { Textarea } from '@/components/ui/textarea';
import { toast } from 'sonner';
import { cn } from '@/lib/utils';
import {
  Users,
  LogOut,
  BarChart3,
  MessageSquare,
  Copy,
  ChevronDown,
  ChevronUp,
  Clock,
  CheckCircle,
  ShoppingCart,
  Settings,
  TrendingUp,
  TrendingDown,
} from 'lucide-react';

interface AffiliateAuth {
  id: string;
  username: string;
  displayName: string;
  referralCode: string;
  commissionRate: string;
}

interface AffiliateSummary {
  totalUsers: number;
  recentUsers: { id: string; username: string; name: string | null; createdAt: string }[];
}

interface AffiliateUser {
  id: string;
  username: string;
  name: string | null;
  phone: string | null;
  balance: string;
  totalBet: string;
  totalWin: string;
  betCount: number;
  winCount: number;
  isActive: boolean;
  isBettingBlocked: boolean;
  createdAt: string;
  lastLoginAt: string | null;
}

interface AffiliateInquiry {
  id: number;
  userId: string;
  username: string;
  userName: string | null;
  title: string;
  content: string;
  reply: string | null;
  status: string;
  createdAt: string;
  repliedAt: string | null;
}

interface AffiliateBet {
  id: number;
  userId: string;
  username: string;
  userName: string;
  symbol: string;
  direction: string;
  amount: string;
  duration: number;
  outcome: string | null;
  profit: string | null;
  strikePrice: string | null;
  closePrice: string | null;
  createdAt: string;
  resolvedAt: string | null;
}

function AffiliateLogin({ onLogin }: { onLogin: () => void }) {
  const [username, setUsername] = useState('');
  const [password, setPassword] = useState('');
  const [loading, setLoading] = useState(false);

  const handleLogin = async () => {
    if (!username || !password) { toast.error('아이디와 비밀번호를 입력해주세요'); return; }
    setLoading(true);
    try {
      const res = await fetch('/api/affiliate/login', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ username, password }),
      });
      if (!res.ok) {
        const error = await res.json();
        throw new Error(error.error || '로그인에 실패했습니다');
      }
      toast.success('로그인 성공');
      onLogin();
    } catch (error: any) {
      toast.error(error.message);
    } finally {
      setLoading(false);
    }
  };

  return (
    <div className="min-h-screen bg-background flex items-center justify-center">
      <div className="w-full max-w-md px-4">
        <Card className="bg-card border-border">
          <CardHeader className="text-center pb-4">
            <img
              src="/mib-icon.png"
              alt="MIB INDEX"
              className="w-20 h-20 mx-auto rounded-xl mb-4 object-contain"
              onError={(e) => { e.currentTarget.style.display = 'none'; }}
            />
            <CardTitle className="text-2xl">총판 로그인</CardTitle>
            <p className="text-muted-foreground text-sm">MIB INDEX 총판 관리 시스템</p>
          </CardHeader>
          <CardContent className="space-y-4">
            <div className="space-y-1">
              <label className="text-sm text-muted-foreground">아이디</label>
              <Input
                value={username}
                onChange={(e) => setUsername(e.target.value)}
                placeholder="총판 아이디"
                onKeyDown={(e) => e.key === 'Enter' && handleLogin()}
              />
            </div>
            <div className="space-y-1">
              <label className="text-sm text-muted-foreground">비밀번호</label>
              <Input
                type="password"
                value={password}
                onChange={(e) => setPassword(e.target.value)}
                placeholder="비밀번호"
                onKeyDown={(e) => e.key === 'Enter' && handleLogin()}
              />
            </div>
            <Button className="w-full" onClick={handleLogin} disabled={loading}>
              {loading ? '로그인 중...' : '로그인'}
            </Button>
          </CardContent>
        </Card>
      </div>
    </div>
  );
}

type TabType = 'dashboard' | 'users' | 'orders' | 'member-settings' | 'inquiries';

export default function AffiliateDashboard() {
  const queryClient = useQueryClient();
  const [activeTab, setActiveTab] = useState<TabType>('dashboard');
  const [expandedInquiry, setExpandedInquiry] = useState<number | null>(null);
  const [replyText, setReplyText] = useState<Record<number, string>>({});
  const [blockingUserId, setBlockingUserId] = useState<string | null>(null);

  const { data: auth, isLoading: authLoading, refetch: refetchAuth } = useQuery<AffiliateAuth | null>({
    queryKey: ['/api/affiliate/me'],
    queryFn: async () => {
      const res = await fetch('/api/affiliate/me');
      if (!res.ok) return null;
      return res.json();
    },
  });

  const { data: summary } = useQuery<AffiliateSummary>({
    queryKey: ['/api/affiliate/summary'],
    queryFn: async () => {
      const res = await fetch('/api/affiliate/summary');
      if (!res.ok) throw new Error('Failed');
      return res.json();
    },
    enabled: !!auth,
    refetchInterval: 30000,
  });

  const { data: users = [], refetch: refetchUsers } = useQuery<AffiliateUser[]>({
    queryKey: ['/api/affiliate/users'],
    queryFn: async () => {
      const res = await fetch('/api/affiliate/users');
      if (!res.ok) throw new Error('Failed');
      return res.json();
    },
    enabled: !!auth && (activeTab === 'users' || activeTab === 'member-settings'),
    refetchInterval: activeTab === 'users' || activeTab === 'member-settings' ? 15000 : false,
  });

  const { data: bets = [] } = useQuery<AffiliateBet[]>({
    queryKey: ['/api/affiliate/bets'],
    queryFn: async () => {
      const res = await fetch('/api/affiliate/bets');
      if (!res.ok) throw new Error('Failed');
      return res.json();
    },
    enabled: !!auth && activeTab === 'orders',
    refetchInterval: activeTab === 'orders' ? 15000 : false,
  });

  const { data: inquiries = [], refetch: refetchInquiries } = useQuery<AffiliateInquiry[]>({
    queryKey: ['/api/affiliate/inquiries'],
    queryFn: async () => {
      const res = await fetch('/api/affiliate/inquiries');
      if (!res.ok) throw new Error('Failed');
      return res.json();
    },
    enabled: !!auth,
    refetchInterval: 10000,
  });

  const logout = useMutation({
    mutationFn: async () => { await fetch('/api/affiliate/logout', { method: 'POST' }); },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ['/api/affiliate/me'] });
      toast.success('로그아웃 되었습니다');
    },
  });

  const replyMutation = useMutation({
    mutationFn: async ({ id, reply }: { id: number; reply: string }) => {
      const res = await fetch(`/api/affiliate/inquiries/${id}/reply`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ reply }),
      });
      if (!res.ok) { const e = await res.json(); throw new Error(e.error || '답변 실패'); }
      return res.json();
    },
    onSuccess: (_, { id }) => {
      toast.success('답변이 등록되었습니다');
      setReplyText(prev => { const n = { ...prev }; delete n[id]; return n; });
      setExpandedInquiry(null);
      refetchInquiries();
    },
    onError: (e: any) => toast.error(e.message),
  });

  const blockMutation = useMutation({
    mutationFn: async ({ userId, isBettingBlocked }: { userId: string; isBettingBlocked: boolean }) => {
      const res = await fetch(`/api/affiliate/users/${userId}/settings`, {
        method: 'PATCH',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ isBettingBlocked }),
      });
      if (!res.ok) { const e = await res.json(); throw new Error(e.error || '설정 실패'); }
      return res.json();
    },
    onSuccess: (_, { isBettingBlocked }) => {
      toast.success(isBettingBlocked ? '배팅이 차단되었습니다' : '배팅 차단이 해제되었습니다');
      setBlockingUserId(null);
      refetchUsers();
    },
    onError: (e: any) => {
      toast.error(e.message);
      setBlockingUserId(null);
    },
  });

  const handleToggleBlock = (user: AffiliateUser) => {
    setBlockingUserId(user.id);
    blockMutation.mutate({ userId: user.id, isBettingBlocked: !user.isBettingBlocked });
  };

  const copyToClipboard = (text: string) => {
    navigator.clipboard.writeText(text);
    toast.success('복사되었습니다');
  };

  const formatDate = (dateStr: string) =>
    new Date(dateStr).toLocaleDateString('ko-KR', { year: 'numeric', month: '2-digit', day: '2-digit' });

  const formatDateTime = (dateStr: string) =>
    new Date(dateStr).toLocaleString('ko-KR', { year: 'numeric', month: '2-digit', day: '2-digit', hour: '2-digit', minute: '2-digit' });

  const formatMoney = (amount: string | number) => {
    const num = typeof amount === 'string' ? parseFloat(amount) : amount;
    if (isNaN(num)) return '0원';
    return Math.floor(num).toLocaleString() + '원';
  };

  const pendingCount = inquiries.filter(i => i.status === 'pending').length;

  const prevPendingRef = useRef<number | null>(null);
  useEffect(() => {
    if (!auth) return;
    if (prevPendingRef.current === null) {
      prevPendingRef.current = pendingCount;
      return;
    }
    if (pendingCount > prevPendingRef.current) {
      const diff = pendingCount - prevPendingRef.current;
      toast.info(`새 1:1 문의가 ${diff}건 접수되었습니다`, { duration: 6000 });
    }
    prevPendingRef.current = pendingCount;
  }, [pendingCount, auth]);

  useEffect(() => {
    if (!auth) return;
    document.title = pendingCount > 0
      ? `(${pendingCount}) MIB INDEX 총판`
      : 'MIB INDEX 총판';
    return () => { document.title = 'MIB INDEX'; };
  }, [pendingCount, auth]);

  if (authLoading) {
    return (
      <div className="min-h-screen bg-background flex items-center justify-center">
        <div className="animate-spin w-8 h-8 border-2 border-primary border-t-transparent rounded-full" />
      </div>
    );
  }

  if (!auth) return <AffiliateLogin onLogin={() => refetchAuth()} />;

  const navItems: { id: TabType; label: string; icon: any; badge?: number }[] = [
    { id: 'dashboard', label: '대시보드', icon: BarChart3 },
    { id: 'users', label: '소속 회원', icon: Users },
    { id: 'orders', label: '주문내역', icon: ShoppingCart },
    { id: 'member-settings', label: '회차별 설정', icon: Settings },
    { id: 'inquiries', label: '1:1 문의', icon: MessageSquare, badge: pendingCount },
  ];

  return (
    <div className="min-h-screen bg-background flex">
      {/* Sidebar */}
      <div className="w-52 bg-card border-r border-border flex flex-col shrink-0">
        <div className="p-4 border-b border-border">
          <div className="flex items-center gap-2">
            <img
              src="/mib-icon.png"
              alt="MIB INDEX"
              className="w-9 h-9 rounded-lg object-contain"
            />
            <div>
              <p className="font-bold text-sm">MIB INDEX</p>
              <p className="text-xs text-muted-foreground">총판 대시보드</p>
            </div>
          </div>
        </div>

        <nav className="flex-1 p-3 space-y-1">
          {navItems.map(({ id, label, icon: Icon, badge }) => (
            <button
              key={id}
              onClick={() => setActiveTab(id)}
              className={cn(
                'w-full flex items-center gap-3 px-3 py-2 rounded-lg text-sm transition-colors',
                activeTab === id
                  ? 'bg-primary/10 text-primary'
                  : 'text-muted-foreground hover:bg-muted/50 hover:text-foreground'
              )}
            >
              <Icon className="w-4 h-4 shrink-0" />
              <span className="flex-1 text-left">{label}</span>
              {badge != null && badge > 0 && (
                <span className="bg-destructive text-destructive-foreground text-xs rounded-full w-5 h-5 flex items-center justify-center font-bold">
                  {badge}
                </span>
              )}
            </button>
          ))}
        </nav>

        <div className="p-3 border-t border-border space-y-2">
          <div className="px-3 py-2">
            <p className="text-xs font-medium">{auth.displayName}</p>
            <p className="text-xs text-muted-foreground">{auth.username}</p>
          </div>
          <Button
            variant="ghost"
            size="sm"
            className="w-full justify-start gap-2 text-muted-foreground"
            onClick={() => logout.mutate()}
          >
            <LogOut className="w-4 h-4" />
            로그아웃
          </Button>
        </div>
      </div>

      {/* Main Content */}
      <div className="flex-1 overflow-auto">
        <div className="p-6 max-w-5xl mx-auto space-y-6">

          {/* Dashboard Tab */}
          {activeTab === 'dashboard' && (
            <>
              <div>
                <h1 className="text-xl font-bold">대시보드</h1>
                <p className="text-sm text-muted-foreground mt-0.5">{auth.displayName} 총판</p>
              </div>

              <div className="grid grid-cols-2 gap-4">
                <Card className="bg-card border-border">
                  <CardContent className="p-5">
                    <div className="flex items-center gap-3">
                      <div className="w-10 h-10 rounded-lg bg-primary/10 flex items-center justify-center">
                        <Users className="w-5 h-5 text-primary" />
                      </div>
                      <div>
                        <p className="text-xs text-muted-foreground">소속 회원</p>
                        <p className="text-2xl font-bold">{summary?.totalUsers ?? 0}<span className="text-sm font-normal ml-1">명</span></p>
                      </div>
                    </div>
                  </CardContent>
                </Card>

                <Card className="bg-card border-border">
                  <CardContent className="p-5">
                    <div className="flex items-center gap-3">
                      <div className="w-10 h-10 rounded-lg bg-orange-500/10 flex items-center justify-center">
                        <MessageSquare className="w-5 h-5 text-orange-500" />
                      </div>
                      <div>
                        <p className="text-xs text-muted-foreground">미답변 문의</p>
                        <p className="text-2xl font-bold">{pendingCount}<span className="text-sm font-normal ml-1">건</span></p>
                      </div>
                    </div>
                  </CardContent>
                </Card>
              </div>

              <Card className="bg-card border-border">
                <CardHeader className="pb-3">
                  <CardTitle className="text-base flex items-center gap-2">
                    <Copy className="w-4 h-4" />
                    가입 코드
                  </CardTitle>
                </CardHeader>
                <CardContent>
                  <div className="flex items-center gap-3">
                    <code className="bg-muted px-4 py-2 rounded-lg text-lg font-mono font-bold tracking-widest">
                      {auth.referralCode}
                    </code>
                    <Button variant="outline" size="sm" onClick={() => copyToClipboard(auth.referralCode)}>
                      <Copy className="w-4 h-4 mr-1" />
                      복사
                    </Button>
                  </div>
                  <p className="text-xs text-muted-foreground mt-2">회원 가입 시 이 코드를 입력하면 소속 회원으로 등록됩니다.</p>
                </CardContent>
              </Card>

              {(summary?.recentUsers?.length ?? 0) > 0 && (
                <Card className="bg-card border-border">
                  <CardHeader className="pb-3">
                    <CardTitle className="text-base">최근 가입 회원</CardTitle>
                  </CardHeader>
                  <CardContent>
                    <div className="space-y-2">
                      {summary!.recentUsers.map(u => (
                        <div key={u.id} className="flex items-center justify-between py-1">
                          <span className="text-sm font-medium">{u.username}</span>
                          <span className="text-xs text-muted-foreground">{formatDate(u.createdAt)}</span>
                        </div>
                      ))}
                    </div>
                  </CardContent>
                </Card>
              )}
            </>
          )}

          {/* Users Tab - 소속 회원 */}
          {activeTab === 'users' && (
            <>
              <div>
                <h1 className="text-xl font-bold">소속 회원</h1>
                <p className="text-sm text-muted-foreground mt-0.5">총 {users.length}명</p>
              </div>

              <Card className="bg-card border-border">
                <CardContent className="p-0">
                  <div className="overflow-x-auto">
                    <table className="w-full text-sm">
                      <thead className="bg-muted/50">
                        <tr>
                          <th className="px-4 py-3 text-left font-medium">아이디</th>
                          <th className="px-4 py-3 text-left font-medium">이름</th>
                          <th className="px-4 py-3 text-right font-medium">잔액</th>
                          <th className="px-4 py-3 text-right font-medium">총 배팅</th>
                          <th className="px-4 py-3 text-center font-medium">배팅수</th>
                          <th className="px-4 py-3 text-center font-medium">상태</th>
                          <th className="px-4 py-3 text-center font-medium">가입일</th>
                          <th className="px-4 py-3 text-center font-medium">최근 접속</th>
                        </tr>
                      </thead>
                      <tbody className="divide-y divide-border">
                        {users.length === 0 && (
                          <tr>
                            <td colSpan={8} className="px-4 py-8 text-center text-muted-foreground">소속 회원이 없습니다</td>
                          </tr>
                        )}
                        {users.map(u => (
                          <tr key={u.id} className="hover:bg-muted/20 transition-colors">
                            <td className="px-4 py-3 font-medium">{u.username}</td>
                            <td className="px-4 py-3 text-muted-foreground">{u.name || '-'}</td>
                            <td className="px-4 py-3 text-right">{formatMoney(u.balance)}</td>
                            <td className="px-4 py-3 text-right text-muted-foreground">{formatMoney(u.totalBet)}</td>
                            <td className="px-4 py-3 text-center text-muted-foreground">{u.betCount}회</td>
                            <td className="px-4 py-3 text-center">
                              {u.isBettingBlocked
                                ? <span className="text-xs bg-red-500/10 text-red-500 px-2 py-0.5 rounded">배팅차단</span>
                                : u.isActive
                                  ? <span className="text-xs bg-green-500/10 text-green-500 px-2 py-0.5 rounded">활성</span>
                                  : <span className="text-xs bg-muted text-muted-foreground px-2 py-0.5 rounded">비활성</span>}
                            </td>
                            <td className="px-4 py-3 text-center text-xs text-muted-foreground">{formatDate(u.createdAt)}</td>
                            <td className="px-4 py-3 text-center text-xs text-muted-foreground">
                              {u.lastLoginAt ? formatDate(u.lastLoginAt) : '-'}
                            </td>
                          </tr>
                        ))}
                      </tbody>
                    </table>
                  </div>
                </CardContent>
              </Card>
            </>
          )}

          {/* Orders Tab - 주문내역 */}
          {activeTab === 'orders' && (
            <>
              <div>
                <h1 className="text-xl font-bold">주문내역</h1>
                <p className="text-sm text-muted-foreground mt-0.5">소속 회원 최근 거래 {bets.length}건</p>
              </div>

              <Card className="bg-card border-border">
                <CardContent className="p-0">
                  <div className="overflow-x-auto">
                    <table className="w-full text-sm">
                      <thead className="bg-muted/50">
                        <tr>
                          <th className="px-4 py-3 text-left font-medium">회원</th>
                          <th className="px-4 py-3 text-center font-medium">종목</th>
                          <th className="px-4 py-3 text-center font-medium">방향</th>
                          <th className="px-4 py-3 text-right font-medium">배팅금</th>
                          <th className="px-4 py-3 text-center font-medium">시간</th>
                          <th className="px-4 py-3 text-center font-medium">결과</th>
                          <th className="px-4 py-3 text-right font-medium">손익</th>
                          <th className="px-4 py-3 text-center font-medium">거래일시</th>
                        </tr>
                      </thead>
                      <tbody className="divide-y divide-border">
                        {bets.length === 0 && (
                          <tr>
                            <td colSpan={8} className="px-4 py-8 text-center text-muted-foreground">거래 내역이 없습니다</td>
                          </tr>
                        )}
                        {bets.map(bet => {
                          const isWin = bet.outcome === 'win';
                          const isLose = bet.outcome === 'lose';
                          const isPending = !bet.outcome;
                          const profit = bet.profit ? parseFloat(bet.profit) : null;
                          return (
                            <tr key={bet.id} className="hover:bg-muted/20 transition-colors">
                              <td className="px-4 py-3">
                                <span className="font-medium">{bet.username}</span>
                                {bet.userName && bet.userName !== '-' && (
                                  <span className="text-xs text-muted-foreground ml-1">({bet.userName})</span>
                                )}
                              </td>
                              <td className="px-4 py-3 text-center font-mono text-xs">{bet.symbol}</td>
                              <td className="px-4 py-3 text-center">
                                {bet.direction === 'up'
                                  ? <span className="inline-flex items-center gap-1 text-xs font-bold text-red-500"><TrendingUp className="w-3 h-3" />상승</span>
                                  : <span className="inline-flex items-center gap-1 text-xs font-bold text-blue-500"><TrendingDown className="w-3 h-3" />하락</span>}
                              </td>
                              <td className="px-4 py-3 text-right font-medium">{formatMoney(bet.amount)}</td>
                              <td className="px-4 py-3 text-center text-xs text-muted-foreground">{bet.duration / 60}분</td>
                              <td className="px-4 py-3 text-center">
                                {isPending
                                  ? <span className="text-xs bg-yellow-500/10 text-yellow-500 px-2 py-0.5 rounded">진행중</span>
                                  : isWin
                                    ? <span className="text-xs bg-green-500/10 text-green-500 px-2 py-0.5 rounded">승리</span>
                                    : <span className="text-xs bg-red-500/10 text-red-500 px-2 py-0.5 rounded">패배</span>}
                              </td>
                              <td className="px-4 py-3 text-right">
                                {profit !== null
                                  ? <span className={profit >= 0 ? 'text-green-500 font-medium' : 'text-red-500 font-medium'}>
                                      {profit >= 0 ? '+' : ''}{formatMoney(profit)}
                                    </span>
                                  : <span className="text-muted-foreground">-</span>}
                              </td>
                              <td className="px-4 py-3 text-center text-xs text-muted-foreground">{formatDateTime(bet.createdAt)}</td>
                            </tr>
                          );
                        })}
                      </tbody>
                    </table>
                  </div>
                </CardContent>
              </Card>
            </>
          )}

          {/* Member Settings Tab - 회차별 설정 */}
          {activeTab === 'member-settings' && (
            <>
              <div>
                <h1 className="text-xl font-bold">회차별 설정</h1>
                <p className="text-sm text-muted-foreground mt-0.5">소속 회원 배팅 차단 설정</p>
              </div>

              <Card className="bg-card border-border">
                <CardContent className="p-0">
                  <div className="overflow-x-auto">
                    <table className="w-full text-sm">
                      <thead className="bg-muted/50">
                        <tr>
                          <th className="px-4 py-3 text-left font-medium">아이디</th>
                          <th className="px-4 py-3 text-left font-medium">이름</th>
                          <th className="px-4 py-3 text-right font-medium">잔액</th>
                          <th className="px-4 py-3 text-center font-medium">계정 상태</th>
                          <th className="px-4 py-3 text-center font-medium">배팅 차단</th>
                          <th className="px-4 py-3 text-center font-medium">설정</th>
                        </tr>
                      </thead>
                      <tbody className="divide-y divide-border">
                        {users.length === 0 && (
                          <tr>
                            <td colSpan={6} className="px-4 py-8 text-center text-muted-foreground">소속 회원이 없습니다</td>
                          </tr>
                        )}
                        {users.map(u => (
                          <tr key={u.id} className="hover:bg-muted/20 transition-colors">
                            <td className="px-4 py-3 font-medium">{u.username}</td>
                            <td className="px-4 py-3 text-muted-foreground">{u.name || '-'}</td>
                            <td className="px-4 py-3 text-right">{formatMoney(u.balance)}</td>
                            <td className="px-4 py-3 text-center">
                              {u.isActive
                                ? <span className="text-xs bg-green-500/10 text-green-500 px-2 py-0.5 rounded">활성</span>
                                : <span className="text-xs bg-muted text-muted-foreground px-2 py-0.5 rounded">비활성</span>}
                            </td>
                            <td className="px-4 py-3 text-center">
                              {u.isBettingBlocked
                                ? <span className="text-xs bg-red-500/10 text-red-500 px-2 py-0.5 rounded font-medium">차단됨</span>
                                : <span className="text-xs bg-green-500/10 text-green-500 px-2 py-0.5 rounded">정상</span>}
                            </td>
                            <td className="px-4 py-3 text-center">
                              <Button
                                size="sm"
                                variant={u.isBettingBlocked ? 'outline' : 'destructive'}
                                className={cn(
                                  'text-xs h-7 px-3',
                                  !u.isBettingBlocked && 'bg-red-500/10 text-red-500 border-red-500/20 hover:bg-red-500/20'
                                )}
                                disabled={blockingUserId === u.id}
                                onClick={() => handleToggleBlock(u)}
                              >
                                {blockingUserId === u.id
                                  ? '처리중...'
                                  : u.isBettingBlocked
                                    ? '차단 해제'
                                    : '배팅 차단'}
                              </Button>
                            </td>
                          </tr>
                        ))}
                      </tbody>
                    </table>
                  </div>
                </CardContent>
              </Card>

              <div className="text-xs text-muted-foreground bg-muted/30 rounded-lg p-3">
                <p className="font-medium mb-1">안내</p>
                <p>배팅 차단 설정 시 해당 회원은 배팅을 진행할 수 없습니다. 어드민 권한이 필요한 추가 설정은 관리자에게 문의해주세요.</p>
              </div>
            </>
          )}

          {/* Inquiries Tab */}
          {activeTab === 'inquiries' && (
            <>
              <div>
                <h1 className="text-xl font-bold">1:1 문의</h1>
                <p className="text-sm text-muted-foreground mt-0.5">
                  소속 회원 문의 {inquiries.length}건 · 미답변 {pendingCount}건
                </p>
              </div>

              <div className="space-y-3">
                {inquiries.length === 0 && (
                  <Card className="bg-card border-border">
                    <CardContent className="py-10 text-center text-muted-foreground">
                      소속 회원의 문의가 없습니다
                    </CardContent>
                  </Card>
                )}
                {inquiries.map(inq => {
                  const isExpanded = expandedInquiry === inq.id;
                  const isPending = inq.status === 'pending';
                  return (
                    <Card key={inq.id} className={cn("bg-card border-border transition-colors", isPending && "border-orange-500/30")}>
                      <CardContent className="p-0">
                        <button
                          className="w-full text-left px-4 py-3 flex items-start gap-3"
                          onClick={() => setExpandedInquiry(isExpanded ? null : inq.id)}
                        >
                          <div className="mt-0.5 shrink-0">
                            {isPending
                              ? <Clock className="w-4 h-4 text-orange-500" />
                              : <CheckCircle className="w-4 h-4 text-green-500" />}
                          </div>
                          <div className="flex-1 min-w-0">
                            <div className="flex items-center gap-2 flex-wrap">
                              <span className="text-xs text-muted-foreground font-medium">{inq.username}</span>
                              {isPending
                                ? <span className="text-xs bg-orange-500/10 text-orange-500 px-1.5 py-0.5 rounded">미답변</span>
                                : <span className="text-xs bg-green-500/10 text-green-500 px-1.5 py-0.5 rounded">답변완료</span>}
                            </div>
                            <p className="text-sm font-medium mt-0.5 truncate">{inq.title}</p>
                            <p className="text-xs text-muted-foreground mt-0.5">{formatDateTime(inq.createdAt)}</p>
                          </div>
                          {isExpanded ? <ChevronUp className="w-4 h-4 text-muted-foreground shrink-0 mt-0.5" /> : <ChevronDown className="w-4 h-4 text-muted-foreground shrink-0 mt-0.5" />}
                        </button>

                        {isExpanded && (
                          <div className="px-4 pb-4 space-y-4 border-t border-border pt-3">
                            <div>
                              <p className="text-xs text-muted-foreground mb-1">문의 내용</p>
                              <p className="text-sm whitespace-pre-wrap bg-muted/30 rounded-lg p-3">{inq.content}</p>
                            </div>

                            {inq.reply && (
                              <div>
                                <p className="text-xs text-muted-foreground mb-1">기존 답변 ({inq.repliedAt ? formatDateTime(inq.repliedAt) : ''})</p>
                                <p className="text-sm whitespace-pre-wrap bg-primary/5 border border-primary/20 rounded-lg p-3">{inq.reply}</p>
                              </div>
                            )}

                            <div>
                              <p className="text-xs text-muted-foreground mb-1">{inq.reply ? '답변 수정' : '답변 작성'}</p>
                              <Textarea
                                className="min-h-[100px] text-sm"
                                placeholder="답변 내용을 입력하세요..."
                                value={replyText[inq.id] ?? (inq.reply || '')}
                                onChange={(e) => setReplyText(prev => ({ ...prev, [inq.id]: e.target.value }))}
                              />
                              <div className="flex justify-end mt-2">
                                <Button
                                  size="sm"
                                  onClick={() => replyMutation.mutate({ id: inq.id, reply: replyText[inq.id] ?? '' })}
                                  disabled={replyMutation.isPending || !(replyText[inq.id] ?? '').trim()}
                                >
                                  {replyMutation.isPending ? '등록 중...' : '답변 등록'}
                                </Button>
                              </div>
                            </div>
                          </div>
                        )}
                      </CardContent>
                    </Card>
                  );
                })}
              </div>
            </>
          )}
        </div>
      </div>
    </div>
  );
}
