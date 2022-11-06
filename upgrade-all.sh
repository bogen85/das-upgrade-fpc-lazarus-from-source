#!/bin/bash

set -euo pipefail

time (
	set -euo pipefail
	time ./upgrade-fpc.sh
	time ./upgrade-lazarus.sh
	time ./build-jcf.sh
)
