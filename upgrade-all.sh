#!/bin/bash

set -euo pipefail

time (
	time ./bin/upgrade-fpc.sh
	time ./bin/build-lazarus.sh
	time ./bin/install-lazarus.sh
	time ./bin/upgrade-jcf.sh
)
