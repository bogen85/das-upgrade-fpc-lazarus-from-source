set -euo pipefail

__lib__=$(pwd)/lib

function __run__ () {
  time -p source $__lib__/$1.sh
}
