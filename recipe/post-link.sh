if [ -e ${FSLDIR}/etc/fslconf/requestFSLpythonLink.sh ]; then
  $FSLDIR/etc/fslconf/requestFSLpythonLink.sh fsleyes render

  # Hack for FSL 6.0.5:
  #
  # The requestFSLPythonLink.sh script
  # generates wrapper scripts to use
  # "python" rather than "pythonw", which
  # causes GUI apps to fail on macOS.
  if [[ "$OSTYPE" == "darwin"* ]]; then
    sed -i -e 's/python -I/pythonw -I/g' $FSLDIR/bin/fsleyes
    sed -i -e 's/python -I/pythonw -I/g' $FSLDIR/bin/render
  fi
fi
