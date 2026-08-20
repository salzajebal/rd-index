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
          <linearGradient id="vora-icon-bg" x1="0" y1="0" x2="64" y2="64" gradientUnits="userSpaceOnUse">
            <stop offset="0%" stopColor="#071525" />
            <stop offset="100%" stopColor="#126BFF" />
          </linearGradient>
        </defs>
        <rect width="64" height="64" rx="16" fill="url(#vora-icon-bg)" />
        <rect x="1" y="1" width="62" height="62" rx="15" stroke="#D6A84F" strokeOpacity="0.7" strokeWidth="2" />
        <text
          x="32"
          y="43"
          textAnchor="middle"
          fontFamily="'Helvetica Neue', Helvetica, Arial, sans-serif"
          fontSize="30"
          fontWeight="800"
          fill="#D6A84F"
        >
          V
        </text>
      </svg>
    );
  }

  const h = size ?? height ?? 32;
  const aspectRatio = 154 / 32;
  const w = Math.round(h * aspectRatio);

  return (
    <svg
      width={w}
      height={h}
      viewBox="0 0 154 32"
      fill="none"
      xmlns="http://www.w3.org/2000/svg"
      className={className}
    >
      <text
        x="0"
        y="23"
        fontFamily="'Helvetica Neue', Helvetica, Arial, sans-serif"
        fontSize="20"
        fontWeight="800"
        letterSpacing="0.5"
        fill="#D6A84F"
      >
        VORA
        <tspan fontSize="14" fontWeight="700" fill="#FFFFFF" letterSpacing="1.2">
          {' '}MARKETS
        </tspan>
      </text>
    </svg>
  );
}
