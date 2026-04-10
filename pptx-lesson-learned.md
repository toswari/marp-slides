# PPTX Lesson Learned

## Critical Finding: Marp PPTX Structure Issue

### The Real Problem

After analyzing the PPTX internal structure, I discovered the **actual issue**:

```xml
<!-- Slide XML shows ONLY background image, NO content shapes -->
<p:cSld name="Slide 1">
  <p:bg>
    <p:bgPr>
      <a:blipFill>
        <a:blip r:embed="rId1"/>  <!-- Only background image reference -->
      </a:blipFill>
    </p:bgPr>
  </p:bg>
  <p:spTree>  <!-- Empty shape tree - NO text, NO shapes! -->
    <p:nvGrpSpPr>...</p:nvGrpSpPr>
    <p:grpSpPr>...</p:grpSpPr>
  </p:spTree>
</p:cSld>
```

### What's Happening

1. **Marp renders slides as PNG images** (confirmed: `Slide-1-image-1.png` exists, 989KB)
2. **The PNG is embedded as a BACKGROUND** (`<p:bgPr><a:blipFill>`)
3. **NO actual content shapes are added** to the slide (`<p:spTree>` is empty)
4. **PowerPoint shows the slide layout background, not the rendered content**

### Why It Looks Wrong

The rendered PNG image is set as the **slide background**, but PowerPoint may:
- Not display background images in certain view modes
- Show the slide layout placeholder instead
- Require specific settings to display background images

### Verification Results

| Check | Result |
|-------|--------|
| PNG images embedded? | ✅ YES (17 images, 989KB for slide 1) |
| PNG is valid image? | ✅ YES (starts with `89504e47` - PNG header) |
| Slide XML has content shapes? | ❌ NO (empty `spTree`) |
| Image used as background? | ✅ YES (`<p:bgPr><a:blipFill>`) |

### Marp CLI Options Tested

```bash
# Current command (from test-powerpoint.sh)
npx @marp-team/marp-cli file.md --pptx --allow-local-files -o file.pptx

# Available options that might help:
--image-scale     # Default 2 for PPTX (controls render resolution)
--html            # Enable/disable HTML tags
--template        # Choose template (bare, bespoke)
```

### Root Cause Analysis

**Marp's PPTX export workflow:**
1. Render markdown + CSS to an image (PNG)
2. Create PPTX with slide layout
3. Set rendered image as slide **background**
4. **Do NOT add text/shapes to slide** (relies on background image)

**The issue is NOT with the markdown source** - the PNG is being generated correctly.

**The issue IS with how PowerPoint interprets the PPTX structure:**
- Background images may not display in all views
- PowerPoint may need explicit picture shapes, not background fills

### Potential Solutions

#### Option 1: Check PowerPoint View Settings
The PPTX might be correct, but PowerPoint view settings may hide background images.
- **Test:** Open in "Slide Show" mode, not "Normal" view
- **Test:** Check "Hide Background Graphics" setting

#### Option 2: Use `--html` flag
Enable HTML support in Marp:
```bash
npx @marp-team/marp-cli file.md --pptx --html --allow-local-files -o file.pptx
```

#### Option 3: Use `--template bare`
Remove bespoke template that might interfere:
```bash
npx @marp-team/marp-cli file.md --pptx --template bare --allow-local-files -o file.pptx
```

#### Option 4: Check Marp Version
Older versions may have PPTX bugs:
```bash
npx @marp-team/marp-cli --version
```

### Next Steps for pptx-fix-plan.md

1. Test with `--html` flag
2. Test with `--template bare`
3. Check Marp version and update if needed
4. Compare with a known-working PPTX export
5. Test opening in different PowerPoint versions