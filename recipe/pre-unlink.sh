if [ -e ${FSLDIR}/etc/fslconf/requestFSLpythonUnlink.sh ]; then
  ${FSLDIR}/etc/fslconf/requestFSLpythonUnlink.sh fsleyes render

  if [[ "$OSTYPE" == "darwin"* ]]; then
    ${FSLDIR}/etc/fslconf/requestFSLpythonUnlink.sh FSLeyes.app
  fi
elif  [ -e ${FSLDIR}/share/fsl/sbin/removeFSLWrapper ]; then
  ${FSLDIR}/share/fsl/sbin/removeFSLWrapper fsleyes render
fi
