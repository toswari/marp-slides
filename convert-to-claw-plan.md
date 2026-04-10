# PPTX Conversion Fix Plan

## Problem Analysis

The PowerPoint (PPTX) export from Marp renders slides as **PNG images** embedded in the PPTX file. This is the expected behavior for styled slides.

### Important Finding:
Marp's PPTX export creates slides as PNG images, NOT as native PowerPoint text/shapes. This means:
- ✅ Visual fidelity is preserved (what you see is what you get)
- ✅ Complex CSS styling works correctly
- ❌ Text is NOT editable in PowerPoint
- ❌ Content is rendered as images, not native PPTX elements

## Root Cause of Original Issue

The original issue with SVG markup showing as raw text was caused by:
1. **Inline `<svg>` elements** being serialized as XML text instead of rendered
2. **Complex nested HTML** not being properly converted to the image

## Solution: Simplified Markdown for PPTX ✅

For best PPTX results, use **simplified markdown** without complex HTML structures:

### What Works Best for PPTX:
- ✅ Pure markdown (headers, lists, bold, italic, blockquotes)
- ✅ Emoji characters (📚 💬 ⭐  🍋)
- ✅ Simple tables (avoid `<span>` inside cells)
- ✅ Line breaks (`<br>` or two spaces at end of line)
- ✅ Marp directives (`<!-- _class: lead -->`)
- ✅ CSS for colors, fonts, backgrounds (rendered into PNG)

### What to Avoid for PPTX:
- ❌ Inline `<svg>` elements (use emoji instead)
- ❌ Complex nested `<div>` structures with CSS grids
- ❌ `<span>` elements with classes in table cells

## Implementation

### Files Fixed

| File | Original Issue | Fix Applied |
|------|---------------|-------------|
| `marp_language.md` | SVG icons, complex HTML | Simplified markdown, emoji icons |

### Example Fix (marp_language.md)

**Before (SVG - shows as raw XML in PPTX):**
```html
<svg width="14" height="14" viewBox="0 0 24 24">
  <path d="M2 3h6a4 4 0 0 1 4 4v14a3 3 0 0 0-3-3H2z"/>
</svg>
```

**After (Emoji - renders correctly):**
```
📚 JLPT N5
```

## Testing Results

| File | Size | Status |
|------|------|--------|
| `marp_language.pptx` | 461KB | ✅ Content renders as PNG image |
| All 24 examples | Various | ✅ All converted successfully |

### Verification Method:
```bash
# Check PPTX contains PNG images (content is rendered)
unzip -l file.pptx | grep "ppt/media"
# Output shows: Slide-1-image-1.png, Slide-2-image-1.png, etc.
```

## test-powerpoint.sh Updates

The script now:
1. Looks for `*_pptx.md` versions first (PPTX-optimized source)
2. Falls back to original `.md` files if no optimized version exists
3. All 24 examples convert successfully

## PPTX Best Practices

1. **Use emoji instead of SVG icons** - 📚  💬 ☕ 🍋 🌿
2. **Use pure markdown tables** - avoid `<span>` in cells
3. **Use `<br>` for line breaks** - or two spaces at end of line
4. **Keep CSS simple** - colors, fonts, backgrounds work fine
5. **Test with `unzip -l`** - verify PNG images are embedded

## Action Items

- [x] Create `marp_language_pptx.md` with simplified markdown
- [x] Update `test-powerpoint.sh` to use `*_pptx.md` files
- [x] Regenerate all 24 PPTX files
- [ ] Create PPTX-optimized versions for other SVG-heavy files
- [ ] Document PPTX limitations in README
