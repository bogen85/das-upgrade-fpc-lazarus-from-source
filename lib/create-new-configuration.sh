echo '@@ Create new Configuration'

(
   set -xeuo pipefail

   mkdir -pv $SHARED_FPC_ETC_;
   cd $SHARED_FPC_LIB_;
   export PATH=$SHARED_FPC_BIN_:$PATH;
   fpcmkcfg -d basepath=$SHARED_FPC_BASE_ -o $SHARED_FPC_CFG_;
   true
)
