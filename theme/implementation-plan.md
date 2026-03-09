# Theme Implementation Plan

## Overview

Add a theming system to the main app (NOT the vet app — leave `src/routes/vet/` untouched). Colors are extracted into CSS custom properties so that switching a `data-theme` attribute on `<html>` swaps the entire palette. Tailwind v4's `@theme` block registers these as first-class color tokens, enabling classes like `bg-bg`, `text-fg`, `border-border`, etc.

## File Paths (all relative to project root `web/`)

- `src/app.css` — global styles, `@theme` block, custom utility classes
- `src/routes/(app)/+layout.svelte` — app shell, top bar, font toggle
- `src/lib/components/Sidebar.svelte` — sidebar navigation
- `src/lib/components/NewspaperHeader.svelte` — edition header
- `src/lib/components/KelvinsPick.svelte` — editor's pick footer
- `src/lib/components/HeadlineVideo.svelte` — video embeds
- `src/routes/(app)/[date]/+page.svelte` — edition page grid

## Theme Variables

| Variable name | Tailwind token (auto-generated) | Default value (newspaper theme) | Semantic meaning |
|---|---|---|---|
| `bg` | `bg-bg`, `text-bg` | `stone-200` | Page background |
| `fg` | `bg-fg`, `text-fg`, `border-fg` | `stone-800` | Primary foreground / text / emphasis borders |
| `fg1` | `text-fg1` | `stone-700` | Secondary foreground (subtitles) |
| `fg2` | `text-fg2` | `stone-500` | Tertiary foreground (descriptions, labels, muted text) |
| `border` | `border-border`, `divide-border` | `stone-300` | Default borders and dividers |
| `card-bg` | `bg-card-bg` | `stone-300` | Card / section background |
| `card-fg` | `text-card-fg` | `stone-800` | Card foreground text |
| `sidebar-bg` | `bg-sidebar-bg`, `text-sidebar-bg` | `stone-900` | Sidebar background (also used as active link text) |
| `sidebar-fg` | `text-sidebar-fg` | `stone-100` | Sidebar text |
| `sidebar-item-hover` | `hover:bg-sidebar-item-hover` | `stone-700` | Sidebar link hover background |
| `sidebar-item-active` | `bg-sidebar-item-active` | `stone-100` | Sidebar active link background |

---

## Step 1: Update `src/app.css`

### 1a. Extend the `@theme` block

The existing `@theme` block has `--font-mono`. Add all color variables below it. Each `--color-*` variable points to a `--theme-*` CSS custom property, which is what gets swapped per theme.

```css
@theme {
  --font-mono: "JetBrains Mono", monospace;

  --color-bg: var(--theme-bg);
  --color-fg: var(--theme-fg);
  --color-fg1: var(--theme-fg1);
  --color-fg2: var(--theme-fg2);
  --color-border: var(--theme-border);
  --color-card-bg: var(--theme-card-bg);
  --color-card-fg: var(--theme-card-fg);
  --color-sidebar-bg: var(--theme-sidebar-bg);
  --color-sidebar-fg: var(--theme-sidebar-fg);
  --color-sidebar-item-hover: var(--theme-sidebar-item-hover);
  --color-sidebar-item-active: var(--theme-sidebar-item-active);
}
```

### 1b. Add the default theme definition

Add this block right after the `@theme` block, before the `body` rule. The `:root` selector ensures it applies by default. The `[data-theme="newspaper"]` selector allows explicitly selecting it.

```css
:root, [data-theme="newspaper"] {
  --theme-bg: var(--color-stone-200);
  --theme-fg: var(--color-stone-800);
  --theme-fg1: var(--color-stone-700);
  --theme-fg2: var(--color-stone-500);
  --theme-border: var(--color-stone-300);
  --theme-card-bg: var(--color-stone-300);
  --theme-card-fg: var(--color-stone-800);
  --theme-sidebar-bg: var(--color-stone-900);
  --theme-sidebar-fg: var(--color-stone-100);
  --theme-sidebar-item-hover: var(--color-stone-700);
  --theme-sidebar-item-active: var(--color-stone-100);
}
```

### 1c. Swap hardcoded colors in custom CSS classes

In the `body` rule:
- Change `background-color: var(--color-stone-200)` → `background-color: var(--color-bg)`

In `.yizy-title`:
- Change `color: var(--color-stone-800)` → `color: var(--color-fg)`

In `.yizy-subtitle`:
- Change `color: var(--color-stone-700)` → `color: var(--color-fg1)`

In `.yizy-description`:
- Change `color: var(--color-stone-500)` → `color: var(--color-fg2)`

In `.section-heading`:
- Change `color: var(--color-stone-800)` → `color: var(--color-fg)`
- Change `border-bottom: 2px solid var(--color-stone-800)` → `border-bottom: 2px solid var(--color-fg)`

---

## Step 2: Update `src/routes/(app)/+layout.svelte`

This is the app shell with the top bar and font toggle buttons.

