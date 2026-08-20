export const FOREX_SYMBOLS = ['SP500', 'CRUDE', 'GOLD', 'DOW', 'VIX'] as const;
export type ForexSymbol = typeof FOREX_SYMBOLS[number];

export const FOREX_DISPLAY: Record<ForexSymbol, { name: string; pair: string; flag: string }> = {
  SP500: { name: 'S&P500', pair: 'S&P 500 Index', flag: '📈' },
  CRUDE: { name: '크루드오일', pair: 'WTI Crude Oil', flag: '🛢️' },
  GOLD: { name: 'GOLD', pair: 'Gold Futures', flag: '🥇' },
  DOW: { name: '다우존스', pair: 'Dow Jones', flag: '📊' },
  VIX: { name: 'VIX', pair: 'Volatility Index', flag: '〽️' },
};

export const FINNHUB_TICKER_MAP: Record<ForexSymbol, string> = {
  SP500: 'SP500',
  CRUDE: 'CL=F',
  GOLD: 'GC=F',
  DOW: 'DOW',
  VIX: '^VIX',
};

export const TRADING_GAMES = [
  { id: 'SP500-120', symbol: 'SP500', duration: 120, label: 'S&P500 CFD' },
  { id: 'CRUDE-120', symbol: 'CRUDE', duration: 120, label: '크루드오일' },
  { id: 'GOLD-120', symbol: 'GOLD', duration: 120, label: 'GOLD' },
  { id: 'DOW-120', symbol: 'DOW', duration: 120, label: '다우존스' },
  { id: 'VIX-120', symbol: 'VIX', duration: 120, label: 'VIX' },
] as const;

export type TradingGame = typeof TRADING_GAMES[number];
