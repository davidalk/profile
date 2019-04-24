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
Project is served using Github Pages. The generated content is placed in the `docs` folder under the project root which Github Pages will watch and automatically publish when updated.

To deploy execute the following from the project root:
```bash
./deploy.sh
```
