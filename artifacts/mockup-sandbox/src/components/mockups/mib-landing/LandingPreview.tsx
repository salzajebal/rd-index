import { useState } from "react";

const CANDLES = [
  { o:100,h:108,l:97,c:105 }, { o:105,h:112,l:103,c:110 },
  { o:110,h:115,l:106,c:108 }, { o:108,h:114,l:105,c:112 },
  { o:112,h:118,l:109,c:115 }, { o:115,h:120,l:111,c:113 },
  { o:113,h:117,l:108,c:116 }, { o:116,h:122,l:114,c:120 },
  { o:120,h:125,l:117,c:118 }, { o:118,h:124,l:115,c:122 },
  { o:122,h:128,l:119,c:126 }, { o:126,h:130,l:122,c:124 },
  { o:124,h:129,l:121,c:127 }, { o:127,h:133,l:124,c:131 },
  { o:131,h:136,l:128,c:130 }, { o:130,h:135,l:127,c:133 },
  { o:133,h:138,l:130,c:136 }, { o:136,h:140,l:132,c:134 },
  { o:134,h:139,l:131,c:137 }, { o:137,h:142,l:134,c:140 },
];

function CandleChart() {
  const w = 560; const h = 160;
  const pad = 10;
  const allVals = CANDLES.flatMap(c=>[c.h,c.l]);
  const minV = Math.min(...allVals)-2;
  const maxV = Math.max(...allVals)+2;
  const scale = (v:number) => h - pad - ((v-minV)/(maxV-minV))*(h-2*pad);
  const cw = (w - pad*2) / CANDLES.length;
  return (
    <svg width={w} height={h} className="w-full">
      {/* grid lines */}
      {[0,0.25,0.5,0.75,1].map(t=>(
        <line key={t} x1={pad} x2={w-pad} y1={pad+(1-t)*(h-2*pad)} y2={pad+(1-t)*(h-2*pad)}
          stroke="#ffffff0d" strokeWidth="1"/>
      ))}
      {CANDLES.map((c,i)=>{
        const x = pad + i*cw + cw*0.1;
        const bw = cw*0.8;
        const isUp = c.c >= c.o;
        const color = isUp ? "#22c55e" : "#ef4444";
        const top = scale(Math.max(c.o,c.c));
        const bot = scale(Math.min(c.o,c.c));
        const bh = Math.max(bot-top,2);
        const cx2 = x+bw/2;
        return (
          <g key={i}>
            <line x1={cx2} x2={cx2} y1={scale(c.h)} y2={scale(c.l)} stroke={color} strokeWidth="1.5"/>
            <rect x={x} y={top} width={bw} height={bh} fill={color} rx="1"/>
          </g>
        );
      })}
    </svg>
  );
}

const ORDERBOOK = {
  asks: [
    {price:"5,328.50",qty:"12.4",total:"66,073.4"},
    {price:"5,327.00",qty:"8.7",total:"46,344.9"},
    {price:"5,325.75",qty:"23.1",total:"123,024.8"},
    {price:"5,324.00",qty:"5.2",total:"27,684.8"},
    {price:"5,322.50",qty:"18.9",total:"100,595.3"},
  ],
  bids: [
    {price:"5,320.00",qty:"31.2",total:"165,984.0"},
    {price:"5,318.50",qty:"9.8",total:"52,121.3"},
    {price:"5,317.00",qty:"14.6",total:"77,628.2"},
    {price:"5,315.25",qty:"7.3",total:"38,801.3"},
    {price:"5,313.00",qty:"20.5",total:"108,916.5"},
  ]
};

const ASSETS = [
  { sym:"SP500", name:"S&P 500", price:"5,320.00", change:"+0.42%", high:"5,332.10", low:"5,301.80", vol:"HIGH", up:true },
  { sym:"DOW",  name:"다우존스", price:"39,500.00", change:"-0.18%", high:"39,621.00", low:"39,388.50", vol:"MID", up:false },
  { sym:"DXY",  name:"달러(DXY)",price:"104.50",    change:"+0.05%", high:"104.72",   low:"104.31",    vol:"LOW", up:true },
];

