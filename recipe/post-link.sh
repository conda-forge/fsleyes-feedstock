# FSL 6.0.5 and older
if [ -e ${FSLDIR}/etc/fslconf/requestFSLpythonLink.sh ]; then
  ${FSLDIR}/etc/fslconf/requestFSLpythonLink.sh fsleyes render

  # Hack for FSL 6.0.5:
  #
  # The requestFSLPythonLink.sh script
  # generates wrapper scripts to use
  # "python" rather than "pythonw", which
  # causes GUI apps to fail on macOS.
  if [[ "$OSTYPE" == "darwin"* ]] && [[ "$PREFIX" == "$FSLDIR"* ]]; then
    sed -i "" 's/python -I/pythonw -I/g' ${FSLDIR}/bin/fsleyes
    sed -i "" 's/python -I/pythonw -I/g' ${FSLDIR}/bin/render
  fi
# FSL 6.0.6 and newer
elif  [ -e ${FSLDIR}/share/fsl/sbin/createFSLWrapper ]; then
  ${FSLDIR}/share/fsl/sbin/createFSLWrapper fsleyes render
fi
