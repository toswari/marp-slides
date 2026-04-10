# SVG Chart Components

## Line / Area Chart

SVG polyline for the line + polygon with linearGradient fill for area under the curve.

```html
<svg width="100%" height="240" viewBox="0 0 900 240" preserveAspectRatio="none">
  <!-- Grid lines -->
  <line x1="0" y1="0" x2="900" y2="0" stroke="#111" stroke-width="1"/>
  <line x1="0" y1="60" x2="900" y2="60" stroke="#111" stroke-width="1"/>
  <line x1="0" y1="120" x2="900" y2="120" stroke="#111" stroke-width="1"/>
  <line x1="0" y1="180" x2="900" y2="180" stroke="#111" stroke-width="1"/>
  
  <!-- Y-axis labels -->
  <text x="-5" y="8" fill="#333" font-family="Outfit" font-size="10" text-anchor="end">8x</text>
  <text x="-5" y="65" fill="#333" font-family="Outfit" font-size="10" text-anchor="end">6x</text>
  <text x="-5" y="125" fill="#333" font-family="Outfit" font-size="10" text-anchor="end">4x</text>
  <text x="-5" y="185" fill="#333" font-family="Outfit" font-size="10" text-anchor="end">2x</text>
  
  <!-- Target line (dashed) -->
  <line x1="0" y1="150" x2="900" y2="150" stroke="#ff6b1a" stroke-width="1" stroke-dasharray="6,4" opacity="0.3"/>
  <text x="908" y="154" fill="#ff6b1a" font-family="Outfit" font-size="9" opacity="0.5">3x</text>
  
  <!-- Area fill gradient -->
  <defs>
    <linearGradient id="areaGrad" x1="0" y1="0" x2="0" y2="1">
      <stop offset="0%" stop-color="#ff6b1a"/>
      <stop offset="100%" stop-color="transparent"/>
    </linearGradient>
  </defs>
  <polygon points="0,195 150,186 300,177 450,165 600,156 750,141 900,132 900,240 0,240" fill="url(#areaGrad)" opacity="0.2"/>
  
  <!-- Line -->
  <polyline points="0,195 150,186 300,177 450,165 600,156 750,141 900,132" fill="none" stroke="#ff6b1a" stroke-width="2.5" stroke-linejoin="round"/>
  
  <!-- Data points -->
  <circle cx="0" cy="195" r="3" fill="#ff6b1a"/>
  <circle cx="150" cy="186" r="3" fill="#ff6b1a"/>
  <circle cx="300" cy="177" r="3" fill="#ff6b1a"/>
  <circle cx="450" cy="165" r="3" fill="#ff6b1a"/>
  <circle cx="600" cy="156" r="3" fill="#ff6b1a"/>
  <circle cx="750" cy="141" r="3" fill="#ff6b1a"/>
  <circle cx="900" cy="132" r="5" fill="#ff6b1a" stroke="#000" stroke-width="2"/>
  <text x="900" y="122" text-anchor="middle" fill="#ff6b1a" font-family="Outfit" font-size="13" font-weight="700">3.8x</text>
  
  <!-- X-axis labels -->
  <text x="0" y="235" fill="#333" font-family="Outfit" font-size="10">Oct</text>
  <text x="150" y="235" fill="#333" font-family="Outfit" font-size="10">Nov</text>
  <text x="300" y="235" fill="#333" font-family="Outfit" font-size="10">Dec</text>
  <text x="450" y="235" fill="#333" font-family="Outfit" font-size="10">Jan</text>
  <text x="600" y="235" fill="#333" font-family="Outfit" font-size="10">Feb</text>
  <text x="750" y="235" fill="#333" font-family="Outfit" font-size="10">Mar</text>
  <text x="880" y="235" fill="#ff6b1a" font-family="Outfit" font-size="10" font-weight="600">Apr</text>
</svg>
```

## Pie / Donut Chart

Each segment = separate circle with stroke-dasharray and stroke-dashoffset.

**Math**: circumference = 2 * π * r. For r=110: ~691. Segment = (pct/100) * 691. Offsets accumulate negatively.

```html
<svg width="280" height="280" viewBox="0 0 280 280">
  <!-- Background ring -->
  <circle cx="140" cy="140" r="110" fill="none" stroke="#111" stroke-width="36"/>
  
  <!-- Segment 1: 26% (orange) -->
  <circle cx="140" cy="140" r="110" fill="none" stroke="#ff6b1a" stroke-width="36" 
    stroke-dasharray="180 511" stroke-dashoffset="0" transform="rotate(-90 140 140)"/>
  
  <!-- Segment 2: 20% (dark orange) -->
  <circle cx="140" cy="140" r="110" fill="none" stroke="#cc5515" stroke-width="36" 
    stroke-dasharray="138 553" stroke-dashoffset="-180" transform="rotate(-90 140 140)"/>
  
  <!-- Segment 3: 15% (gray) -->
  <circle cx="140" cy="140" r="110" fill="none" stroke="#444" stroke-width="36" 
    stroke-dasharray="104 587" stroke-dashoffset="-318" transform="rotate(-90 140 140)"/>
  
  <!-- Segment 4: 13% (green) -->
  <circle cx="140" cy="140" r="110" fill="none" stroke="#22c55e" stroke-width="36" 
    stroke-dasharray="90 601" stroke-dashoffset="-422" transform="rotate(-90 140 140)"/>
  
  <!-- Center label -->
  <text x="140" y="134" text-anchor="middle" fill="#fff" font-family="Outfit" font-size="28" font-weight="800">$10.9K</text>
  <text x="140" y="158" text-anchor="middle" fill="#555" font-family="Outfit" font-size="12" font-weight="600" letter-spacing="1.5">TOTAL SPEND</text>
</svg>
```

