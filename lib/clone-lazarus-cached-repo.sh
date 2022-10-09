echo '@@ Clone Lazarus main from gitlab cache'

cd $SHARED_FPC_DEV_
rm -rf lazarus-main
git clone lazarus-main-cache lazarus-main
