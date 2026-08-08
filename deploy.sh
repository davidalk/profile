#!/bin/bash
set -euo pipefail

if [[ -n "$(git status --porcelain)" ]]; then
    echo "Git working directory is not clean" >&2
    exit 1
fi

hugo --gc --minify --cleanDestinationDir
git add -A

if git diff --cached --quiet; then
    echo "No site changes to commit"
else
    git commit -m "chore: deploy"
fi

git push origin master
