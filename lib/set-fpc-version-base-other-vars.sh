echo '@@ Set FPC Version/Base/Other vars'

export SHARED_FPC_VERSION_=$(printf "%s" $(cd ${SHARED_FPC_USR_}/lib/fpc; ls -d *.*.*))
export SHARED_FPC_LIB_=${SHARED_FPC_USR_}/lib/fpc
export SHARED_FPC_BASE_=${SHARED_FPC_LIB_}/${SHARED_FPC_VERSION_}
export SHARED_FPC_ETC_=${SHARED_FPC_LIB_}/etc
export SHARED_FPC_BIN_=${SHARED_FPC_USR_}/bin
export SHARED_FPC_CFG_=${SHARED_FPC_ETC_}/fpc.cfg
export SHARED_LAZARUS_DIR_=${SHARED_LAZ_USR_}/share/lazarus
export SHARED_JCF_=${SHARED_LAZARUS_DIR_}/components/jcf2/Output/Lazarus/jcf

export SHARED_FPC_PPC_BIN_=${SHARED_FPC_USR_}/lib/fpc/${SHARED_FPC_VERSION_}
export SHARED_FPC_ARCH_=$(uname -m)


[ "${SHARED_FPC_ARCH_}" == "aarch64" ] && SHARED_FPC_PPC_EXE_=${SHARED_FPC_PPC_BIN_}/ppca64
[ "${SHARED_FPC_ARCH_}" == "x86_64"  ] && SHARED_FPC_PPC_EXE_=${SHARED_FPC_PPC_BIN_}/ppcx64

export SHARED_FPC_PPC_EXE_

printf 'FPC arch: %s\n' "${SHARED_FPC_ARCH_}"
printf 'FPC  ppc: %s\n' "${SHARED_FPC_PPC_EXE_}"
