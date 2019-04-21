#!/bin/bash
set -euo pipefail

if [[ -z "$(git status --porcelain)" ]]; then
    hugo
    git commit -am "chore: deploy"
    git push origin master
else 
    echo "Git working directory is not clean"
fi 