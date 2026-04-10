# Dashboard Metrics Components

**Note:** For PDF export, use CSS classes defined in your slide's frontmatter `style:` block instead of inline `style=` attributes.

## Required CSS Classes

Add these to your slide's frontmatter:

```css
.card { background: var(--s); border: 1px solid var(--b); border-radius: 10px; padding: 18px; }
.card-accent { border-top: 3px solid var(--a); }
.card-success { border-top: 3px solid var(--g); }
.metric-label { font-size: 0.6em; color: var(--m); text-transform: uppercase; letter-spacing: 0.1em; margin-bottom: 8px; }
.metric-value { font-size: 2em; font-weight: 800; color: var(--t); line-height: 1; }
.metric-trend { font-size: 0.75em; color: var(--g); margin-top: 6px; display: flex; align-items: center; gap: 4px; }
.flex-row { display: flex; gap: 14px; margin-top: 16px; }
.flex-1 { flex: 1; }
.tag { font-family: 'Outfit'; font-weight: 600; font-size: 0.55em; letter-spacing: 0.12em; text-transform: uppercase; padding: 3px 10px; border-radius: 4px; display: inline-block; }
.tag-scale { background: #22c55e12; color: var(--g); border: 1px solid #22c55e22; }
.tag-kill { background: #ef444412; color: var(--r); border: 1px solid #ef444422; }
.tag-review { background: #f5a62312; color: var(--y); border: 1px solid #f5a62322; }
.progress-bar { height: 3px; background: #0a0a0a; border-radius: 2px; overflow: hidden; }
.progress-fill { height: 100%; background: var(--g); }
.pill { background: #ff6b1a15; border: 1px solid #ff6b1a33; border-radius: 20px; padding: 4px 14px; font-family: 'Outfit'; font-size: 0.55em; color: #ff6b1aaa; font-weight: 400; }
```

## Metric Card

```html
<div class="flex-1 card card-accent">
  <div class="metric-label">Revenue</div>
  <div class="metric-value">$10,939</div>
  <div class="metric-trend">
    <svg width="8" height="8" viewBox="0 0 24 24" fill="none" stroke="#22c55e" stroke-width="2">
      <polyline points="18 15 12 9 6 15"/>
    </svg> +32.7%
  </div>
</div>
```

## Status Dots

```html
<!-- Green (Active) -->
<svg width="8" height="8" viewBox="0 0 8 8">
  <circle cx="4" cy="4" r="4" fill="#22c55e"/>
</svg>

<!-- Yellow (Learning/Review) -->
<svg width="8" height="8" viewBox="0 0 8 8">
  <circle cx="4" cy="4" r="4" fill="#f5a623"/>
</svg>

<!-- Red (Paused/Kill) -->
<svg width="8" height="8" viewBox="0 0 8 8">
  <circle cx="4" cy="4" r="4" fill="#ef4444"/>
</svg>
```

## Verdict Tags

```html
<!-- Scale (Green) -->
<span class="tag tag-scale">Scale</span>

<!-- Kill (Red) -->
<span class="tag tag-kill">Kill</span>

<!-- Review (Yellow) -->
<span class="tag tag-review">Review</span>
```

## Progress Bar

```html
<div class="progress-bar">
  <div class="progress-fill" style="width: 76%;"></div>
</div>
```

## Pill Tags

```html
<span class="pill">8 Campaigns</span>
```

## Example: Multiple Cards in Row

```html
<div class="flex-row">
  <div class="flex-1 card card-accent">
    <div class="metric-label">Revenue</div>
    <div class="metric-value">$45,000</div>
    <div class="metric-trend">+23%</div>
  </div>
  <div class="flex-1 card card-success">
    <div class="metric-label">Customers</div>
    <div class="metric-value">1,234</div>
    <div class="metric-trend">+18%</div>
  </div>
</div>