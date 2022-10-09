echo '@@ Set FPC Version/Base/Other vars'

export SHARED_FPC_VERSION_=$(printf "%s" $(cd ${SHARED_FPC_USR_}/lib/fpc; ls -d *.*.*))
export SHARED_FPC_LIB_=${SHARED_FPC_USR_}/lib/fpc
export SHARED_FPC_BASE_=${SHARED_FPC_LIB_}/${SHARED_FPC_VERSION_}
export SHARED_FPC_ETC_=${SHARED_FPC_LIB_}/etc
export SHARED_FPC_BIN_=${SHARED_FPC_USR_}/bin
export SHARED_FPC_CFG_=${SHARED_FPC_ETC_}/fpc.cfg
export SHARED_LAZARUS_DIR_=${SHARED_FPC_USR_}/share/lazarus
export SHARED_JCF_=${SHARED_LAZARUS_DIR_}/components/jcf2/Output/Lazarus/JCF
