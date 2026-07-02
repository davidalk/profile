#!/bin/bash
set -euo pipefail

if [[ -z "$(git status --porcelain)" ]]; then
    hugo
    git add -A
    git commit -m "chore: deploy"
    git push origin master
else 
    echo "Git working directory is not clean"
fi 