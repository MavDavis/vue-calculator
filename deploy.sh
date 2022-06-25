#!/usr/bin/env sh

# abort on errors

set -e

npm run build

cd dist

git init
git add -A
git commit -m "new Deployment"
git push -f git@github.com:MavDavis/vue-calculator.git master:gh-pages
cd -