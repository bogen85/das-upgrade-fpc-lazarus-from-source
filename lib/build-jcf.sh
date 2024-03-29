echo '@@ Build Jedi Code Formatter (JCF)'

(
  set -x
  cd $SHARED_LAZ_USR_/share/lazarus/components/jcf2/CommandLine/Lazarus
  export PATH=$SHARED_FPC_BIN_:$SHARED_FPC_BASE_:$PATH
  export PATH=$SHARED_LAZ_USR_/bin:$PATH

  ppc=${SHARED_FPC_PPC_EXE_}

  lazbuild --quiet --compiler=$ppc --lazarusdir=$SHARED_LAZARUS_DIR_ jcf.lpr |\
    grep -Ev '(Linking |Start compiling package|warning: |Warning: |Hint: |Note: |Writing Resource String| not found)' |\
    grep -Ev '(Free Pascal Compiler version |Copyright |\(s\) issued| lines compiled.|Target OS: )'

  JCF=$(find /home/dev/laz_usr/ | grep '/jcf$')

  file $JCF
  ldd $JCF
  du -h $JCF
  true
)
