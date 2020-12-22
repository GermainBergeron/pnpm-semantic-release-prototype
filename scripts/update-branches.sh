#!/bin/bash

# simply update from remote branches our interesting branches
git checkout develop
git pull origin develop

git checkout master
git pull origin master

git checkout next
git pull origin next
