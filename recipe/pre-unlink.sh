if [ -e ${FSLDIR}/etc/fslconf/requestFSLpythonUnlink.sh ]; then
  ${FSLDIR}/etc/fslconf/requestFSLpythonUnlink.sh fsleyes render

elif  [ -e ${FSLDIR}/share/fsl/sbin/removeFSLWrapper ]; then
  ${FSLDIR}/share/fsl/sbin/removeFSLWrapper fsleyes render
fi
