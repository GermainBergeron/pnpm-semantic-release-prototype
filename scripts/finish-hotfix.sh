#!/bin/bash

set -e

hotfix=${1:-a}

# finishing a hotfix means, merging the hotfix into master
git checkout master
git merge hotfix/${hotfix}
# and generate a new release
cd .. && pnpm run publish-all:local
# and create a new PR into integration, by creating a PR branch and merging the hotfix into it
git checkout -b feature/integrate-${hotfix}
git merge hotfix/${hotfix}
# delete hotfix branch
git branch -d hotfix/${hotfix}
