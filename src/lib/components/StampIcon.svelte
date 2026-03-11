<script lang="ts">
  export let size: number = 400;
</script>

<svg
  xmlns="http://www.w3.org/2000/svg"
  viewBox="0 0 400 400"
  width={size}
  height={size}
>
  <defs>
    <path
      id="topArc"
      d="M 200,200 m -138,0 a 138,138 0 1,1 276,0"
      fill="none"
    />
  </defs>

  <!-- Outer ring (r=175) -->
  <circle
    cx="200"
    cy="200"
    r="175"
    fill="none"
    stroke="var(--theme-fg)"
    stroke-width="12"
  />
  <!-- Middle ring - bottom half only (r=148) -->
  <path
    d="M 52,200 a 148,148 0 0,0 296,0"
    fill="none"
    stroke="var(--theme-fg)"
    stroke-width="6"
  />
  <!-- Inner circle (r=121) -->
  <circle
    cx="200"
    cy="200"
    r="121"
    fill="none"
    stroke="var(--theme-fg)"
    stroke-width="6"
  />

  <!-- Curved text top: KELVIN'S PICK at midpoint r=148 -->
  <!--
  <text
    fill="var(--theme-fg)"
    stroke="var(--theme-fg)"
    stroke-width="2"
    font-family="Arial Black, Arial, Helvetica, sans-serif"
    font-weight="900"
    font-size="28"
    letter-spacing="8"
  >
    <textPath href="#topArc" startOffset="50%" text-anchor="middle"
      >KELVIN'S PICK</textPath
    >
  </text>
  -->

  <!-- Center text: KP (bigger) -->
  <text
    x="200"
    y="215"
    fill="var(--theme-fg)"
    font-family="Arial Black, Arial, Helvetica, sans-serif"
    font-weight="900"
    font-size="120"
    text-anchor="middle"
    dominant-baseline="middle">KP</text
  >
</svg>
