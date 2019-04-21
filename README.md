# David Al-Kanani Profile Website

This is a website generator project for my personal profile website. This generator uses [Hugo](https://gohugo.io/) with the [hugo-resume](https://themes.gohugo.io/hugo-resume/) theme.

## Project Setup
Clone this repo as you normally would and then update the submodule as follows:
```bash
git submodule update --init --recursive
```

Follow instructions in the [Hugo Quick Start](https://gohugo.io/getting-started/quick-start/) guide.

## Develop
Start server using `hugo server -D` to run in draft mode.

## Deploy
Project is served using Github pages.
- Run `hugo` which will build changes into docs folder.
- Commit and push docs to update on Github pages.
