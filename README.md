# pnpm-monorepo-release-prototype

## Intro
This is a prototype for testing out semantic-releases in a pnpm monorepo. It can be fully tested, by using a local **NPM Registry** (Docker-based Verdaccio).

## Setup
You need to have Node and Docker installed.

1. install deps `npm i -g pnpm`
1. install deps `pnpm i -r`
1. run local test registry `npm run start:test-registry`
1. create a test user for publishing `npm adduser --registry http://localhost:4873`

## Integrated Release Flow
The branching model is a mixture of git-flow and release flow, combined with supporting a `@next` version branch and a `@latest` version branch, that are matched to [npm-dist-tags](https://docs.npmjs.com/cli/v6/commands/npm-dist-tag) via the usage of [semantic-release](https://github.com/semantic-release/semantic-release) semantics.

It boils down to the following _branches_ with their semantics:
* `develop` this is the _integration_ branch, all features are PRed into this branch and this represents the **most current** state of development, that is **not released**
* `next` this is the branch that is **published** to the [npm-dist-tag](https://docs.npmjs.com/cli/v6/commands/npm-dist-tag) _@next_, it represents a **deliberately selected** commit from `develop`, i.e. a PR from `develop` to `next`; it will get **merged back** into `develop`, representing the **development** version.
* `master` this is the branch that is **published** to the [npm-dist-tag](https://docs.npmjs.com/cli/v6/commands/npm-dist-tag) _@latest_, it represents a **deliberately selected** commit from **either** `develop` or `next`; if coming from `develop` it will be merged back there. It represents a product version and gets **released**.

By using conventional commits (confirming to [Angular Commit Message Conventions](https://github.com/angular/angular.js/blob/master/DEVELOPERS.md#-git-commit-guidelines), releases will be _automagically_ **created, committed and published**

## Convenience scripts
There are a set of scripts for your convenience, for _simulating_ typical branching scenarios.

**N.B.**: The following assume, that you are _inside_ the [./scripts](./scripts) _folder_.

They also assume, that your branches are locally _up-to-date_, calling `./update-branches.sh` will pull from `origin`.

### Starting a feature
* `./start-feature.sh` starts a feature, by _branching off_ `develop`

### Finishing a feature
* `./finish-feature.sh` _finishes_ a feature, i.e. _merges_ your feature on `develop`

### Promote integration to next
* `./promote-integration-to-next.sh` _promotes_, i.e. _merges_ `develop` on `master` (and thus _potentially_ **several** features) and _triggers_ a semantic-release; next will be `back-merged into develop

### Promoting next to master
* `./promote-next-to-master.sh` _promotes_ **current** next to master, by _merging_ onto it **TODO: BACK-MERGE?**

### Starting a hotfix
* `./start-hotfix.sh` starts a hotfix, by _branching off_ `master`

### Finishing a hotfix
* `./finish-hotfix.sh` finishes a hotfix, i.e. _merges_ onto `master` and _triggers_ a semantic-release; it will create a PR into `integration`
