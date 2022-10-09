echo '@@ Install Lazarus'

cd ${SHARED_FPC_DEV_}/lazarus-main

git describe

rm -rf ${SHARED_LAZ_USR_}
make --silent install INSTALL_PREFIX=${SHARED_LAZ_USR_} |\
grep -Ev '(Installing |Start compiling package | not found|Compiled package )'

git describe
