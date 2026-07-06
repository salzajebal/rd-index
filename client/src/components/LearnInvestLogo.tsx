interface LogoProps {
  size?: number;
  height?: number;
  className?: string;
  variant?: "icon" | "full";
}

export function LearnInvestLogo({
  size,
  height,
  className = "",
  variant = "full",
}: LogoProps) {
  if (variant === "icon") {
    const h = size ?? height ?? 48;
    const w = h;
    return (
      <svg
        width={w}
        height={h}
        viewBox="0 0 64 64"
        fill="none"
        xmlns="http://www.w3.org/2000/svg"
        className={className}
      >
        <defs>
          <linearGradient id="rd-ibg" x1="0" y1="0" x2="64" y2="64" gradientUnits="userSpaceOnUse">
            <stop offset="0%" stopColor="#1A1005" />
            <stop offset="100%" stopColor="#0A0603" />
          </linearGradient>
          <linearGradient id="rd-igold" x1="0" y1="0" x2="0" y2="1">
            <stop offset="0%" stopColor="#F9E4A0" />
            <stop offset="45%" stopColor="#D9A63F" />
            <stop offset="100%" stopColor="#A8701E" />
          </linearGradient>
          <filter id="rd-iglow" x="-40%" y="-40%" width="180%" height="180%">
            <feGaussianBlur stdDeviation="1.4" result="b" />
            <feMerge><feMergeNode in="b" /><feMergeNode in="SourceGraphic" /></feMerge>
          </filter>
        </defs>

        <rect width="64" height="64" rx="15" fill="url(#rd-ibg)" />
        <rect x="0.75" y="0.75" width="62.5" height="62.5" rx="14.25" stroke="url(#rd-igold)" strokeOpacity="0.35" strokeWidth="1" fill="none" />

        <g filter="url(#rd-iglow)">
          <path
            d="M18 40V24h7.2c3.6 0 5.9 1.9 5.9 5.1 0 2.2-1.1 3.8-2.9 4.6l3.4 6.3h-3.9l-3-5.7h-3.1V40H18Zm3.6-8.6h3.2c1.7 0 2.7-.8 2.7-2.3s-1-2.3-2.7-2.3h-3.2v4.6Z"
            fill="url(#rd-igold)"
          />
          <path
            d="M35.6 40V24h5.6c5 0 8.2 3.2 8.2 8s-3.2 8-8.2 8h-5.6Zm3.6-3.1h1.8c3 0 4.7-1.9 4.7-4.9s-1.7-4.9-4.7-4.9h-1.8v9.8Z"
            fill="url(#rd-igold)"
          />
        </g>
      </svg>
    );
  }

  const h = size ?? height ?? 48;
  const aspectRatio = 210 / 64;
  const w = Math.round(h * aspectRatio);

  return (
    <svg
      width={w}
      height={h}
      viewBox="0 0 210 64"
      fill="none"
      xmlns="http://www.w3.org/2000/svg"
      className={className}
    >
      <defs>
        <linearGradient id="rd-bg" x1="0" y1="0" x2="64" y2="64" gradientUnits="userSpaceOnUse">
          <stop offset="0%" stopColor="#1A1005" />
          <stop offset="100%" stopColor="#0A0603" />
        </linearGradient>
        <linearGradient id="rd-gold" x1="0" y1="0" x2="0" y2="1">
          <stop offset="0%" stopColor="#F9E4A0" />
          <stop offset="45%" stopColor="#D9A63F" />
          <stop offset="100%" stopColor="#A8701E" />
        </linearGradient>
        <linearGradient id="rd-goldtext" x1="0" y1="0" x2="0" y2="1">
          <stop offset="0%" stopColor="#F9E8B4" />
          <stop offset="50%" stopColor="#D9A63F" />
          <stop offset="100%" stopColor="#9B6B1A" />
        </linearGradient>
        <linearGradient id="rd-subtext" x1="0" y1="0" x2="1" y2="0">
          <stop offset="0%" stopColor="#C9962E" />
          <stop offset="100%" stopColor="#C9962E" stopOpacity="0" />
        </linearGradient>
        <filter id="rd-glow" x="-40%" y="-40%" width="180%" height="180%">
          <feGaussianBlur stdDeviation="1.4" result="b" />
          <feMerge><feMergeNode in="b" /><feMergeNode in="SourceGraphic" /></feMerge>
        </filter>
      </defs>

      <rect width="64" height="64" rx="15" fill="url(#rd-bg)" />
      <rect x="0.75" y="0.75" width="62.5" height="62.5" rx="14.25" stroke="url(#rd-gold)" strokeOpacity="0.35" strokeWidth="1" fill="none" />

      <g filter="url(#rd-glow)">
        <path
          d="M18 40V24h7.2c3.6 0 5.9 1.9 5.9 5.1 0 2.2-1.1 3.8-2.9 4.6l3.4 6.3h-3.9l-3-5.7h-3.1V40H18Zm3.6-8.6h3.2c1.7 0 2.7-.8 2.7-2.3s-1-2.3-2.7-2.3h-3.2v4.6Z"
          fill="url(#rd-gold)"
        />
        <path
          d="M35.6 40V24h5.6c5 0 8.2 3.2 8.2 8s-3.2 8-8.2 8h-5.6Zm3.6-3.1h1.8c3 0 4.7-1.9 4.7-4.9s-1.7-4.9-4.7-4.9h-1.8v9.8Z"
          fill="url(#rd-gold)"
        />
      </g>

      <text
        x="76"
        y="34"
        fontFamily="'Helvetica Neue', Helvetica, Arial, sans-serif"
        fontSize="24"
        fontWeight="800"
        letterSpacing="2"
        fill="url(#rd-goldtext)"
        filter="url(#rd-glow)"
      >
        RD
      </text>

      <text
        x="77"
        y="49"
        fontFamily="'Helvetica Neue', Helvetica, Arial, sans-serif"
        fontSize="11"
        fontWeight="600"
        letterSpacing="3.5"
        fill="url(#rd-subtext)"
      >
        INDEX
      </text>
    </svg>
  );
}
