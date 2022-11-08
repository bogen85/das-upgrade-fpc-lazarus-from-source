#!/bin/bash

time (
	time ./upgrade-fpc.sh
	time ./upgrade-lazarus.sh
	time ./build-jcf.sh
)
