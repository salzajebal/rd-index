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
            <stop offset="0%" stopColor="#6D4FD9" />
            <stop offset="100%" stopColor="#4F3CC9" />
          </linearGradient>
        </defs>
        <rect width="64" height="64" rx="16" fill="url(#rd-ibg)" />
        <text
          x="32"
          y="43"
          textAnchor="middle"
          fontFamily="'Helvetica Neue', Helvetica, Arial, sans-serif"
          fontSize="30"
          fontWeight="800"
          fill="#FFFFFF"
        >
          R
        </text>
      </svg>
    );
  }

  const h = size ?? height ?? 32;
  const aspectRatio = 168 / 32;
  const w = Math.round(h * aspectRatio);

  return (
    <svg
      width={w}
      height={h}
      viewBox="0 0 168 32"
      fill="none"
      xmlns="http://www.w3.org/2000/svg"
      className={className}
    >
      <defs>
        <linearGradient id="rd-badge" x1="0" y1="0" x2="1" y2="1">
          <stop offset="0%" stopColor="#6D4FD9" />
          <stop offset="100%" stopColor="#4F3CC9" />
        </linearGradient>
      </defs>

      <text
        x="0"
        y="23"
        fontFamily="'Helvetica Neue', Helvetica, Arial, sans-serif"
        fontSize="19"
        fontWeight="800"
        letterSpacing="-0.3"
        fill="#1E1B33"
      >
        RD-INDEX
      </text>

      <rect x="121" y="7" width="47" height="19" rx="9.5" fill="url(#rd-badge)" />
      <text
        x="144.5"
        y="20.5"
        textAnchor="middle"
        fontFamily="'Helvetica Neue', Helvetica, Arial, sans-serif"
        fontSize="11"
        fontWeight="800"
        letterSpacing="0.5"
        fill="#FFFFFF"
      >
        PRO
      </text>
    </svg>
  );
}
