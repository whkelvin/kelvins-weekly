# Yizy News - Implementation Plan

## Overview

A SvelteKit static site (SSG) styled as a weekly technical newspaper digest. Each week's edition is a "newspaper" with articles, GitHub repos, videos, podcasts, and an editor's pick.

---

## 1. Project Setup

- Initialize SvelteKit project with `npx sv create` (skeleton, TypeScript)
- Configure `adapter-static` for SSG in `svelte.config.js`
- Install & configure Tailwind CSS v4 + `@tailwindcss/typography` plugin
- Add JetBrains Mono font (Google Fonts or self-hosted)

## 2. Data Model

Each weekly newspaper is a JSON file in `src/lib/data/` named by date (e.g., `2026-02-23.json`).

```jsonc
{
  "date": "2026-02-23",          // Monday date
  "articles": [                   // Column 1 - HackerNews articles
    { "title": "...", "url": "...", "description": "..." }
  ],
  "repos": [                      // Column 1 - GitHub trending
    { "name": "...", "url": "...", "stars_this_week": 1200, "description": "..." }
  ],
  "headline_video": {             // Column 2 - main video
    "title": "...",
    "youtube_id": "...",
    "description": "..."
  },
  "videos": [                     // Column 2 - video list
    { "title": "...", "youtube_id": "...", "description": "...", "thumbnail": "..." }
  ],
  "podcasts": [                   // Column 3 - Spotify embeds
    { "title": "...", "spotify_embed_url": "..." }
  ],
  "links": [                      // Column 3 - misc links
    { "title": "...", "url": "...", "description": "..." }
  ],
  "kelvins_pick": {               // Footer section
    "title": "...",
    "url": "...",
    "description": "..."
  }
}
```

A helper `src/lib/data/index.ts` will export functions:
- `getEditions()` — list all available editions (sorted newest first)
- `getEdition(date: string)` — load one edition's JSON
- `getLatestEdition()` — shortcut for the most recent

## 3. Routing

| Route | Purpose |
|---|---|
| `/` | Redirects/loads the latest edition |
| `/[date]` | Renders the newspaper for that week |

Since this is SSG, use `+page.ts` with `export const prerender = true` and `entries()` to generate a page for each edition. The `/` route loads the latest edition data directly (no redirect needed, just load latest in its `+page.ts`).

## 4. Layout & Components

### Global Layout (`+layout.svelte`)
- Sidebar (left) + main content area (right)
- Sidebar: list of past editions as links (`/2026-02-23`, `/2026-02-16`, etc.)
- Sidebar collapses to a hamburger menu on mobile

### Newspaper Page Components

```
src/lib/components/
├── Sidebar.svelte            # Navigation to past editions
├── NewspaperHeader.svelte    # "The Monday Report" + tagline
├── ArticleList.svelte        # Col 1: linked article titles + descriptions
├── RepoList.svelte           # Col 1: GitHub repos section
├── HeadlineVideo.svelte      # Col 2: YouTube embed + title + description
├── VideoList.svelte          # Col 2: thumbnail + title/description rows
├── PodcastSection.svelte     # Col 3: Spotify embeds
├── LinkList.svelte           # Col 3: external links + descriptions
└── KelvinsPick.svelte        # Footer: editor's recommendation
```

### Page Structure (`/[date]/+page.svelte`)

```
┌─────────────────────────────────────────────┐
│           THE MONDAY REPORT                 │
│       /* Stay up to date the Yizy way */    │
├──────────┬───────────────┬──────────────────┤
│ Col 1    │ Col 2         │ Col 3            │
│          │               │                  │
│ Articles │ Headline      │ Podcasts         │
│ (links + │ Video         │ (Spotify embeds) │
│  desc)   │ (YT embed +   │                  │
│          │  title + desc)│ Links            │
│ Repos    │               │ (titles + desc)  │
│ (links + │ Video List    │                  │
│  desc)   │ (thumb+title) │                  │
├──────────┴───────────────┴──────────────────┤
│              Kelvin's Pick                  │
│         (editor recommendation)             │
└─────────────────────────────────────────────┘
```

## 5. Responsive Behavior

Desktop (3 columns): `grid-cols-3`

Mobile reorder (single column, using CSS order):
1. Column 2 (videos — the main content)
2. Column 1 (articles & repos)
3. Column 3 (podcasts & links)

Use Tailwind's `order-*` utilities with responsive breakpoints.

## 6. Styling

- **Background**: warm grey (`bg-stone-100` or similar newsprint tone)
- **Text**: black/near-black (`text-stone-900`)
- **Font - Heading/Tagline**: JetBrains Mono Bold
- **Font - Body**: JetBrains Mono Regular
- **Newspaper feel**: subtle borders between columns, serif-ish section headers, thin horizontal rules, compact spacing
- **Tagline** rendered as: `/* Stay up to date the Yizy way */` (code-comment style, slightly muted color)
- Typography plugin used for prose sections (descriptions)

## 7. Implementation Order

1. **Scaffold**: SvelteKit + adapter-static + Tailwind + typography plugin + fonts
2. **Data layer**: Create sample JSON, write loader functions
3. **Layout**: Global layout with sidebar
4. **Header component**: Title + tagline
5. **Column components**: Build each section component
6. **Page assembly**: Wire up 3-column grid with responsive ordering
7. **Footer**: Kelvin's Pick section
8. **Routing**: Dynamic `[date]` route with SSG prerendering + `/` route
9. **Polish**: Newspaper styling, spacing, dividers, hover states

## 8. Key Dependencies

| Package | Purpose |
|---|---|
| `@sveltejs/adapter-static` | SSG output |
| `tailwindcss` | Utility CSS |
| `@tailwindcss/typography` | Prose styling |
| `@fontsource/jetbrains-mono` | Self-hosted font |
