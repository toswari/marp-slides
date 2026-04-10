---
marp: true
theme: default
paginate: true
title: Test Presentation
style: |
  @import url('https://fonts.googleapis.com/css2?family=Outfit:wght@400;600;700;800&family=Raleway:wght@100;200;300&display=swap');

  :root {
    --a: #ff6b1a;
    --a2: #ff8c4a;
    --bg: #000;
    --s: #080808;
    --b: #111;
    --m: #555;
    --t: #fff;
    --g: #22c55e;
    --r: #ef4444;
    --y: #f5a623;
    --body: #999;
    --label: #666;
  }

  section {
    background: var(--bg);
    color: var(--t);
    font-family: 'Raleway', sans-serif;
    font-weight: 200;
    padding: 56px 72px;
    line-height: 1.5;
  }

  h1 { font-family: 'Outfit'; font-weight: 800; font-size: 3em; color: var(--t); letter-spacing: -0.03em; line-height: 1; margin: 0 0 4px; }
  h2 { font-family: 'Raleway'; font-weight: 100; font-size: 1.3em; color: #888; margin: 0 0 20px; }
  h3 { font-family: 'Outfit'; font-weight: 600; font-size: 0.6em; color: var(--m); text-transform: uppercase; letter-spacing: 0.2em; margin: 0 0 4px; }
  strong { color: var(--a); font-weight: 300; }

  section::after { font-family: 'Outfit'; font-size: 0.6em; color: #151515; }

  .tag { font-family: 'Outfit'; font-weight: 600; font-size: 0.55em; letter-spacing: 0.12em; text-transform: uppercase; padding: 3px 10px; border-radius: 4px; display: inline-block; }

  details { background: var(--s); border: 1px solid var(--b); border-radius: 10px; padding: 14px 18px; margin-top: 8px; }
  details summary { color: var(--a); font-family: 'Outfit'; font-weight: 600; font-size: 0.8em; cursor: pointer; letter-spacing: 0.03em; }
  details p { color: var(--body); font-size: 0.78em; margin-top: 8px; line-height: 1.6; }

  .card { background: var(--s); border: 1px solid var(--b); border-radius: 10px; padding: 18px; }
  .card-accent { border-top: 3px solid var(--a); }
  .card-success { border-top: 3px solid var(--g); }
  .metric-label { font-size: 0.6em; color: var(--m); text-transform: uppercase; letter-spacing: 0.1em; margin-bottom: 8px; }
  .metric-value { font-size: 2em; font-weight: 800; color: var(--t); line-height: 1; }
  .metric-trend { font-size: 0.75em; color: var(--g); margin-top: 6px; display: flex; align-items: center; gap: 4px; }
  .flex-row { display: flex; gap: 14px; margin-top: 16px; }
  .flex-1 { flex: 1; }
---

# Test MARP Slides

Installation verification complete.

---

## Metrics Test

<div class="flex-row">
  <div class="flex-1 card card-accent">
    <div class="metric-label">Revenue</div>
    <div class="metric-value">$45,000</div>
    <div class="metric-trend">
      <svg width="8" height="8" viewBox="0 0 24 24" fill="none" stroke="#22c55e" stroke-width="2" style="vertical-align: middle;">
        <polyline points="18 15 12 9 6 15"/>
      </svg> +23%
    </div>
  </div>
  <div class="flex-1 card card-success">
    <div class="metric-label">Customers</div>
    <div class="metric-value">1,234</div>
    <div class="metric-trend">
      <svg width="8" height="8" viewBox="0 0 24 24" fill="none" stroke="#22c55e" stroke-width="2" style="vertical-align: middle;">
        <polyline points="18 15 12 9 6 15"/>
      </svg> +18%
    </div>
  </div>
</div>

---

## Chart Test

<svg width="100%" height="200" viewBox="0 0 400 200">
  <line x1="40" y1="10" x2="40" y2="170" stroke="#333" stroke-width="1"/>
  <line x1="40" y1="170" x2="390" y2="170" stroke="#333" stroke-width="1"/>
  <polyline points="40,140 100,120 160,100 220,80 280,60 340,40" fill="none" stroke="#ff6b1a" stroke-width="3"/>
  <circle cx="40" cy="140" r="4" fill="#ff6b1a"/>
  <circle cx="100" cy="120" r="4" fill="#ff6b1a"/>
  <circle cx="160" cy="100" r="4" fill="#ff6b1a"/>
  <circle cx="220" cy="80" r="4" fill="#ff6b1a"/>
  <circle cx="280" cy="60" r="4" fill="#ff6b1a"/>
  <circle cx="340" cy="40" r="4" fill="#ff6b1a"/>
  <text x="200" y="30" text-anchor="middle" fill="#ff6b1a" font-size="14" font-weight="bold">Growth Trend</text>
</svg>

---

## Installation Complete ✓

- [x] npm packages installed
- [x] Fonts installed (Outfit, Raleway, Space Grotesk, IBM Plex Mono)
- [x] marp-cli v3.4.0 verified
- [x] Test slides rendering

**Ready to create presentations!**