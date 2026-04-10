# MARP Slides

A skill for creating beautiful MARP presentation decks — SVG charts, dashboard components, dark/light themes, and 22 curated example decks.

## Quick Start

### 1. Install Dependencies

```bash
npm install
```

### 2. Configure VS Code

Copy settings to your VS Code user settings:

```json
{
  "markdown.marp.enableHtml": true,
  "markdown.marp.allowLocalFiles": true
}
```

Or use the provided `settings.json` as reference.

### 3. Create Your Deck

```bash
npx @marp-team/marp-cli slides.md --pdf --allow-local-files
```

## Project Structure

```
marp-slides/
├── skill.yaml              # Skill definition (name, triggers, metadata)
├── instructions.md         # Core rules and guidelines
├── README.md               # This file
├── package.json            # Dependencies and build scripts
├── settings.json           # VS Code settings reference
│
├── templates/
│   ├── dark-theme.css      # Dark theme (Outfit + Raleway)
│   └── light-theme.css     # Light theme (Space Grotesk + IBM Plex Mono)
│
├── components/
│   ├── metrics.md          # Metric cards, status dots, verdict tags
│   ├── charts.md           # SVG charts (line, donut, gauge, bar)
│   ├── interactive.md      # details, tooltips, sliders, progress
│   ├── layouts.md          # splits, mockups, timelines, cards
│   └── icons.md            # SVG icon library (20+ icons)
│
├── examples/
│   ├── README.md           # Category index with usage guide
│   ├── examples.yaml       # Machine-readable manifest
│   └── *.md                # 22 curated example decks
│
└── exports/                # Generated output (PDF, PPTX, HTML)
```

## Usage

### Trigger Keywords

This skill activates on: `marp`, `slides`, `presentation`, `deck`, `dashboard`, `charts`

### Example Prompts

```
Create a MARP presentation reviewing my Q1 sales data. Dark theme, include stat cards and a bar chart.
```

```
Make me a deck about my favorite coffee brewing methods. Editorial style, warm tones.
```

```
Build a fitness dashboard presentation from this CSV data.
```

### Build Commands

```bash
# PDF export
npm run build:pdf

# PowerPoint export
npm run build:pptx

# HTML export (keeps animations and interactive elements)
npm run build:html

# All formats
npm run build:all
```

## Features

- **Dark and Light Themes** — Tested font pairings (Outfit + Raleway, Space Grotesk + IBM Plex Mono)
- **SVG Charts** — Line/area, donut/pie, gauges, sparklines, bar charts, radar
- **Dashboard Components** — Metric cards, status dots, verdict tags, hover rows
- **Interactive Elements** — Collapsible sections, tooltips, progress bars (HTML only)
- **Layout Components** — Before/after splits, terminal mockups, chat bubbles, timelines
- **Icon Library** — 20+ inline SVG icons for finance, status, actions, and more

## Example Categories

| Category | Examples | Style |
|----------|----------|-------|
| Data / Dashboard | facebook-ads, fitness, comparison | SVG charts, stat cards, gauges |
| Lifestyle / Editorial | coffee, wine-tasting, cocktail | Warm tones, photography, ratings |
| Guide / How-To | garden, houseplant, home-gym | Step-by-step, tips, checklists |
| Fun / Creative | kids-party, board-game, film-director | Playful, colorful, interactive |
| Travel / Location | travel, walking-tour, road-trip | Maps, itineraries, photo backgrounds |
| Showcase | hero, apartment, wardrobe | Visual-first, minimal text |

## Learning from Examples

The `examples/` folder contains 22 curated reference decks. **Before generating any deck, read 2-3 examples that match the requested style.** These teach composition — how to combine components into slides that look good.

See [examples/README.md](examples/README.md) for the full category index and selection guide.

## License

MIT