#!/usr/bin/env sh

set -e

npm run build

cd dist

# Reinitialize git to ensure it's a fresh repo
git init
git add -A
git commit -m 'New Deployment'

# Force push to the gh-pages branch
git push -f https://github.com/andyrohdev/portfolio-website.git master:gh-pages

cd -
