#!/bin/bash

set -e

hotfix=${1:-a}
# starting a hotfix involves branching off master a new hotfix branch
echo "Starting hotfix ${hotfix}..."
git checkout master
git checkout -b hotfix/${hotfix}
