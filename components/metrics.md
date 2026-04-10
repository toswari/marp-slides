# Dashboard Metrics Components

## Metric Card (Gradient Top Border)

Card with gradient top border, icon, label, big number, and trend arrow.

```html
<div style="flex: 1; background: var(--card); border: 1px solid var(--border); border-radius: 10px; padding: 18px; position: relative; overflow: hidden;">
  <div style="position: absolute; top: 0; left: 0; width: 100%; height: 2px; background: linear-gradient(90deg, var(--accent), transparent);"></div>
  <div style="display: flex; align-items: center; gap: 6px; margin-bottom: 10px;">
    <svg width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="var(--muted)" stroke-width="1.5">
      <!-- Icon path here -->
    </svg>
    <span style="font-family: 'Outfit'; font-weight: 600; font-size: 0.5em; color: var(--muted); letter-spacing: 0.1em;">LABEL</span>
  </div>
  <div style="font-family: 'Outfit'; font-size: 2em; font-weight: 800; color: var(--light); line-height: 1;">$10,939</div>
  <div style="font-size: 0.65em; color: var(--green); margin-top: 6px;">
    <svg width="8" height="8" viewBox="0 0 24 24" fill="none" stroke="#22c55e" stroke-width="2" style="vertical-align: middle;">
      <polyline points="18 15 12 9 6 15"/>
    </svg> +32.7%
  </div>
</div>
```

## Status Dots

Inline SVG circles for status indication.

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

Colored tags for scale/kill/review decisions.

```html
<!-- Scale (Green) -->
<span class="tag" style="background:#22c55e12; color:var(--green); border:1px solid #22c55e22;">Scale</span>

<!-- Kill (Red) -->
<span class="tag" style="background:#ef444412; color:var(--red); border:1px solid #ef444422;">Kill</span>

<!-- Review (Yellow) -->
<span class="tag" style="background:#f5a62312; color:var(--yellow); border:1px solid #f5a62322;">Review</span>
```

## Hover Rows

Wrapper for hover highlight effect on list items.

```html
<div class="row" style="display: flex; align-items: center; gap: 10px; padding: 8px 8px;">
  <!-- Row content -->
</div>
```

## Progress Bar

Simple horizontal progress bar.

```html
<div style="flex: 1; height: 3px; background: #0a0a0a; border-radius: 2px; overflow: hidden;">
  <div style="background: var(--green); width: 76%; height: 100%;"></div>
</div>
```

## Pill Tags

Rounded pill-style tags for filters/categories.

```html
<span style="background: #ff6b1a15; border: 1px solid #ff6b1a33; border-radius: 20px; padding: 4px 14px; font-family: 'Outfit'; font-size: 0.55em; color: #ff6b1aaa; font-weight: 400;">
  8 Campaigns
</span>