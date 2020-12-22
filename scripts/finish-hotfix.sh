#!/bin/bash

set -e

hotfix=${1:-a}

# finishing a hotfix means, merging the hotfix into master
git checkout master
git merge hotfix/${hotfix}
# and generate a new release
cd .. && pnpm run publish-all:local
# delete hotfix branch
git branch -d hotfix/${hotfix}
echo "Don't forget to port the hotfix into next, if applicable"
