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
            <stop offset="0%" stopColor="#0F1A2E" />
            <stop offset="55%" stopColor="#0A1220" />
            <stop offset="100%" stopColor="#050810" />
          </linearGradient>
          <linearGradient id="rd-igold" x1="0" y1="0" x2="0" y2="1">
            <stop offset="0%" stopColor="#F3E3B8" />
            <stop offset="45%" stopColor="#CBA35A" />
            <stop offset="100%" stopColor="#8E7133" />
          </linearGradient>
          <linearGradient id="rd-iring" x1="0" y1="0" x2="1" y2="1">
            <stop offset="0%" stopColor="#E8D19C" stopOpacity="0.9" />
            <stop offset="50%" stopColor="#8E7133" stopOpacity="0.4" />
            <stop offset="100%" stopColor="#E8D19C" stopOpacity="0.8" />
          </linearGradient>
          <filter id="rd-iglow" x="-50%" y="-50%" width="200%" height="200%">
            <feGaussianBlur stdDeviation="1.1" result="b" />
            <feMerge><feMergeNode in="b" /><feMergeNode in="SourceGraphic" /></feMerge>
          </filter>
        </defs>

        <rect width="64" height="64" rx="12" fill="url(#rd-ibg)" />
        <rect x="1" y="1" width="62" height="62" rx="11" stroke="url(#rd-iring)" strokeWidth="1" fill="none" />
        <rect x="4.5" y="4.5" width="55" height="55" rx="8" stroke="#CBA35A" strokeOpacity="0.25" strokeWidth="0.6" fill="none" />

        <g filter="url(#rd-iglow)">
          <path
            d="M20 45V19h9.4c6 0 9.9 3.4 9.9 8.7 0 3.9-2.1 6.8-5.5 8.1L40 45h-6.1l-5.4-8.4h-2.8V45H20Zm5.7-13.1h3.4c2.7 0 4.3-1.4 4.3-3.7s-1.6-3.7-4.3-3.7h-3.4v7.4Z"
            fill="url(#rd-igold)"
          />
        </g>
        <path
          d="M15 49.5 24 40l6 5 12-13"
          stroke="url(#rd-igold)"
          strokeWidth="1.6"
          strokeLinecap="round"
          strokeLinejoin="round"
          fill="none"
          opacity="0.85"
          filter="url(#rd-iglow)"
        />
        <path d="M35.5 32.5 42 32l0.7 6.3" stroke="url(#rd-igold)" strokeWidth="1.6" strokeLinecap="round" strokeLinejoin="round" fill="none" opacity="0.85" />

        <line x1="10" y1="54.5" x2="54" y2="54.5" stroke="url(#rd-igold)" strokeOpacity="0.35" strokeWidth="0.6" />
      </svg>
    );
  }

  const h = size ?? height ?? 48;
  const aspectRatio = 240 / 64;
  const w = Math.round(h * aspectRatio);

  return (
    <svg
      width={w}
      height={h}
      viewBox="0 0 240 64"
      fill="none"
      xmlns="http://www.w3.org/2000/svg"
      className={className}
    >
      <defs>
        <linearGradient id="rd-bg" x1="0" y1="0" x2="64" y2="64" gradientUnits="userSpaceOnUse">
          <stop offset="0%" stopColor="#0F1A2E" />
          <stop offset="55%" stopColor="#0A1220" />
          <stop offset="100%" stopColor="#050810" />
        </linearGradient>
        <linearGradient id="rd-gold" x1="0" y1="0" x2="0" y2="1">
          <stop offset="0%" stopColor="#F3E3B8" />
          <stop offset="45%" stopColor="#CBA35A" />
          <stop offset="100%" stopColor="#8E7133" />
        </linearGradient>
        <linearGradient id="rd-iring" x1="0" y1="0" x2="1" y2="1">
          <stop offset="0%" stopColor="#E8D19C" stopOpacity="0.9" />
          <stop offset="50%" stopColor="#8E7133" stopOpacity="0.4" />
          <stop offset="100%" stopColor="#E8D19C" stopOpacity="0.8" />
        </linearGradient>
        <linearGradient id="rd-goldtext" x1="0" y1="0" x2="0" y2="1">
          <stop offset="0%" stopColor="#F3E6C0" />
          <stop offset="50%" stopColor="#CBA35A" />
          <stop offset="100%" stopColor="#8E7133" />
        </linearGradient>
        <linearGradient id="rd-subtext" x1="0" y1="0" x2="1" y2="0">
          <stop offset="0%" stopColor="#B79556" />
          <stop offset="100%" stopColor="#B79556" stopOpacity="0" />
        </linearGradient>
        <filter id="rd-glow" x="-50%" y="-50%" width="200%" height="200%">
          <feGaussianBlur stdDeviation="1.1" result="b" />
          <feMerge><feMergeNode in="b" /><feMergeNode in="SourceGraphic" /></feMerge>
        </filter>
      </defs>

      <rect width="64" height="64" rx="12" fill="url(#rd-bg)" />
      <rect x="1" y="1" width="62" height="62" rx="11" stroke="url(#rd-iring)" strokeWidth="1" fill="none" />
      <rect x="4.5" y="4.5" width="55" height="55" rx="8" stroke="#CBA35A" strokeOpacity="0.25" strokeWidth="0.6" fill="none" />

      <g filter="url(#rd-glow)">
        <path
          d="M20 45V19h9.4c6 0 9.9 3.4 9.9 8.7 0 3.9-2.1 6.8-5.5 8.1L40 45h-6.1l-5.4-8.4h-2.8V45H20Zm5.7-13.1h3.4c2.7 0 4.3-1.4 4.3-3.7s-1.6-3.7-4.3-3.7h-3.4v7.4Z"
          fill="url(#rd-gold)"
        />
      </g>
      <path
        d="M15 49.5 24 40l6 5 12-13"
        stroke="url(#rd-gold)"
        strokeWidth="1.6"
        strokeLinecap="round"
        strokeLinejoin="round"
        fill="none"
        opacity="0.85"
        filter="url(#rd-glow)"
      />
      <path d="M35.5 32.5 42 32l0.7 6.3" stroke="url(#rd-gold)" strokeWidth="1.6" strokeLinecap="round" strokeLinejoin="round" fill="none" opacity="0.85" />

      <line x1="10" y1="54.5" x2="54" y2="54.5" stroke="url(#rd-gold)" strokeOpacity="0.35" strokeWidth="0.6" />

      <text
        x="76"
        y="33"
        fontFamily="'Georgia', 'Times New Roman', serif"
        fontSize="23"
        fontWeight="700"
        letterSpacing="1"
        fill="url(#rd-goldtext)"
        filter="url(#rd-glow)"
      >
        RD-INDEX
      </text>

      <text
        x="77"
        y="48"
        fontFamily="'Helvetica Neue', Helvetica, Arial, sans-serif"
        fontSize="9.5"
        fontWeight="600"
        letterSpacing="3.2"
        fill="url(#rd-subtext)"
      >
        GLOBAL OPTIONS EXCHANGE
      </text>
    </svg>
  );
}
