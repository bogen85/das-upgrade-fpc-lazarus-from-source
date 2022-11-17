echo '@@ Clone Lazarus main from gitlab cache'

cd $SHARED_FPC_GIT_
rm -rf lazarus-main
git clone lazarus-main-cache lazarus-main
