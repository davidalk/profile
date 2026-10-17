# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Personal profile website for David Al-Kanani, built with [Hugo](https://gohugo.io/) using the [hugo-resume](https://github.com/eddiewebb/hugo-resume) theme (managed as a Hugo Module). The site is deployed to GitHub Pages by the GitHub Actions workflow in `.github/workflows/hugo.yml` — every push to `master` builds and publishes it. The workflow pins `HUGO_VERSION`; keep it in sync when upgrading the local Hugo. The custom domain (alkanani.dev) lives in the repo's Settings → Pages, not in a CNAME file.

## Commands

```bash
# Deploy: push to master — GitHub Actions builds and publishes
git push origin master

# Update theme to latest
hugo mod get -u github.com/eddiewebb/hugo-resume

# Locate theme source files in Hugo's module cache (macOS path)
find ~/Library/Caches/hugo_cache -path "*/eddiewebb/hugo-resume*" -type f -not -path "*/.*"
```

## Architecture

Content comes from the JSON files in `data/`, not Markdown content pages; `params.sections` in `config.toml` toggles which sections appear.

## Customizations (overriding the theme)

The theme is pulled from Hugo's module cache (`~/Library/Caches/hugo_cache` on macOS); it is never edited directly. All customizations use Hugo's override mechanism — local files shadow theme files at the same relative path:

| File | What it overrides |
|------|-------------------|
| `layouts/_default/baseof.html` | Base template. Intended deltas vs the theme: removes the footer section (the "tech tag lists" credit link and the git-commit line), pins the devicon CDN stylesheet to a fixed version instead of `@latest`, and adds a canonical link plus JSON-LD Person schema (driven by `params.jobTitle`/`params.employer`; deliberately omits email to preserve the obfuscation). After a theme update, re-copy the theme's version and re-apply those changes |

The other overrides (homepage loop, about partial, portfolio partials, `static/css/resume-override.css`) are visible under `layouts/` and `static/`.

To override a new theme file: copy it from Hugo's module cache to the matching path under `layouts/` or `static/`.

Local partials use `hugo.Data` (the current API as of Hugo v0.156.0+). If data access breaks after a theme update, check the portfolio partials first.
