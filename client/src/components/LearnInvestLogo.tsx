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
  const aspectRatio = 118 / 32;
  const w = Math.round(h * aspectRatio);

  return (
    <svg
      width={w}
      height={h}
      viewBox="0 0 118 32"
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
        fill="#14328C"
      >
        RD
        <tspan fontWeight="600" fill="#3454D1" letterSpacing="0.8">
          -INDEX
        </tspan>
      </text>
    </svg>
  );
}
