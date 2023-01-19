set -euo pipefail

__lib__=$(pwd)/lib

make=make
which gmake && make=gmake

export make

function __run__ () {
  time -p source $__lib__/$1.sh
}
