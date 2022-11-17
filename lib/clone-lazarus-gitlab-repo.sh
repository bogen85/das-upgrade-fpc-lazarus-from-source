echo '@@ Clone Lazarus gitlab repo into cache'

cd ${SHARED_FPC_GIT_}

rm -rf lazarus-main-cache
git clone https://gitlab.com/freepascal.org/lazarus/lazarus.git lazarus-main-cache
