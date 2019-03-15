if [ -e ${FSLDIR}/etc/fslconf/requestFSLpythonLink.sh ]; then
  $FSLDIR/etc/fslconf/requestFSLpythonLink.sh fsleyes render

  if [[ "$OSTYPE" == "darwin"* ]]; then
    $FSLDIR/etc/fslconf/requestFSLpythonLink.sh FSLeyes.app
  fi
fi
