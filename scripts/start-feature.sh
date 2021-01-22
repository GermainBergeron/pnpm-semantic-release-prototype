#!/bin/bash

set -e

feature=${1:-a}
# starting a feature involves branching off develop a new feature branch
echo "Starting feature ${feature}..."
git checkout develop
git checkout -b feature/${feature}
