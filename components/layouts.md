# Layout Components

## Before/After Split

Two flex panels with contrasting top borders.

```html
<div style="display: flex; gap: 14px; margin-top: 16px;">
  <div style="flex: 1; background: var(--card); border: 1px solid var(--border); border-radius: 10px; padding: 18px; border-top: 3px solid var(--red);">
    <h4 style="color: var(--red); margin-bottom: 8px;">Before</h4>
    <p style="font-size: 0.85em; color: var(--body);">Previous state description</p>
  </div>
  <div style="flex: 1; background: var(--card); border: 1px solid var(--border); border-radius: 10px; padding: 18px; border-top: 3px solid var(--green);">
    <h4 style="color: var(--green); margin-bottom: 8px;">After</h4>
    <p style="font-size: 0.85em; color: var(--body);">Improved state description</p>
  </div>
</div>
```

## Terminal Mockup

Code/terminal window with traffic light dots.

```html
<div style="background: var(--card); border: 1px solid var(--border); border-radius: 10px; overflow: hidden;">
  <div style="display: flex; align-items: center; gap: 6px; padding: 10px 14px; background: #0a0a0a; border-bottom: 1px solid var(--border);">
    <div style="width: 10px; height: 10px; border-radius: 50%; background: #ff5f56;"></div>
    <div style="width: 10px; height: 10px; border-radius: 50%; background: #ffbd2e;"></div>
    <div style="width: 10px; height: 10px; border-radius: 50%; background: #27c93f;"></div>
  </div>
  <div style="padding: 14px; font-family: 'IBM Plex Mono', monospace; font-size: 0.75em; color: var(--body);">
    <span style="color: var(--green);">$</span> command --flag value<br>
    Output line 1<br>
    Output line 2
  </div>
</div>
```

## Browser Mockup

Browser window with URL bar.

```html
<div style="background: var(--card); border: 1px solid var(--border); border-radius: 10px; overflow: hidden;">
  <div style="display: flex; align-items: center; gap: 6px; padding: 10px 14px; background: #0a0a0a; border-bottom: 1px solid var(--border);">
    <div style="width: 10px; height: 10px; border-radius: 50%; background: #ff5f56;"></div>
    <div style="width: 10px; height: 10px; border-radius: 50%; background: #ffbd2e;"></div>
    <div style="width: 10px; height: 10px; border-radius: 50%; background: #27c93f;"></div>
    <div style="flex: 1; margin-left: 10px; background: #1a1a1a; border-radius: 4px; padding: 4px 10px; font-size: 0.7em; color: #666;">
      https://example.com/page
    </div>
  </div>
  <div style="padding: 14px;">
    <!-- Page content here -->
  </div>
</div>
```

## Chat Bubbles

User (left) and agent (right, orange-tinted) messages.

```html
<div style="display: flex; flex-direction: column; gap: 10px; margin-top: 16px;">
  <!-- User message -->
  <div style="align-self: flex-start; background: #1a1a1a; border-radius: 10px 10px 10px 0; padding: 12px 16px; max-width: 70%;">
    <p style="font-size: 0.85em; color: var(--body); margin: 0;">User question or input</p>
  </div>
  <!-- Agent message -->
  <div style="align-self: flex-end; background: #1a0f08; border: 1px solid #332218; border-radius: 10px 10px 0 10px; padding: 12px 16px; max-width: 70%;">
    <p style="font-size: 0.85em; color: var(--body); margin: 0;">Agent response with <strong style="color: var(--accent);">highlighted</strong> text</p>
  </div>
</div>
```

## Flowchart

Boxes with SVG arrow connectors.

```html
<div style="display: flex; align-items: center; gap: 10px; margin-top: 16px;">
  <div style="background: var(--card); border: 1px solid var(--border); border-radius: 6px; padding: 10px 16px; font-size: 0.75em;">Step 1</div>
  <svg width="30" height="2"><line x1="0" y1="1" x2="30" y2="1" stroke="#333" stroke-width="2"/><polygon points="30,1 25,0 25,2" fill="#333"/></svg>
  <div style="background: var(--card); border: 1px solid var(--border); border-radius: 6px; padding: 10px 16px; font-size: 0.75em;">Step 2</div>
  <svg width="30" height="2"><line x1="0" y1="1" x2="30" y2="1" stroke="#333" stroke-width="2"/><polygon points="30,1 25,0 25,2" fill="#333"/></svg>
  <div style="background: var(--accent); color: #fff; border-radius: 6px; padding: 10px 16px; font-size: 0.75em;">Step 3</div>
</div>
```

