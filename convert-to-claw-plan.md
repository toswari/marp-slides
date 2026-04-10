# PPTX Conversion Fix Plan

## Problem Analysis

The PowerPoint (PPTX) export from Marp is rendering raw HTML/SVG code as text instead of properly rendering the visual elements. This is visible in `marp_language.pptx` where:
- SVG markup is displayed as raw text
- HTML tags like `<div>`, `<span>` are visible
- CSS classes and inline styles are shown as text

## Root Cause

Marp's PPTX export has limitations compared to PDF/HTML:
1. **Limited HTML support**: PPTX export doesn't fully support complex HTML structures
2. **SVG rendering issues**: Inline SVG in slides gets serialized as text
3. **CSS limitations**: Advanced CSS features may not translate to PowerPoint

## Solution: Replace SVG with Emoji ✅

After testing, the fix is to **replace inline SVG elements with emoji characters** for PPTX-compatible output.

### What Works in PPTX:
- ✅ Basic markdown (headers, lists, bold, italic)
- ✅ Tables
- ✅ CSS styling (colors, fonts, layouts via `<div>` with inline styles)
- ✅ Emoji characters (📚  💬  etc.)
- ✅ Marp directives (`<!-- _class: lead -->`)

### What Doesn't Work in PPTX:
- ❌ Inline `<svg>` elements (render as raw XML text)
- ❌ Complex nested HTML structures

## Implementation

### Files to Fix

Create `*_pptx.md` versions of files with heavy SVG usage:

| File | Issue | Fix |
|------|-------|-----|
| `marp_language.md` | SVG icons, kanji box | Replace with emoji (📚 ⭐ 💬) |
| `marp_cocktail.md` | SVG garnish icons | Replace with emoji (🍋 🍒 🌿) |
| `marp_coffee.md` | SVG coffee icons | Replace with emoji (☕ 🫘 ) |

### Example Fix (marp_language.md)

**Before (SVG):**
```html
<svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="#e94560" stroke-width="2">
  <path d="M2 3h6a4 4 0 0 1 4 4v14a3 3 0 0 0-3-3H2z"/>
</svg>
JLPT N5
```

**After (Emoji):**
```html
📚 JLPT N5
```

## Testing Results

- ✅ `marp_language_pptx.md` → PPTX (1.3MB) - Valid structure, no SVG text artifacts
- Test command: `npx @marp-team/marp-cli file_pptx.md --pptx -o output.pptx`

## Action Items

- [ ] Create `_pptx.md` versions for all SVG-heavy examples
- [ ] Update `test-powerpoint.sh` to use `_pptx.md` files when available
- [ ] Document PPTX best practices in README
- [ ] Consider automated pre-processor script for future conversions
