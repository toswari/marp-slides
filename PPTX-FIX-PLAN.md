# PPTX Conversion Fix Plan

## Problem Identified

The PPTX export is rendering **raw HTML as visible text** instead of rendering the styled content. Looking at `marp_facebook-ads.pptx`, the slide shows literal HTML tags like:
```html
<div style="font-family: 'Raleway'; font-weight: 100; ...">April 2026 · Monthly Performance Report</div>
```

## Root Cause

Marp's PPTX export has **strict HTML sanitization**. When HTML contains certain patterns that can't be safely converted, Marp escapes the HTML and renders it as text instead of rendering it visually.

### Key PPTX Limitations (Marp CLI):
1. **Inline styles with CSS variables** - `var(--color)` may not resolve properly
2. **Complex nested `<div>` structures** - Deep nesting can trigger escaping
3. **SVG elements** - Not supported in PPTX, will show as raw XML
4. **`<defs>` and gradients in SVG** - Will not render
5. **External font imports in `<style>`** - May not load for PPTX

## Solution Strategy

### Option 1: Create PPTX-Optimized Source Files (Recommended)
Create `*_pptx.md` versions that use:
- Pure markdown where possible
- Emoji instead of SVG icons
- Simplified inline styles (hardcoded colors, not CSS variables)
- Avoid deep nesting

### Option 2: Use Marp's `--allow-local-files` with HTML escaping fix
Add `<!-- _htmlAsText: false -->` directive (if supported)

### Option 3: Convert to image-based slides
Export as PNG images first, then embed in PPTX

## Implementation Plan

### Step 1: Create PPTX-Optimized Version of marp_facebook-ads.md

Key changes:
1. **Replace CSS variables with hardcoded colors** in inline styles
2. **Replace SVG with emoji** (📊 📈 💰 🎯 etc.)
3. **Simplify complex div structures** - use markdown lists/blocks
4. **Use `<br>` for line breaks** instead of nested divs
5. **Replace SVG charts with markdown tables or emoji visualizations**

### Step 2: Test Conversion

```bash
npx @marp-team/marp-cli examples/marp_facebook-ads_pptx.md --pptx --allow-local-files -o /tmp/test_facebook.pptx
```

### Step 3: Verify Output

```bash
# Check for PNG images (content rendered correctly)
unzip -l /tmp/test_facebook.pptx | grep "ppt/media"

# Check slide XML for escaped HTML (bad) vs rendered content
unzip -p /tmp/test_facebook.pptx ppt/slides/slide1.xml | grep -o "<a:t>.*</a:t>" | head
```

### Step 4: Update test-powerpoint.sh

Add logic to use `*_pptx.md` files when available:
```bash
if [ -f "${md_file%.md}_pptx.md" ]; then
    source_file="${md_file%.md}_pptx.md"
else
    source_file="$md_file"
fi
```

## Files to Fix

| File | Priority | Issue |
|------|----------|-------|
| `marp_facebook-ads.md` | HIGH | Complex inline styles, SVG charts |
| `marp_sample.md` | HIGH | Likely similar issues |
| `marp_language.md` | DONE | Fixed with emoji |
| Other files | MEDIUM | Check and fix as needed |

## PPTX Best Practices

### DO:
- ✅ Use pure markdown (headers, lists, bold, italic)
- ✅ Use emoji for icons (📊  💰 🎯 )
- ✅ Simple inline styles with hardcoded colors
- ✅ `<br>` for line breaks
- ✅ Marp directives (`<!-- _class: lead -->`)

### AVOID:
- ❌ CSS variables in inline styles (`var(--color)`)
- ❌ SVG elements (use emoji)
- ❌ Deep nested `<div>` structures
- ❌ `<defs>`, gradients in SVG
- ❌ Complex CSS animations/transitions