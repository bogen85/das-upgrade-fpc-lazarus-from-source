echo '@@ Build Jedi Code Formatter (JCF)'

(
  set -x

  export PATH=$SHARED_FPC_BIN_:$SHARED_FPC_BASE_:$PATH
  export PATH=$SHARED_LAZ_USR_/bin:$PATH
  ppc=${SHARED_FPC_PPC_EXE_}
  lazbuild="lazbuild --quiet --compiler=$ppc --lazarusdir=$SHARED_LAZARUS_DIR_"
  jcf2="/share/lazarus/components/jcf2"

  cd $SHARED_LAZ_USR_$jcf2

  rm -rf lib/* || true

  $lazbuild jcfbase.lpk |\
    grep -Ev '(Linking |Start compiling package|warning: |Warning: |Hint: |Note: |Writing Resource String| not found)' |\
    grep -Ev '(Free Pascal Compiler version |Copyright |\(s\) issued| lines compiled.|Target OS: )'

  cd $SHARED_LAZ_USR_$jcf2/CommandLine/Lazarus

  rm -rf lib/* || true

  $lazbuild jcf.lpi |\
    grep -Ev '(Linking |Start compiling package|warning: |Warning: |Hint: |Note: |Writing Resource String| not found)' |\
    grep -Ev '(Free Pascal Compiler version |Copyright |\(s\) issued| lines compiled.|Target OS: )'

  JCF=$(find /home/dev/laz_usr/ | grep '/jcf$')

  file $JCF
  ldd $JCF
  du -h $JCF
  true
)
