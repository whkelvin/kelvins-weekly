# Theme Exploration

## Current Colors in Use

The app uses the **Tailwind `stone` palette** almost exclusively. Here is every color token found across all source files.

### Backgrounds
| Token | Where Used |
|---|---|
| `stone-200` | Page background (`body`, `+layout.svelte`, vet layout), top bar, export sticky bar |
| `stone-300` | KelvinsPick footer background |
| `stone-100` | Vet import panel background, sidebar active link bg, font-toggle active bg |
| `stone-700` | Sidebar link hover bg, vet top-bar button bg |
| `stone-800` | Video iframe placeholder bg |
| `stone-900` | Sidebar bg, vet top-bar bg, buttons (export, load, font-toggle active), vet video embed bg |
| `white` | Vet textarea bg |
| `black/50` | Mobile sidebar backdrop overlay |

### Text
| Token | Where Used |
|---|---|
| `stone-900` | Titles (`.yizy-title`), KelvinsPick heading/link, sidebar active link text, header `h1`, font-toggle active text |
| `stone-800` | Section headings (`.section-heading`), vet toggle-all hover |
| `stone-700` | Subtitles (`.yizy-subtitle`), KelvinsPick description |
| `stone-600` | Top-bar hamburger button text, vet drag handle hover |
| `stone-500` | Descriptions (`.yizy-description`), date subtitle, tagline text, font-toggle inactive, vet placeholder/label text, sidebar "Past Editions" label |
| `stone-400` | Comment delimiters (`/*` `*/`), font-toggle separator, sidebar close button, vet star count, vet "check to keep" label, vet drag handle, vet textarea placeholder |
| `stone-300` | Sidebar inactive link text |
| `stone-200` | Vet top-bar button text |
| `stone-100` | Sidebar text, vet top-bar title, export/load button text, font-toggle active text |

### Borders
| Token | Where Used |
|---|---|
| `stone-900` | Header bottom border (4px), KelvinsPick top border (4px), section heading bottom border (2px), KelvinsPick accent underline |
| `stone-700` | Vet top-bar bottom border |
| `stone-500` | Vet drag-over indicator border, vet textarea focus ring |
| `stone-400` | Header tagline top/bottom borders |
| `stone-300` | Top-bar bottom border, grid column dividers, vet import panel border, vet export bar border, vet textarea border |
| `transparent` | Vet default drag border |

### Accent / Non-stone Colors
| Token | Where Used |
|---|---|
| `red-600` | Vet JSON parse error text |
| `green-600` | Vet checkbox accent |

### Inline Styles (not Tailwind classes)
| Value | Where Used |
|---|---|
| `#1c1917` | `-webkit-text-stroke` on the main "Kelvin's Weekly" `h1` (this is `stone-900` hex) |

## Summary

- The palette is monochromatic: **stone-100 through stone-900** covers ~95% of all color usage.
- Only two non-stone colors exist: `red-600` (error text) and `green-600` (checkbox accent), both in the vet tool only.
- There is one hardcoded hex value (`#1c1917`) that should be converted to a CSS variable.
- The `body` background is set via CSS custom property `var(--color-stone-200)` in `app.css`, while most components use Tailwind classes directly.
- Custom CSS classes (`.yizy-title`, `.yizy-subtitle`, `.yizy-description`, `.section-heading`) in `app.css` also reference `var(--color-stone-*)` variables.

## Color Roles (semantic mapping)

Based on usage patterns, the current colors map to these semantic roles:

| Role | Current Token |
|---|---|
| **Page background** | `stone-200` |
| **Surface / card** | `stone-100`, `stone-300` |
| **Primary text** | `stone-900` |
| **Secondary text** | `stone-700` |
| **Muted text** | `stone-500` |
| **Subtle text** | `stone-400` |
| **Primary accent / emphasis** | `stone-900` (borders, buttons) |
| **Sidebar background** | `stone-900` |
| **Sidebar text** | `stone-100` / `stone-300` / `stone-400` |
| **Interactive hover** | `stone-700` (sidebar), `stone-900` (text) |
| **Dividers** | `stone-300`, `stone-400` |
| **Error** | `red-600` |
| **Success** | `green-600` |
