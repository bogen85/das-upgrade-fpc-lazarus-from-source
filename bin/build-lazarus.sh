#!/usr/bin/env bash

source "lib/upgrade-common.sh"

__run__ 'prep-dev-area'
__run__ 'clone-lazarus-gitlab-repo'
__run__ 'clone-lazarus-cached-repo'
__run__ 'set-fpc-version-base-other-vars'
__run__ 'build-lazarus'
__run__ 'install-lazarus'
