# PPTX Conversion Fix Plan

## Problem Analysis

### Issue 1: Raw HTML Showing as Text (facebook-ads.pptx)
The PPTX export was rendering **raw HTML as visible text** instead of rendering styled content. Slides showed literal HTML tags like:
```html
<div style="font-family: 'Raleway'; font-weight: 100; ...">April 2026</div>
```

### Issue 2: SVG Elements Showing as Raw XML
SVG elements were being serialized as raw XML text instead of being rendered visually.

## Root Cause

Marp's PPTX export has **strict HTML sanitization**. When HTML contains certain patterns that can't be safely converted, Marp escapes the HTML and renders it as text instead of rendering it visually.

### Key PPTX Limitations:
1. **Inline styles with CSS variables** - `var(--color)` may not resolve properly
2. **Complex nested `<div>` structures** - Deep nesting can trigger HTML escaping
3. **SVG elements** - Not supported in PPTX, will show as raw XML
4. **`<defs>` and gradients in SVG** - Will not render
5. **External font imports in `<style>`** - May not load for PPTX

### Important Finding:
Marp's PPTX export creates slides as **PNG images** embedded in the PPTX file. This is expected behavior:
- ✅ Visual fidelity is preserved (what you see is what you get)
- ✅ Complex CSS styling works correctly when rendered as PNG
- ❌ Text is NOT editable in PowerPoint
- ❌ Content is rendered as images, not native PPTX elements

## Solution: PPTX-Optimized Source Files ✅

Create `*_pptx.md` versions that use:
- **Pure markdown** where possible (headers, lists, tables)
- **Emoji instead of SVG** (📊 💰 📈 🎯 ️ ✅)
- **Simplified inline styles** with hardcoded colors (not CSS variables)
- **Avoid deep nesting** - use markdown blocks instead

## Implementation

### Files Fixed

| File | Original Issue | Fix Applied |
|------|---------------|-------------|
| `marp_language.md` | SVG icons, complex HTML | Simplified markdown, emoji icons |
| `marp_facebook-ads.md` | Complex inline styles with CSS vars, SVG charts, deep nested divs | Tables, emoji, simplified structure |

### Example: facebook-ads Transformation

**Before (shows raw HTML in PPTX):**
```html
<div style="display: flex; gap: 8px; margin-top: 20px;">
  <span style="background: #ff6b1a15; border: 1px solid #ff6b1a33; ...">8 Campaigns</span>
</div>
```

**After (renders correctly as PNG):**
```markdown
📊 8 Campaigns &nbsp;&nbsp; 💰 $10.9K Spend &nbsp;&nbsp; 📈 3.8x ROAS
```

**Complex SVG chart replaced with table:**
```markdown
| Metric | Value | Change |
|--------|-------|--------|
| 💰 Spend | $10,939 | 📈 +32.7% |
| 💵 Revenue | $41,946 | 📈 +49.3% |
```

## Testing Results

| File | Size | Slides | Status |
|------|------|--------|--------|
| `marp_language.pptx` | 461KB | 5 | ✅ PNG images embedded |
| `marp_facebook-ads.pptx` | 5.3MB | 17 | ✅ PNG images embedded |
| All 24 examples | Various | Various | ✅ All converted successfully |

### Verification Method:
```bash
# Check PPTX contains PNG images (content is rendered)
unzip -l file.pptx | grep "ppt/media"
# Output shows: Slide-1-image-1.png, Slide-2-image-1.png, etc.
```

## test-powerpoint.sh

The script already supports PPTX-optimized sources:
1. Looks for `*_pptx.md` versions first (PPTX-optimized source)
2. Falls back to original `.md` files if no optimized version exists
3. All 24 examples convert successfully

## PPTX Best Practices

### DO:
- ✅ Use pure markdown (headers, lists, bold, italic, blockquotes)
- ✅ Use emoji for icons (📊 💰  🎯 ️ ✅  💬 ☕ )
- ✅ Use markdown tables for data
- ✅ Use `<details>` for expandable content
- ✅ Use `![bg](image-url)` for background images
- ✅ CSS for colors, fonts, backgrounds (rendered into PNG)
- ✅ Marp directives (`<!-- _class: lead -->`)

### AVOID:
- ❌ Inline `<svg>` elements (use emoji instead)
- ❌ CSS variables in inline styles (`var(--color)`)
- ❌ Complex nested `<div>` with CSS grids/flex
- ❌ `<span>` elements with classes in table cells
- ❌ `<defs>` and gradients in SVG
- ❌ Deep HTML nesting (triggers escaping)

## Action Items

- [x] Create `marp_language_pptx.md` with simplified markdown
- [x] Create `marp_facebook-ads_pptx.md` with tables and emoji
- [x] Update `test-powerpoint.sh` to use `*_pptx.md` files (already supported)
- [x] Regenerate all 24 PPTX files
- [ ] Create PPTX-optimized versions for other SVG-heavy files (marp_sample.md, etc.)
- [ ] Document PPTX limitations in README
