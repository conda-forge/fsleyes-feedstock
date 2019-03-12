#!/bin/bash

$PYTHON -m pip install --no-deps --ignore-installed .

if [[ "$OSTYPE" == "darwin"* ]]; then
  mkdir -p $PREFIX/bin/FSLeyes.app/Contents/MacOS
  mkdir -p $PREFIX/bin/FSLeyes.app/Contents/Resources
  cp $RECIPE_DIR/Info.plist       $PREFIX/bin/FSLeyes.app/Contents/
  cp $RECIPE_DIR/fsleyes.icns     $PREFIX/bin/FSLeyes.app/Contents/Resources/
  cp $RECIPE_DIR/fsleyes_doc.icns $PREFIX/bin/FSLeyes.app/Contents/Resources/
  cp $PREFIX/bin/fsleyes          $PREFIX/bin/FSLeyes.app/Contents/MacOS/
fi
