echo '@@ Build Lazarus'
(
  set -x;
  cd $SHARED_FPC_GIT_/lazarus-main;

  git describe

  $make --silent cleanall;
  export PATH=$SHARED_FPC_BIN_:$SHARED_FPC_BASE_:$PATH;
  $make --silent bigide 2>&1 |\
  grep -Ev '(Linking |Start compiling package|warning: |Warning: |Hint: |Note: |Writing Resource String| not found)' |\
  grep -Ev '(Free Pascal Compiler version |Copyright |\(s\) issued| lines compiled.|Target OS: )'

  git describe
  true
)