## Gauge / Half-Circle Meter

SVG path arc for background + colored value arc. Needle line from center + circle pivot.

```html
<svg width="320" height="190" viewBox="0 0 320 190">
  <!-- Background arc -->
  <path d="M 30 170 A 130 130 0 0 1 290 170" fill="none" stroke="#111" stroke-width="18" stroke-linecap="round"/>
  
  <!-- Value arc (orange, 76/100 score) -->
  <path d="M 30 170 A 130 130 0 0 1 270 82" fill="none" stroke="#ff6b1a" stroke-width="18" stroke-linecap="round"/>
  
  <!-- Needle -->
  <line x1="160" y1="170" x2="256" y2="92" stroke="#fff" stroke-width="2.5" stroke-linecap="round"/>
  <circle cx="160" cy="170" r="7" fill="#fff"/>
  
  <!-- Value text -->
  <text x="160" y="152" text-anchor="middle" fill="#fff" font-family="Outfit" font-size="44" font-weight="800">76</text>
  
  <!-- Scale labels -->
  <text x="30" y="188" fill="#444" font-family="Outfit" font-size="12">0</text>
  <text x="290" y="188" fill="#444" font-family="Outfit" font-size="12">100</text>
</svg>
```

## Donut Ring (Single)

Single circle with stroke-dasharray. For r=74: circumference = 465. 89% = offset 51.

```html
<svg width="180" height="180" viewBox="0 0 180 180">
  <circle cx="90" cy="90" r="74" fill="none" stroke="#111" stroke-width="8"/>
  <circle cx="90" cy="90" r="74" fill="none" stroke="var(--green)" stroke-width="8" 
    stroke-dasharray="465" stroke-dashoffset="51" stroke-linecap="round" transform="rotate(-90 90 90)"/>
  <text x="90" y="84" text-anchor="middle" fill="#fff" font-family="Outfit" font-size="36" font-weight="800">89%</text>
  <text x="90" y="106" text-anchor="middle" fill="#666" font-family="Outfit" font-size="11" font-weight="600" letter-spacing="1.5">BUDGET USED</text>
</svg>
```

## Sparkline (Inline Mini)

Small inline trend line for compact displays.

```html
<svg width="50" height="16" viewBox="0 0 50 16">
  <polyline points="0,14 8,12 16,10 24,8 50,2" fill="none" stroke="#22c55e" stroke-width="1.2"/>
</svg>
```

## Vertical Bar Chart

Flex container with gradient bars.

```html
<div style="display: flex; gap: 8px; align-items: flex-end; justify-content: center; height: 260px; padding-bottom: 20px; border-bottom: 1px solid #0a0a0a;">
  <div style="flex: 1; display: flex; gap: 3px; align-items: flex-end; justify-content: center;">
    <div style="width: 18px; background: linear-gradient(180deg, #222, #111); border-radius: 3px 3px 0 0; height: 56px;"></div>
    <div style="width: 18px; background: linear-gradient(180deg, var(--accent), #cc5515); border-radius: 3px 3px 0 0; height: 200px;"></div>
  </div>
  <!-- Repeat for each data point -->
</div>
```

## Stacked Bar

Flex div with colored width-percent segments.

```html
<div style="display: flex; height: 20px; border-radius: 6px; overflow: hidden;">
  <div style="background: var(--accent); width: 26%;"></div>
  <div style="background: #cc5515; width: 20%;"></div>
  <div style="background: #444; width: 15%;"></div>
  <div style="background: var(--green); width: 13%;"></div>
  <div style="background: var(--red); width: 11%; opacity: 0.6;"></div>
</div>
```

## Radar / Spider Chart

SVG polygon for hexagonal grid + data shape.

```html
<svg width="200" height="200" viewBox="0 0 200 200">
  <!-- Hexagonal grid (simplified) -->
  <polygon points="100,20 180,60 180,140 100,180 20,140 20,60" fill="none" stroke="#222" stroke-width="1"/>
  <polygon points="100,40 160,70 160,130 100,160 40,130 40,70" fill="none" stroke="#222" stroke-width="1"/>
  <polygon points="100,60 140,80 140,120 100,140 60,120 60,80" fill="none" stroke="#222" stroke-width="1"/>
  
  <!-- Data shape -->
  <polygon points="100,30 155,75 155,125 100,155 45,125 45,75" fill="var(--accent)" fill-opacity="0.1" stroke="var(--accent)" stroke-width="2"/>
</svg>