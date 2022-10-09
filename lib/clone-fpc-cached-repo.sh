echo '@@ Clone FPC gitlab repo from cache'

cd ${SHARED_FPC_DEV_}
rm -rf fpc_source_main
git clone fpc_source_main_cache fpc_source_main
