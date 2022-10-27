..
 CudaText: lexer_file=reStructuredText; tab_size=3 tab_spaces=Yes; newline=LF;

=============================================
Build and Install FPC/Lazarus/JCF from source
=============================================

.. contents::

Overview
=========

See https://wiki.lazarus.freepascal.org/Installing_the_Free_Pascal_Compiler#FPC_sources_Using_Git_or_Zip

See https://wiki.lazarus.freepascal.org/Installing_Lazarus_on_Linux#Get_the_Lazarus_Source

Prepare development area
========================
.. code-block:: bash

   export SHARED_FPC_DEV_=/home/dev
   export SHARED_FPC_USR_=${SHARED_FPC_DEV_}/fpc_usr

   mkdir -pv ${SHARED_FPC_DEV_}

Clone FPC GitLab Repo
=====================
.. code-block:: bash

   cd ${SHARED_FPC_DEV_}
   rm -rf fpc_source_main
   git clone https://gitlab.com/freepascal.org/fpc/source fpc_source_main


Build FPC
=========
.. code-block:: bash

   cd ${SHARED_FPC_DEV_}/fpc_source_main
   make all -j
   git describe

Install FPC
===========
.. code-block:: bash

   cd ${SHARED_FPC_DEV_}/fpc_source_main
   rm -rf ${SHARED_FPC_USR_}
   make install INSTALL_PREFIX=${SHARED_FPC_USR_}
   git describe


Set FPC Version and base, bin, lib, and etc paths
=================================================
.. code-block:: bash

   export SHARED_FPC_VERSION_=$(printf "%s" $(cd ${SHARED_FPC_USR_}/lib/fpc; ls -d *.*.*))
   export SHARED_FPC_LIB_=${SHARED_FPC_USR_}/lib/fpc
   export SHARED_FPC_BASE_=${SHARED_FPC_LIB_}/${SHARED_FPC_VERSION_}
   export SHARED_FPC_ETC_=${SHARED_FPC_LIB_}/etc
   export SHARED_FPC_BIN_=${SHARED_FPC_USR_}/bin
   export SHARED_FPC_CFG_=${SHARED_FPC_ETC_}/fpc.cfg
   export SHARED_LAZARUS_DIR_=${SHARED_FPC_USR_}/share/lazarus
   export SHARED_JCF_=${SHARED_LAZARUS_DIR_}/components/jcf2/Output/Lazarus/JCF

Create new configuration
========================
.. code-block:: bash

   (
      set -x;
      mkdir -pv $SHARED_FPC_ETC_;
      cd $SHARED_FPC_LIB_;
      export PATH=$SHARED_FPC_BIN_:$PATH;
      fpcmkcfg -d basepath=$SHARED_FPC_BASE_ -o $SHARED_FPC_CFG_;
   )

Checkout Lazarus
================
.. code-block:: bash

   cd $SHARED_FPC_DEV_
   rm -rf lazarus-main
   git clone https://gitlab.com/freepascal.org/lazarus/lazarus.git lazarus-main


Build Lazarus
=============
.. code-block:: bash

   (
      set -x;
      rsync -v $SHARED_FPC_CFG_ ~/.fpc.cfg;
      cd $SHARED_FPC_DEV_/lazarus-main;
      make cleanall;
      export PATH=$SHARED_FPC_BIN_:$SHARED_FPC_BASE_:$PATH;
      make bigide;
   )

Install Lazarus
===============
.. code-block:: bash

   cd $SHARED_FPC_DEV_/lazarus-main
   make install INSTALL_PREFIX=$SHARED_FPC_USR_

Build Jedi Code Formatter (JCF)
===============================
.. code-block:: bash

   (
      set -x;
      rsync -v $SHARED_FPC_CFG_ ~/.fpc.cfg;
      cd $SHARED_FPC_USR_/share/lazarus/components/jcf2/CommandLine/Lazarus
      export PATH=$SHARED_FPC_BIN_:$SHARED_FPC_BASE_:$PATH;
      # ln -svf jcf.lpi JCF.lpi;
      lazbuild --lazarusdir=$SHARED_LAZARUS_DIR_ jcf.lpr;
   )

Setup All FPC and JCF paths
===========================
.. code-block:: bash

   export SHARED_FPC_DEV_=/home/dev
   export SHARED_FPC_USR_=${SHARED_FPC_DEV_}/fpc_usr
   export SHARED_FPC_VERSION_=$(printf "%s" $(cd ${SHARED_FPC_USR_}/lib/fpc; ls -d *.*.*))
   export SHARED_FPC_LIB_=${SHARED_FPC_USR_}/lib/fpc
   export SHARED_FPC_BASE_=${SHARED_FPC_LIB_}/${SHARED_FPC_VERSION_}
   export SHARED_FPC_ETC_=${SHARED_FPC_LIB_}/etc
   export SHARED_FPC_BIN_=${SHARED_FPC_USR_}/bin
   export SHARED_FPC_CFG_=${SHARED_FPC_ETC_}/fpc.cfg
   export SHARED_LAZ_USR_=${SHARED_FPC_DEV_}/laz_usr
   export SHARED_LAZARUS_DIR_=${SHARED_LAZ_USR_}/share/lazarus
   export SHARED_LAZ_BIN_=${SHARED_LAZ_USR_}/bin
   export SHARED_JCF_=$(find ${SHARED_LAZARUS_DIR_}/ | grep '/jcf$')
   if ! [[ "$PATH" =~ "$SHARED_LAZ_BIN_:"	]]; then export PATH="$SHARED_LAZ_BIN_:$PATH"	; fi
   if ! [[ "$PATH" =~ "$SHARED_FPC_BASE_:" ]]; then export PATH="$SHARED_FPC_BASE_:$PATH"	; fi
   if ! [[ "$PATH" =~ "$SHARED_FPC_BIN_:"	]]; then export PATH="$SHARED_FPC_BIN_:$PATH"	; fi

..
   end.
