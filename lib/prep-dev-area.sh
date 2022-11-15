echo '@@ Prep Dev Area'

export SHARED_FPC_DEV_=/home/dev
export SHARED_FPC_USR_=${SHARED_FPC_DEV_}/fpc_usr
export SHARED_LAZ_USR_=${SHARED_FPC_DEV_}/laz_usr

export SHARED_DEV_USR_=${SHARED_FPC_DEV_}/usr
export SHARED_DEV_BIN_=${SHARED_FPC_USR_}/bin

mkdir -pv ${SHARED_FPC_DEV_}
