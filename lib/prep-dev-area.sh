echo '@@ Prep Dev Area'

export SHARED_FPC_DEV_=/home/shared-development
export SHARED_FPC_USR_=${SHARED_FPC_DEV_}/fpc_usr
export SHARED_LAZ_USR_=${SHARED_FPC_DEV_}/laz_usr

mkdir -pv ${SHARED_FPC_DEV_}
