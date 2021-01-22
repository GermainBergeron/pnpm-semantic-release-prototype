#!/bin/bash

# promoting integration to next, means, that we merge develop onto next and trigger a semantic release
# after the semantic release, we back-merge into develop
git checkout next
git merge develop
# and generate a new release
cd .. && pnpm run publish-all:local
# and back-merge next into develop
git checkout develop
git merge next
