#!/usr/bin/env bash

source "lib/upgrade-common.sh"

__run__ 'prep-dev-area'
__run__ 'set-fpc-version-base-other-vars'
__run__ 'build-jcf'
set -x
__run__ 'install-jcf'
