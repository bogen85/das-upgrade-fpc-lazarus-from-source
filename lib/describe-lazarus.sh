echo '@@ Describe Lazarus'
(
  set -x;
  cd $SHARED_FPC_GIT_/lazarus-main;
  pwd
  git describe
  true
)
