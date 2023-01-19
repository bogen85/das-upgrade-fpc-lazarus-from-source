set -euo pipefail

__lib__=$(pwd)/lib

make=make
which gmake && make=gmake

export make

function __run__ () {
  time -p source $__lib__/$1.sh
}
echo '@@ Clone FPC gitlab repo into cache'

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
