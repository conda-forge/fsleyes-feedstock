#!/bin/bash

${PYTHON} -m pip install --no-deps --ignore-installed .

# FSLeyes.app is not required to run FSLeyes from
# the command-line, but is created and stored in
# $PREFIX/share/fsleyes/FSLeyes.app for anybody
# who wants to add it to their desktop.
if [[ "${OSTYPE}" == "darwin"* ]]; then
  APPDIR=${PREFIX}/share/fsleyes/FSLeyes.app
  mkdir -p ${APPDIR}/Contents/MacOS
  mkdir -p ${APPDIR}/Contents/Resources
  cp ${RECIPE_DIR}/Info.plist       ${APPDIR}/Contents/
  cp ${RECIPE_DIR}/fsleyes.icns     ${APPDIR}/Contents/Resources/
  cp ${RECIPE_DIR}/fsleyes_doc.icns ${APPDIR}/Contents/Resources/
  cp ${PREFIX}/bin/fsleyes          ${APPDIR}/Contents/MacOS/

  PKG_VERSION=$(cat fsleyes/version.py|egrep "^__version"|cut -d ' ' -f 3|tr -d "'")
  PKG_COPYRIGHT=$(cat ./COPYRIGHT)
  PLIST=${APPDIR}/Contents/Info.plist

  sed -ie "s/##VERSION##/${PKG_VERSION}/g"     $PLIST
  sed -ie "s/##COPYRIGHT##/${PKG_COPYRIGHT}/g" $PLIST
fi
