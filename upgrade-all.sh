#!/bin/bash

set -euo pipefail

time (
	set -euo pipefail
	time ./bin/upgrade-fpc.sh
	time ./bin/build-lazarus.sh
	time ./bin/install-lazarus.sh
	time ./bin/upgrade-jcf.sh

	time source 'lib/upgrade-common.sh'
	__run__ 'prep-dev-area'
	__run__ 'set-fpc-version-base-other-vars'
	__run__ describe-fpc
	__run__ describe-lazarus
)
