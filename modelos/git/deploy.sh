#!/usr/bin/env bash

# abort on errors
set -e

# build
npm run build

# navigate into the build output directory
cd dist

# diretorio recriado, git reinicializado
git init
echo '[source](https://github.com/nenitf/neni.dev.git)' > README.md

#============================================
# github
#============================================
echo 'neni.dev' > CNAME
git add -A
git commit -m 'deploy :octocat:'

# https://<USERNAME>.exemplo.io é obrigatorio ser na branch master!
git push -f https://github.com/nenitf/nenitf.github.io.git master

# https://<USERNAME>.exemplo.io/repo deve ser dado push na branch gh-pages/gl-pages
# git push -f https://gitlab.com/felipedacs/repo master:gh-pages
# git push -f https://gitlab.com/felipedacs/repo master:gl-pages

#============================================
# gitlab
#============================================
cp ../.gitlab-ci.yml .gitlab-ci.yml

git add -A
git commit -m 'deploy :fox_face:'
git push -f https://gitlab.com/nenitf/nenitf.gitlab.io.git master

cd -
