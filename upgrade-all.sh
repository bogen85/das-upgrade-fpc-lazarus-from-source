#!/usr/bin/env bash

set -euo pipefail

time (
	set -euo pipefail

	./check-versions.sh 2> /dev/null 1> .start-version.txt

	time ./bin/upgrade-fpc.sh
	time ./bin/build-lazarus.sh
	time ./bin/install-lazarus.sh
	time ./bin/upgrade-jcf.sh

	./check-versions.sh

	./check-versions.sh 2> /dev/null 1> .end-version.txt
	diff .start-version.txt .end-version.txt
	rm .start-version.txt .end-version.txt
)
