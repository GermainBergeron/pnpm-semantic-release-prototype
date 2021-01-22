#!/bin/bash

feature=${1:-a}

# finishing a feature means, merging the feature into develop
git checkout develop
git merge feature/${feature}
