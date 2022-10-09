echo '@@ Build FPC'

cd ${SHARED_FPC_DEV_}/fpc_source_main
git describe

make --silent clean

make --silent all -j |\
grep -Ev '(Compiling |Linking |Start compiling package|Warning: |Note: |Writing Resource String| not found)'

git describe
