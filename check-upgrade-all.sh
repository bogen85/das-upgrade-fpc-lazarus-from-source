#!/usr/bin/env bash

set -euo pipefail

time (
	set -euo pipefail

	./check-versions.sh 2> /dev/null 1> .start-version.txt

	./upgrade-all.sh

	./check-versions.sh

	./check-versions.sh 2> /dev/null 1> .end-version.txt
	diff .start-version.txt .end-version.txt
	rm .start-version.txt .end-version.txt
)
