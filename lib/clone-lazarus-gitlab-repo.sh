echo '@@ Clone Lazarus gitlab repo into cache'

(
	set -euo pipefail
	main_cache="${SHARED_FPC_GIT_}/lazarus-main-cache"
	git_url="https://gitlab.com/freepascal.org/lazarus/lazarus.git/"
	__update_or_clone "${main_cache}" "${git_url}"
)
