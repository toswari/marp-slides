# Interactive Elements

## Collapsible Details

Expandable sections with summary and content.

```html
<details>
  <summary>Campaign Name — 8.7x ROAS</summary>
  <p>Campaign description and analysis. <strong>Verdict: Scale to $1,500.</strong></p>
</details>
```

**Styling** (applied via CSS):
- Summary: Orange accent color, Outfit font, clickable cursor
- Content: Gray body text, smaller font size, top margin

## Tooltips (Abbreviations)

Hover-to-reveal text using `<abbr>` tag.

```html
<abbr title="Return On Ad Spend">ROAS</abbr>
```

**CSS styling**: Dotted underline, help cursor, subtle border.

## Sliders

Range input for interactive adjustments.

```html
<input type="range" min="0" max="100" value="50" style="accent-color:var(--accent);" />
```

**Note**: Only works in HTML export, not PDF/PPTX.

## Checkboxes

Boolean toggle inputs.

```html
<input type="checkbox" checked style="accent-color:var(--accent);" />
<input type="checkbox" style="accent-color:var(--accent);" />
```

**Note**: Interactive in HTML export only.

## Progress Bars

HTML5 progress element.

```html
<progress value="76" max="100" style="accent-color:var(--accent);"></progress>
```

**Note**: Styled via accent-color, works in HTML export.

## Usage Guidelines

| Element | PDF | PPTX | HTML Preview |
|---------|-----|------|--------------|
| `<details>` | ❌ Static | ❌ Static | ✅ Interactive |
| `<abbr>` | ❌ Static | ❌ Static | ✅ Tooltip |
| `<input type="range">` | ❌ | ❌ | ✅ Interactive |
| `<input type="checkbox">` | ❌ | ❌ | ✅ Interactive |
| `<progress>` | ❌ | ❌ | ✅ Interactive |

**Recommendation**: Use interactive elements for HTML presentations and demos. For PDF/PPTX exports, consider static alternatives like verdict tags or progress bar divs.