## Timeline

Vertical line with dot markers.

```html
<div style="display: flex; flex-direction: column; gap: 16px; margin-top: 16px; padding-left: 20px;">
  <div style="position: relative;">
    <div style="position: absolute; left: -24px; top: 0; width: 12px; height: 12px; border-radius: 50%; background: var(--accent);"></div>
    <div style="font-size: 0.7em; color: var(--muted); text-transform: uppercase; letter-spacing: 0.1em;">Week 1</div>
    <div style="font-size: 0.85em; color: var(--body); margin-top: 4px;">Initial setup and planning</div>
  </div>
  <div style="position: relative;">
    <div style="position: absolute; left: -24px; top: 0; width: 12px; height: 12px; border-radius: 50%; background: var(--green);"></div>
    <div style="font-size: 0.7em; color: var(--muted); text-transform: uppercase; letter-spacing: 0.1em;">Week 2</div>
    <div style="font-size: 0.85em; color: var(--body); margin-top: 4px;">Development and testing</div>
  </div>
  <div style="position: relative;">
    <div style="position: absolute; left: -24px; top: 0; width: 12px; height: 12px; border-radius: 50%; background: var(--yellow);"></div>
    <div style="font-size: 0.7em; color: var(--muted); text-transform: uppercase; letter-spacing: 0.1em;">Week 3</div>
    <div style="font-size: 0.85em; color: var(--body); margin-top: 4px;">Review and iteration</div>
  </div>
</div>
```

## Card Row

Horizontal card layout with flex.

```html
<div style="display: flex; gap: 14px; margin-top: 16px;">
  <div style="flex: 1; background: var(--card); border: 1px solid var(--border); border-radius: 10px; padding: 18px;">
    <div style="font-size: 0.6em; color: var(--muted); text-transform: uppercase; letter-spacing: 0.1em; margin-bottom: 8px;">Card 1</div>
    <div style="font-size: 1.5em; font-weight: 700; color: var(--light);">Value</div>
    <div style="font-size: 0.75em; color: var(--body); margin-top: 4px;">Description text</div>
  </div>
  <div style="flex: 1; background: var(--card); border: 1px solid var(--border); border-radius: 10px; padding: 18px;">
    <div style="font-size: 0.6em; color: var(--muted); text-transform: uppercase; letter-spacing: 0.1em; margin-bottom: 8px;">Card 2</div>
    <div style="font-size: 1.5em; font-weight: 700; color: var(--light);">Value</div>
    <div style="font-size: 0.75em; color: var(--body); margin-top: 4px;">Description text</div>
  </div>
  <div style="flex: 1; background: var(--card); border: 1px solid var(--border); border-radius: 10px; padding: 18px;">
    <div style="font-size: 0.6em; color: var(--muted); text-transform: uppercase; letter-spacing: 0.1em; margin-bottom: 8px;">Card 3</div>
    <div style="font-size: 1.5em; font-weight: 700; color: var(--light);">Value</div>
    <div style="font-size: 0.75em; color: var(--body); margin-top: 4px;">Description text</div>
  </div>
</div>
```

## Funnel

Step-down visualization with connecting lines.

```html
<div style="margin-top: 20px;">
  <div style="display: flex; align-items: center; gap: 12px; margin-bottom: 28px;">
    <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="var(--label)" stroke-width="1.5">
      <path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"/>
      <circle cx="12" cy="12" r="3"/>
    </svg>
    <div>
      <div style="font-family: 'Outfit'; font-size: 1.6em; font-weight: 800; color: var(--light); line-height: 1;">1.31M</div>
      <div style="font-weight: 100; font-size: 0.6em; color: var(--label); letter-spacing: 0.1em;">IMPRESSIONS</div>
    </div>
  </div>
  <div style="width: 40px; border-left: 1px solid #222; height: 12px; margin-left: 10px;"></div>
  <div style="display: flex; align-items: center; gap: 12px; margin-bottom: 28px;">
    <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="var(--label)" stroke-width="1.5">
      <path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"/><circle cx="9" cy="7" r="4"/>
    </svg>
    <div>
      <div style="font-family: 'Outfit'; font-size: 1.6em; font-weight: 800; color: var(--light); line-height: 1;">1.01M</div>
      <div style="font-weight: 100; font-size: 0.6em; color: var(--label); letter-spacing: 0.1em;">REACH</div>
    </div>
  </div>
</div>