export function LandingPreview() {
  const [selected, setSelected] = useState(0);
  const [tab, setTab] = useState<"buy"|"sell">("buy");
  const [amount, setAmount] = useState("");
  const asset = ASSETS[selected];

  return (
    <div className="min-h-screen text-white" style={{background:"#0b0e1a", fontFamily:"'Pretendard','Apple SD Gothic Neo',sans-serif"}}>

      {/* ── 실시간 티커바 ── */}
      <div style={{background:"#0f1322", borderBottom:"1px solid #1e2340"}} className="py-1.5 px-4 flex items-center gap-6 text-xs overflow-hidden">
        <span style={{color:"#f59e0b"}} className="font-bold shrink-0">▶ LIVE</span>
        {ASSETS.map(a=>(
          <span key={a.sym} className="flex items-center gap-1.5 shrink-0">
            <span className="text-gray-400">{a.sym}</span>
            <span className="font-semibold text-white">{a.price}</span>
            <span style={{color: a.up?"#22c55e":"#ef4444"}}>{a.change}</span>
          </span>
        ))}
        <span className="text-gray-600 shrink-0">|</span>
        <span className="text-gray-500 shrink-0 text-xs">서울 09:24:38 KST</span>
      </div>

      {/* ── 네비게이션 ── */}
      <header style={{background:"#0f1322", borderBottom:"1px solid #1e2340"}} className="px-6 h-14 flex items-center justify-between">
        <div className="flex items-center gap-8">
          <div className="flex items-center gap-2">
            <span style={{color:"#f59e0b"}} className="text-xl font-black tracking-widest">MIB</span>
            <span className="text-xs text-gray-500 hidden md:block">글로벌 투자 거래소</span>
          </div>
          <nav className="flex items-center gap-5">
            {["거래소","시세","공지사항","고객센터"].map(m=>(
              <span key={m} className="text-sm text-gray-400 hover:text-white cursor-pointer transition-colors">{m}</span>
            ))}
          </nav>
        </div>
        <div className="flex items-center gap-2">
          <button style={{color:"#f59e0b",border:"1px solid #f59e0b33"}} className="px-4 py-1.5 rounded text-xs font-medium hover:bg-amber-500/10 transition-colors">로그인</button>
          <button style={{background:"#f59e0b",color:"#000"}} className="px-4 py-1.5 rounded text-xs font-bold hover:bg-amber-400 transition-colors">회원가입</button>
        </div>
      </header>

      {/* ── 메인 영역 ── */}
      <div className="flex gap-0" style={{minHeight:"calc(100vh - 88px)"}}>

        {/* 왼쪽 — 종목 선택 사이드바 */}
        <aside style={{background:"#0d1020", borderRight:"1px solid #1e2340", width:180}} className="shrink-0 p-3">
          <div className="text-xs text-gray-500 mb-2 px-1 font-semibold tracking-wide">종목</div>
          {ASSETS.map((a,i)=>(
            <button key={a.sym} onClick={()=>setSelected(i)}
              style={{background: selected===i?"#1e2340":"transparent", border: selected===i?"1px solid #f59e0b33":"1px solid transparent"}}
              className="w-full text-left p-2.5 rounded-lg mb-1 transition-all">
              <div className="flex items-center justify-between">
                <span className="text-xs font-bold text-white">{a.sym}</span>
                <span style={{color:a.up?"#22c55e":"#ef4444"}} className="text-xs font-medium">{a.change}</span>
              </div>
              <div className="text-xs text-gray-300 font-semibold mt-0.5">{a.price}</div>
              <div className="text-xs text-gray-600 mt-0.5">{a.name}</div>
            </button>
          ))}

          <div className="mt-4 pt-4" style={{borderTop:"1px solid #1e2340"}}>
            <div className="text-xs text-gray-500 mb-2 px-1 font-semibold">내 잔고</div>
            <div style={{background:"#1e2340"}} className="rounded-lg p-2.5">
              <div className="text-xs text-gray-400">보유금액</div>
              <div className="text-sm font-bold text-white mt-0.5">₩ 1,250,000</div>
            </div>
          </div>
        </aside>

        {/* 중앙 — 차트 + 호가창 */}
        <main className="flex-1 flex flex-col">
          {/* 종목 헤더 */}
          <div style={{background:"#0f1322", borderBottom:"1px solid #1e2340"}} className="px-5 py-3 flex items-center gap-6">
            <div>
              <span className="text-base font-black text-white">{asset.name}</span>
              <span className="text-gray-500 text-xs ml-2">{asset.sym} / KRW</span>
            </div>
            <div className="text-xl font-black" style={{color: asset.up?"#22c55e":"#ef4444"}}>{asset.price}</div>
            <div style={{color: asset.up?"#22c55e":"#ef4444"}} className="text-sm font-semibold">{asset.change}</div>
            <div className="flex items-center gap-4 ml-2 text-xs text-gray-500">
              <span>고가 <span className="text-red-400">{asset.high}</span></span>
              <span>저가 <span className="text-blue-400">{asset.low}</span></span>
              <span className="px-2 py-0.5 rounded" style={{background:"#1e2340"}}>변동성 {asset.vol}</span>
            </div>
          </div>

          {/* 차트 */}
          <div style={{background:"#0b0e1a", borderBottom:"1px solid #1e2340"}} className="p-4 flex-1">
            <div className="flex items-center gap-3 mb-3">
              {["1분","3분","5분","15분"].map((t,i)=>(
                <button key={t} style={{background: i===1?"#f59e0b22":"transparent", color: i===1?"#f59e0b":"#6b7280", border: i===1?"1px solid #f59e0b44":"1px solid transparent"}}
                  className="text-xs px-3 py-1 rounded transition-all">{t}</button>
              ))}
              <span className="ml-auto text-xs text-gray-600">캔들스틱</span>
            </div>
            <CandleChart />
            {/* x축 시간 */}
            <div className="flex justify-between px-2 mt-1">
              {["09:00","09:05","09:10","09:15","09:20","09:24"].map(t=>(
                <span key={t} className="text-xs text-gray-700">{t}</span>
              ))}
            </div>
          </div>

          {/* 호가창 */}
          <div style={{background:"#0d1020"}} className="px-4 py-3">
            <div className="text-xs text-gray-500 font-semibold mb-2">호가창</div>
            <div className="grid grid-cols-2 gap-3">
              <div>
                <div className="grid grid-cols-3 text-xs text-gray-600 mb-1 px-1">
                  <span>매도가</span><span className="text-center">수량</span><span className="text-right">잔량</span>
                </div>
                {ORDERBOOK.asks.map((r,i)=>(
                  <div key={i} className="grid grid-cols-3 text-xs py-0.5 px-1 hover:bg-red-500/5 rounded">
                    <span className="text-red-400 font-medium">{r.price}</span>
                    <span className="text-center text-gray-400">{r.qty}</span>
                    <span className="text-right text-gray-500">{r.total}</span>
                  </div>
                ))}
              </div>
              <div>
                <div className="grid grid-cols-3 text-xs text-gray-600 mb-1 px-1">
                  <span>매수가</span><span className="text-center">수량</span><span className="text-right">잔량</span>
                </div>
                {ORDERBOOK.bids.map((r,i)=>(
                  <div key={i} className="grid grid-cols-3 text-xs py-0.5 px-1 hover:bg-green-500/5 rounded">
                    <span className="text-green-400 font-medium">{r.price}</span>
                    <span className="text-center text-gray-400">{r.qty}</span>
                    <span className="text-right text-gray-500">{r.total}</span>
                  </div>
                ))}
              </div>
            </div>
          </div>
        </main>

        {/* 오른쪽 — 주문 패널 */}
        <aside style={{background:"#0d1020", borderLeft:"1px solid #1e2340", width:220}} className="shrink-0 p-4">
          {/* 매수/매도 탭 */}
          <div style={{background:"#0b0e1a", borderRadius:8}} className="flex mb-4 p-1">
            <button onClick={()=>setTab("buy")}
              style={{background: tab==="buy"?"#ef4444":"transparent", flex:1}}
              className="py-2 text-xs font-bold rounded-md transition-all text-white">
              매수 (상승)
            </button>
            <button onClick={()=>setTab("sell")}
              style={{background: tab==="sell"?"#3b82f6":"transparent", flex:1}}
              className="py-2 text-xs font-bold rounded-md transition-all text-white">
              매도 (하락)
            </button>
          </div>

          {/* 진입가 */}
          <div style={{background:"#1e2340", borderRadius:8}} className="p-3 mb-3">
            <div className="text-xs text-gray-500 mb-1">현재가 (진입가)</div>
            <div style={{color: asset.up?"#22c55e":"#ef4444"}} className="text-lg font-black">{asset.price}</div>
            <div className="text-xs text-gray-600 mt-0.5">{asset.name}</div>
          </div>

          {/* 거래 시간 */}
          <div className="mb-3">
            <div className="text-xs text-gray-500 mb-1.5">거래 시간</div>
            <div className="grid grid-cols-1 gap-1.5">
              {[{label:"5분 거래", val:"300"}].map(d=>(
                <button key={d.val} style={{background:"#f59e0b22", border:"1px solid #f59e0b66", color:"#f59e0b"}}
                  className="py-2 rounded text-xs font-bold">{d.label}</button>
              ))}
            </div>
          </div>

          {/* 금액 입력 */}
          <div className="mb-3">
            <div className="text-xs text-gray-500 mb-1.5">투자 금액</div>
            <div style={{background:"#1e2340", border:"1px solid #2e3560", borderRadius:8}} className="flex items-center px-3 py-2">
              <input value={amount} onChange={e=>setAmount(e.target.value)}
                placeholder="금액 입력" className="flex-1 bg-transparent text-sm text-white outline-none placeholder-gray-600 w-0"/>
              <span className="text-xs text-gray-500 shrink-0">원</span>
            </div>
            <div className="grid grid-cols-4 gap-1 mt-1.5">
              {["1만","5만","10만","전액"].map(v=>(
                <button key={v} style={{background:"#1e2340", border:"1px solid #2e3560"}}
                  className="py-1 rounded text-xs text-gray-400 hover:text-white hover:border-amber-500/40 transition-colors">{v}</button>
              ))}
            </div>
          </div>

          {/* 거래 버튼 */}
          <button style={{background: tab==="buy"?"#ef4444":"#3b82f6", width:"100%"}}
            className="py-3 rounded-lg text-sm font-black text-white hover:opacity-90 transition-opacity">
            {tab==="buy" ? "▲ 매수 (상승 예측)" : "▼ 매도 (하락 예측)"}
          </button>

          {/* 최소 금액 안내 */}
          <div className="text-center text-xs text-gray-600 mt-2">최소 10,000원 / 5분 거래</div>

          {/* 진행중 베팅 */}
          <div style={{borderTop:"1px solid #1e2340"}} className="mt-4 pt-4">
            <div className="text-xs text-gray-500 font-semibold mb-2">진행중인 거래</div>
            <div style={{background:"#1e2340", borderRadius:8}} className="p-2.5">
              <div className="flex items-center justify-between">
                <span className="text-xs text-gray-400">SP500 매수</span>
                <span className="text-xs text-green-400">+3:42</span>
              </div>
              <div className="text-xs font-bold text-white mt-0.5">₩ 50,000</div>
              <div className="text-xs text-gray-500">진입가 5,318.20</div>
            </div>
          </div>
        </aside>
      </div>
    </div>
  );
}
