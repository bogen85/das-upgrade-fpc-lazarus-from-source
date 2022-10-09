#!/bin/bash

source 'upgrade-common.sh'

__run__ 'prep-dev-area'
__run__ 'clone-fpc-gitlab-repo'
__run__ 'clone-fpc-cached-repo'
__run__ 'build-fpc'
__run__ 'install-fpc'
__run__ 'set-fpc-version-base-other-vars'
__run__ 'create-new-configuration'
