# MARP Slides Instructions

## Core Rules

1. **Slide Structure**: Slides separated by `---`
2. **Frontmatter**: YAML frontmatter controls theme/pagination/styles
3. **HTML Enabled**: `enableHtml` unlocks SVG, cards, charts, animations, interactive elements
4. **Aspect Ratio**: Default 16:9 (1280x720)
5. **One Idea Per Slide**: Overflow clips silently

## Design Rules

1. One idea per slide. Overflow clips silently.
2. h1 = white. Accent for data highlights only.
3. Body text #999, labels #666. Never darker than #555.
4. Max 6 rows per list slide.
5. Charts over numbers. Mix visual types across slides.
6. Relative paths only for images.
7. Always preview — no overflow warnings in source.
8. Per-slide overrides: `_backgroundColor`, `_header`, `_paginate`, `_footer`

## Heading Hierarchy

- **h1** = title slides (white, extra large)
- **h2** = subtitle (grey, thin)
- **h3** = section label (muted, uppercase, small)

## Font Pairings

| Heading | Body | Use |
|---------|------|-----|
| Outfit 800 | Raleway 100 | Dashboard, data (default) |
| DM Serif Display | DM Sans 300 | Recipes, editorial |
| Space Grotesk 700 | IBM Plex Mono 300 | Travel, light themes |
| Sora 700 | Sora 200 | Product comparisons |
| Urbanist 800 | Urbanist 100 | Music, Spotify-style |
| Plus Jakarta Sans 800 | Plus Jakarta Sans 200 | Retros, team decks |

## Image Guidelines

**CRITICAL**: Relative paths only. `./image.png` works. Absolute paths break in preview.

- **Logo header**: `header: '![w:100](./logo.png)'` — hide per slide: `<!-- _header: '' -->`
- **Photo bg**: `![bg brightness:0.15](https://unsplash.com/photo-ID?w=1400)`
- **Split**: `![bg right:35% brightness:0.2 blur:3px](url)` or `![bg left:30%](url)`
- **CDN logos**: `<img src="https://cdn.jsdelivr.net/gh/homarr-labs/dashboard-icons/png/name.png" style="width:200px;" />`
- **Centered inline**: Wrap img in `<div style="display:flex; justify-content:center;">` with border-radius and border

## Example Decks Reference

Before generating any deck, read 2-3 examples that match the requested style. These are the quality bar.

| Category | Examples |
|----------|----------|
| Data / Dashboard | `marp_facebook-ads.md`, `marp_fitness.md`, `marp_comparison.md` |
| Lifestyle / Editorial | `marp_coffee.md`, `marp_wine-tasting.md`, `marp_cocktail.md` |
| Guide / How-To | `marp_garden.md`, `marp_houseplant.md`, `marp_home-gym.md` |
| Fun / Creative | `marp_kids-party.md`, `marp_board-game.md`, `marp_film-director.md` |
| Travel / Location | `marp_travel.md`, `marp_walking-tour.md`, `marp_road-trip.md` |
| Showcase / Hero | `marp_hero.md`, `marp_apartment.md`, `marp_wardrobe.md` |
| Reference / Sampler | `marp_sample.md` |

## Export Commands

```bash
# PDF
npx @marp-team/marp-cli slides.md --pdf --allow-local-files

# PowerPoint
npx @marp-team/marp-cli slides.md --pptx --allow-local-files

# HTML (keeps animations and interactive elements)
npx @marp-team/marp-cli slides.md --html --allow-local-files
```

Note: `--pptx-editable` needs LibreOffice. Animations + details only work in HTML export.