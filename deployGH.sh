#!/usr/bin/env bash

git add *
git commit -m "Commit before deploy gh pages"
git push
git branch gh-pages
BRANCH=$(git rev-parse --abbrev-ref HEAD)

git checkout gh-pages
rm index.html main.js
git merge $BRANCH -X theirs

rm -rf ./src/ *.md ./*.js ./sass
mv -f ./demo/lib/* .
rm -rf ./demo/

git add *
git commit -m "Deploy github pages"
git push
git checkout $BRANCH
exit
