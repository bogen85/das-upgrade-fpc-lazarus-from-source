#!/usr/bin/env bash

set -euo pipefail

time (
	set -euo pipefail
	time ./bin/upgrade-fpc.sh
	time ./bin/build-lazarus.sh
	time ./bin/install-lazarus.sh
	time ./bin/upgrade-jcf.sh

	./check-versions.sh
)
