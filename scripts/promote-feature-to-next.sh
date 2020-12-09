#!/bin/bash

feature=${1:-a}

# promoting a feature to next, means, that we simply merge the feature branch into next
git checkout next
git merge feature/${feature}
# and generate a new release
cd .. && pnpm run publish-all:local
# delete feature branch
git branch -d feature/${feature}
# and merge next into develop
git checkout develop
git merge next
