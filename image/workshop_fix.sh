#!/bin/bash
set -eu

echo "start workshop fix"

if [ ! -f "$HOME/vscode_data/fixed.lock" ]; then

echo "fixing workshop"

# this should be the directory where all the extensions are installed
EXT="$HOME/vscode_data/extensions"

cd /tmp

ls $EXT | awk -F- '/latex-workshop/ {print $NF}' | while read VER; do
  echo $VER
  
  DIR="$EXT/james-yu.latex-workshop-$VER/"
  curl -fOL https://james-yu.gallery.vsassets.io/_apis/public/gallery/publisher/james-yu/extension/latex-workshop/$VER/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage
  unzip /tmp/Microsoft.VisualStudio.Services.VSIXPackage 'extension/out/*'
  mv /tmp/extension/out $DIR/out
  
done

touch "$HOME/vscode_data/fixed.lock"

echo "fix complete"

fi

