# David Al-Kanani Profile Website

This is a website generator project for my personal profile website. This generator uses [Hugo](https://gohugo.io/) with the [hugo-resume](https://themes.gohugo.io/hugo-resume/) theme.

## Project Setup

1. Clone this repo
2. Ensure you have [Hugo](https://gohugo.io/installation/) installed
3. Run `hugo mod tidy` to download theme dependencies

## Develop

Start server using `hugo server -D` to run in draft mode.

## Deploy

Project is served using Github Pages. The generated content is placed in the `docs` folder under the project root which Github Pages will watch and automatically publish when updated.

To deploy execute the following from the project root:
```bash
./deploy.sh
```

## Theme Management

The hugo-resume theme is managed as a [Hugo Module](https://gohugo.io/hugo-modules/use-modules/).

### Updating the Theme

To update to the latest version of the theme:
```bash
hugo mod get -u github.com/eddiewebb/hugo-resume
```

To pin to a specific version or commit, see [Hugo Modules](https://gohugo.io/hugo-modules/use-modules/).

## Customizations

This project uses the canonical Hugo approach for theme customizations: overrides in the `layouts/` directory take precedence over the theme. This means the theme remains clean and can be updated without conflicts.

### Where Customizations Exist

| Location | Purpose |
|----------|---------|
| `layouts/index.html` | Home page template with dynamic section rendering |
| `layouts/partials/portfolio/skills.html` | Skills section with fixed data access |
| `layouts/partials/portfolio/experience.html` | Experience section with bullet-point notes support |
| `layouts/partials/portfolio/education.html` | Education section with bullet-point notes support |
| `static/css/resume-override.css` | Custom styling (blue-green color scheme #3C7A89) |

### Making Customizations

If you need to modify theme behavior:

1. **For layout/template changes**: Copy the relevant file from `themes/hugo-resume/layouts/` to the corresponding location in your project's `layouts/` directory. Your version will override the theme version.

2. **For styling changes**: Add CSS rules to `static/css/resume-override.css`. This file loads after the theme's CSS, so your rules will take precedence.

3. **For data format changes**: The theme originally used deprecated `hugo.Data` which has been fixed to use `.Site.Data`. If the theme updates and breaks data access again, modify the templates in `layouts/partials/portfolio/` to match the expected data format.

### Theme Structure Reference

```
themes/hugo-resume/
├── layouts/
│   ├── _default/      # Base templates (baseof.html)
│   ├── index.html     # Homepage template
│   └── partials/      # Reusable components
│       ├── about.html
│       ├── nav.html
│       └── portfolio/ # Section partials (skills, experience, education)
├── static/
│   └── css/           # Theme stylesheet
└── i18n/              # Internationalization files
```
