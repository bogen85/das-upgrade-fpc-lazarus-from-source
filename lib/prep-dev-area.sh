echo '@@ Prep Dev Area'

export SHARED_FPC_DEV_=/home/dev
export SHARED_FPC_USR_=${SHARED_FPC_DEV_}/fpc_usr
export SHARED_LAZ_USR_=${SHARED_FPC_DEV_}/laz_usr

export SHARED_DEV_USR_=${SHARED_FPC_DEV_}/usr
export SHARED_DEV_BIN_=${SHARED_DEV_USR_}/bin

export SHARED_FPC_GIT_=${SHARED_FPC_DEV_}/git

mkdir -pv ${SHARED_FPC_DEV_}
mkdir -pv ${SHARED_FPC_GIT_}
