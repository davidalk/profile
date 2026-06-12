# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Personal profile website for David Al-Kanani, built with [Hugo](https://gohugo.io/) using the [hugo-resume](https://github.com/eddiewebb/hugo-resume) theme (managed as a Hugo Module). The site is deployed to GitHub Pages from the `docs/` output directory.

## Commands

```bash
# Install theme dependencies
hugo mod tidy

# Run dev server (with drafts)
hugo server -D

# Build the site (output to docs/)
hugo

# Deploy: builds and pushes to master (requires clean working tree)
./deploy.sh

# Update theme to latest
hugo mod get -u github.com/eddiewebb/hugo-resume

# Locate theme source files in Hugo's module cache (macOS path)
find ~/Library/Caches/hugo_cache -path "*/eddiewebb/hugo-resume*" -type f -not -path "*/.*"
```

## Architecture

Content is driven by three JSON data files — not Markdown content pages:

- `data/skills.json` — grouped skill lists
- `data/experience.json` — work history with `notes` array for bullet points
- `data/education.json` — education entries with `notes` array

`config.toml` controls which sections appear via `params.sections = ["skills", "experience", "education"]`. Toggling a section on/off is done here.

`layouts/index.html` iterates `params.sections` and dispatches each to the corresponding partial in `layouts/partials/portfolio/<section>.html`.

## Customizations (overriding the theme)

The theme is pulled from Hugo's module cache (`~/Library/Caches/hugo_cache` on macOS); it is never edited directly. All customizations use Hugo's override mechanism — local files shadow theme files at the same relative path:

| File | What it overrides |
|------|-------------------|
| `layouts/index.html` | Homepage section rendering loop |
| `layouts/partials/about.html` | About/header partial |
| `layouts/partials/portfolio/skills.html` | Skills section (`hugo.Data` access) |
| `layouts/partials/portfolio/experience.html` | Experience with `notes` bullet support |
| `layouts/partials/portfolio/education.html` | Education with `notes` bullet support |
| `static/css/resume-override.css` | Custom styling (primary color `#3C7A89`) |

To override a new theme file: copy it from Hugo's module cache to the matching path under `layouts/` or `static/`.

Local partials use `hugo.Data` (the current API as of Hugo v0.156.0+). If data access breaks after a theme update, check the portfolio partials first.
