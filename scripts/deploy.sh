#!/bin/bash
DEPLOY_REMOTE=upstream

# Temporarily store uncommited changes
git stash

# Verify correct branch
git checkout develop

# build logo
make -C logo

# Build new files
stack exec website clean
stack exec website build

# Get previous files
git fetch --all "$DEPLOY_REMOTE"
git checkout -b master --track "$DEPLOY_REMOTE/master"

# Overwrite existing files with new files
rsync -a --filter='P _site/' --filter='P .travis.yml' --filter='P _cache/' --filter='P .git/' --filter='P .stack-work' --filter='P .gitignore' --delete-excluded _site/  .

# Commit
git add -A
git commit --no-verify -m "Publish."

# Push
git push "$DEPLOY_REMOTE" master:master

# Restoration
git checkout develop
git branch -D master
git stash pop
