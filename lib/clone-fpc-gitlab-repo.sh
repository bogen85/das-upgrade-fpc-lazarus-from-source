echo '@@ Clone FPC gitlab repo into cache'

(
	set -euo pipefail
	main_cache="${SHARED_FPC_GIT_}/fpc_source_main_cache"
	git_url="https://gitlab.com/freepascal.org/fpc/source.git/"
	__update_or_clone "${main_cache}" "${git_url}"
)
