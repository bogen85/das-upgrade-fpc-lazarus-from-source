echo '@@ Describe FPC'

(
	set -euo pipefail
	cd ${SHARED_FPC_GIT_}/fpc_source_main
	pwd
	git describe
	true
)
