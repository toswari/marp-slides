# MARP Slides Skill - How To Guide

## Installation

### Step 1: Clone the Repository

```bash
git clone https://github.com/toswari/marp-slides.git
cd marp-slides
```

### Step 2: Install Dependencies

```bash
npm install
```

This installs `@marp-team/marp-cli` for exporting presentations.

### Step 3: Install VS Code Extension

Install the **Marp for VS Code** extension:

1. Open VS Code
2. Go to Extensions (Ctrl+Shift+X or Cmd+Shift+X)
3. Search for "Marp"
4. Install "Marp for VS Code" by Marp Team

### Step 4: Configure VS Code Settings

Add these settings to your VS Code `settings.json`:

```json
{
  "markdown.marp.enableHtml": true,
  "markdown.marp.allowLocalFiles": true
}
```

Or copy the provided `settings.json` to your workspace.

### Step 5: Install Fonts (Optional but Recommended)

For best results, install these Google Fonts:

- **Outfit** - Headings (dark theme)
- **Raleway** - Body text (dark theme)
- **Space Grotesk** - Headings (light theme)
- **IBM Plex Mono** - Code (light theme)

Download from [fonts.google.com](https://fonts.google.com) or install via:

```bash
# macOS (with homebrew)
brew install --cask font-outfit
brew install --cask font-raleway
brew install --cask font-space-grotesk
brew install --cask font-ibm-plex-mono
```

---

## Using the Skill in OpenClaw

### Activate the Skill

The skill activates automatically when your prompt contains these keywords:
- `marp`
- `slides`
- `presentation`
- `deck`
- `dashboard`
- `charts`

### Example Prompts

#### Basic Presentation

```
Create a MARP presentation about my favorite coffee brewing methods. Use warm tones and editorial style.
```

#### Data Dashboard

```
Create a MARP dashboard presentation reviewing my Q1 sales data. Include:
- Revenue: $45,000 (up 23% from Q4)
- New customers: 1,234
- Top product: Widget Pro at 456 units
Use dark theme with orange accent color.
```

#### Fitness Tracker

```
Make a fitness dashboard presentation with:
- Weekly workout summary (5 workouts, 320 minutes)
- Habit tracker for water intake (8 glasses/day goal)
- Progress toward 10K steps daily average
Show trends over 4 weeks.
```

#### Product Comparison

```
Create a comparison deck for three project management tools:
- Asana: $10.99/user, good for small teams
- Monday: $8/user, best for visual workflows  
- ClickUp: $5/user, most features
Include verdict tags and recommendation.
```

#### Travel Guide

```
Create a travel presentation for a 5-day Tokyo trip. Include:
- Day-by-day itinerary
- Must-visit landmarks
- Food recommendations
- Budget breakdown
Use full-bleed photography style.
```

---

## Generating and Viewing Output

### Option 0: Ask OpenClaw to Export (Easiest!)

After OpenClaw generates your slides content, simply say:

```
Export to PDF
```
or
```
Build HTML version
```

OpenClaw will run the marp-cli command automatically and generate the output file.

**Available export commands:**
- "Export to PDF" → creates `slides.pdf`
- "Export to PowerPoint" → creates `slides.pptx`
- "Export to HTML" → creates `slides.html`

---

### Option 1: VS Code Preview (Recommended)

1. Create a new file: `slides.md`
2. Ask OpenClaw to generate content
3. Open the Marp preview:
   - Click the Marp icon in the top-right, OR
   - Press `Ctrl+Shift+M` (Cmd+Shift+M on Mac), OR
   - Right-click → "Open Marp Preview"

### Option 2: Export to PDF

```bash
npm run build:pdf
# or
npx @marp-team/marp-cli slides.md --pdf --allow-local-files -o output.pdf
```

### Option 3: Export to PowerPoint

```bash
npm run build:pptx
# or
npx @marp-team/marp-cli slides.md --pptx --allow-local-files -o output.pptx
```

### Option 4: Export to HTML (Interactive)

```bash
npm run build:html
# or
npx @marp-team/marp-cli slides.md --html --allow-local-files -o output.html
```

**Note:** HTML export preserves animations and interactive elements (collapsible sections, tooltips, sliders).

---

## Complete Workflow Example

### Workflow A: With OpenClaw Export

#### 1. Request Content from OpenClaw

**Prompt:**
```
Create a MARP presentation for a monthly Facebook Ads report. Dark theme.
Include:
- Title slide: "March 2024 Ads Report"
- Summary metrics: $10,939 spend, 3.8x ROAS, 1.31M impressions
- Funnel: Impressions → Reach → Link Clicks → Conversions
- Budget allocation pie chart by campaign
- Top 3 campaigns with ROAS and verdicts
- Recommendations for April
```

#### 2. Ask OpenClaw to Export

Simply say: **"Export this to PDF"**

OpenClaw runs:
```bash
npx @marp-team/marp-cli slides.md --pdf --allow-local-files
```

#### 3. View Output

- PDF: Open `slides.pdf` in your PDF viewer
- Or say "Export to HTML" for an interactive web version

---

### Workflow B: Manual Export

#### 1. Save the Generated Content

Save the output as `slides.md` in the project root.

#### 2. Preview in VS Code

Open the Marp preview to see the rendered slides.

#### 3. Export to Your Format

```bash
# For sharing via email
npm run build:pdf

# For presenting in person
npm run build:pptx

# For web viewing with animations
npm run build:html
```

#### 4. View Output

- PDF: Open `output.pdf` in any PDF reader
- PPTX: Open `output.pptx` in PowerPoint
- HTML: Open `output.html` in a web browser

---

## Customization Tips

### Change Theme

Add to the frontmatter of your `slides.md`:

```markdown
---
marp: true
theme: light  # or 'dark' (default)
---
```

### Custom Accent Color

```markdown
---
marp: true
style: |
  :root {
    --accent: #your-color-here;
  }
---
```

### Add Header/Footer

```markdown
---
marp: true
header: "Your Company Name"
footer: "Confidential"
---
```

### Use Specific Example Style

Reference an example deck in your prompt:

```
Create a presentation about my home gym setup. Use the style from the 
marp_home-gym.md example with equipment cards and budget breakdown.
```

---

## Troubleshooting

### Issue: HTML elements not rendering

**Solution:** Ensure `enableHtml: true` is in frontmatter and VS Code settings.

### Issue: Fonts not displaying

**Solution:** Install the required fonts or the presentation will fall back to system fonts.

### Issue: Export fails with "allow-local-files"

**Solution:** Add `--allow-local-files` flag to marp-cli commands.

### Issue: Charts not showing

**Solution:** Ensure SVG syntax is correct and all tags are properly closed.

---

## Quick Reference

| Command | Description |
|---------|-------------|
| `npm run build:pdf` | Export to PDF |
| `npm run build:pptx` | Export to PowerPoint |
| `npm run build:html` | Export to HTML (interactive) |
| `Ctrl+Shift+M` | Open Marp preview in VS Code |

| Component | File |
|-----------|------|
| Metric cards | `components/metrics.md` |
| Charts | `components/charts.md` |
| Interactive | `components/interactive.md` |
| Layouts | `components/layouts.md` |
| Icons | `components/icons.md` |
| Examples | `examples/README.md` |

---

## Learn More

- [Marp Documentation](https://marp.app/)
- [Marp CLI Usage](https://github.com/marp-team/marp-cli)
- [Example Decks](examples/README.md)
- [Component Library](components/)