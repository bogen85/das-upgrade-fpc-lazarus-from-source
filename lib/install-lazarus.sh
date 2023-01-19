echo '@@ Install Lazarus'

(
	set -x
	cd ${SHARED_FPC_GIT_}/lazarus-main

	git describe

	rm -rf ${SHARED_LAZ_USR_}
	mkdir -pv ${SHARED_LAZ_USR_}/local/lazarus

	$make --silent install INSTALL_PREFIX=${SHARED_LAZ_USR_} |\
	(grep -Ev '(Installing |Start compiling package | not found|Compiled package )' || true)

	SHARE_LAZ=${SHARED_LAZ_USR_}/share/lazarus
	if [ -d ${SHARE_LAZ}/components ]; then
		:
	else
		rmdir -v ${SHARE_LAZ}
		ln -svf ${SHARED_LAZ_USR_}/local/lazarus ${SHARE_LAZ}
	fi

	git describe
	true
)
