set -euo pipefail

__lib__=$(pwd)/lib

make=make
which gmake 2>&1 >/dev/null && make=gmake

if make --version 2>&1 >/dev/null; then
	echo make candidate: $make
	make --version | grep -q ^GNU && make=make
	echo 'make to use (is GNU):' $make
fi


export make

function __run__ () {
  time -p source $__lib__/$1.sh
}

function __clone_fresh() {
	local main_cache=$1
	local git_url=$2
	rm -rf "${main_cache}"
	git clone "${git_url}" "${main_cache}"
}

function __update_existing () {
	local main_cache=$1
	local git_url=$2
	cd "${main_cache}"
	git pull || __clone_fresh "${main_cache}" "${git_url}"
}

function __update_or_clone () {
	local main_cache=$1
	local git_url=$2
	if [ -d "${main_cache}" ]; then
		__update_existing "${main_cache}" "${git_url}"
	else
		__clone_fresh "${main_cache}" "${git_url}"
	fi
}