**Page wrapper** (line 27):
- `bg-stone-200` → `bg-bg`

**Top bar** (line 33):
- `bg-stone-200` → `bg-bg`
- `border-stone-300` → `border-border`

**Hamburger button** (line 36):
- `text-stone-600` → `text-fg2`
- `hover:text-stone-900` → `hover:text-fg`

**Font toggle — active state** (lines 52, 61 — both buttons have identical logic):
- `bg-stone-900` → `bg-fg`
- `text-stone-100` → `text-bg`

**Font toggle — inactive state** (lines 53, 62 — both buttons):
- `text-stone-500` → `text-fg`
- `hover:text-stone-900` → `hover:text-bg`

**Separator `/`** (line 56):
- `text-stone-400` → `text-fg2`

---

## Step 3: Update `src/lib/components/Sidebar.svelte`

**Sidebar panel `<aside>`** (line 27):
- `bg-stone-900` → `bg-sidebar-bg`
- `text-stone-100` → `text-sidebar-fg`

**Desktop close button** (line 36):
- `text-stone-400` → `text-sidebar-fg`
- `hover:text-stone-100` → `hover:text-sidebar-fg`

**"Past Editions" label** (line 42):
- `text-stone-400` → `text-sidebar-fg`

**Active edition link** (line 53):
- `bg-stone-100` → `bg-sidebar-item-active`
- `text-stone-900` → `text-sidebar-bg`

**Inactive edition link** (line 54):
- `text-stone-300` → `text-sidebar-fg`
- `hover:bg-stone-700` → `hover:bg-sidebar-item-hover`
- `hover:text-stone-100` → `hover:text-sidebar-fg`

**Mobile backdrop** (line 69):
- `bg-black/50` → **keep as-is** (hardcoded, not theme-dependent)

---

## Step 4: Update `src/lib/components/NewspaperHeader.svelte`

**Header element** (line 15):
- `border-stone-900` → `border-fg`

**Date text** (line 17):
- `text-stone-500` → `text-fg2`

**"Kelvin's Weekly" h1** (line 21):
- `text-stone-900` → `text-fg`

**Inline style on h1** (line 22):
- Remove the entire `style` attribute (`style="font-weight: 800; -webkit-text-stroke: 1px #1c1917;"`)
- Keep `font-weight: 800` by adding `font-extrabold` to the class list instead

**Tagline border wrapper** (line 26):
- `border-stone-400` → `border-border`

**Tagline text** (line 28):
- `text-stone-500` → `text-fg2`

**`/*` delimiter** (line 30):
- `text-stone-400` → `text-fg2`

**`*/` delimiter** (line 35):
- `text-stone-400` → `text-fg2`

---

## Step 5: Update `src/lib/components/KelvinsPick.svelte`

**Footer element** (line 6):
- Remove `border-t-4 border-stone-900` (accent border removed)
- `bg-stone-300` → `bg-card-bg`

**"Editor's Pick" label** (line 8):
- `text-stone-500` → `text-fg2`

**"Kelvin's Pick" heading** (line 11):
- `text-stone-900` → `text-card-fg`

**Accent underline div** (line 12):
- Remove the entire `<div class="w-16 border-b-2 border-stone-900 mb-4"></div>` element

**Pick link title** (line 17):
- `text-stone-900` → `text-card-fg`

**Pick description** (line 21):
- `text-stone-700` → `text-fg1`

---

## Step 6: Update `src/lib/components/HeadlineVideo.svelte`

**Video embed placeholder — top videos** (line 24):
- `bg-stone-800` → `bg-fg`

**Video embed placeholder — rest videos on mobile** (line 54):
- `bg-stone-800` → `bg-fg`

---

## Step 7: Update `src/routes/(app)/[date]/+page.svelte`

**Grid column dividers** (line 17):
- `divide-stone-300` → `divide-border`

---

## Step 8: Add theme dropdown to the top bar

In `src/routes/(app)/+layout.svelte`, add a `<select>` dropdown in the top bar (next to the font toggle) that switches themes. The dropdown should:

1. List available themes (just "Newspaper" for now — more will be added later)
2. On change, set `document.documentElement.dataset.theme` to the selected value
3. Style the dropdown with theme variables: `bg-bg text-fg border-border`

Example markup:
```svelte
<select
  class="bg-bg text-fg border border-border font-mono text-xs px-2 py-1"
  onchange={(e) => { document.documentElement.dataset.theme = e.currentTarget.value; }}
>
  <option value="newspaper">Newspaper</option>
</select>
```

---

## Scope / What NOT to change

- Do NOT modify any files under `src/routes/vet/` or `src/lib/components/vet/`
- Do NOT change the font toggle functionality — only swap its color classes
- Do NOT change layout, spacing, typography sizes, or responsive behavior
- Do NOT add any new themes yet — only set up the "newspaper" default
- Do NOT touch `src/app.d.ts`, `src/lib/types.ts`, `src/lib/data/`, or data loading files
