#!/bin/bash

set -e

feature=${1:-a}

# promoting a feature to master, means, that we simply merge the feature branch into master
git checkout master
git merge feature/${feature}
# and generate a new release
pnpm run publish-all:local
# delete feature branch
git branch -d feature/${feature}
