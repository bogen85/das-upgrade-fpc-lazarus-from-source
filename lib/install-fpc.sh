echo '@@ Install FPC'

cd ${SHARED_FPC_DEV_}/fpc_source_main

git describe

rm -rf ${SHARED_FPC_USR_}

make --silent install INSTALL_PREFIX=${SHARED_FPC_USR_} |\
grep -Ev '(Installing |Start compiling package | not found|Compiled package )'

git describe
