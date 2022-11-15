echo '@@ Build Jedi Code Formatter (JCF)'

(
  JCF=$(find $SHARED_LAZ_USR_ | grep '/jcf$')
  mkdir -pv $SHARED_DEV_BIN_
  rm -fv $SHARED_DEV_BIN_/$JCF
  cp -v $JCF $SHARED_DEV_BIN_/  
)
