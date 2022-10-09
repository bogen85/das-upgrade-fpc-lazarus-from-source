echo '@@ Clone FPC gitlab repo into cache'

cd ${SHARED_FPC_DEV_}
rm -rf fpc_source_main_cache
git clone https://gitlab.com/freepascal.org/fpc/source fpc_source_main_cache
