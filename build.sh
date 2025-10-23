#!/bin/bash
set -euo pipefail

version=1.11.1
linksdk="https://github.com/defold/defold/releases/download/$version/defoldsdk.zip"  
linkbob="https://github.com/defold/defold/releases/download/$version/bob.jar"

commands=("wget" "unzip")

for cmd in "${commands[@]}"; do
    if command -v "$cmd" >/dev/null 2>&1; then
        echo "  👍 : $cmd is installed"
    else
        echo "  ❌ : $cmd is not installed"
    fi
done
echo "* download defold sdk " 
wget "$linksdk"
echo "* extracting defold sdk " 
unzip -o defoldsdk.zip && rm defoldsdk.zip 
echo "* copying proto files to  defoldsdk-$version" 
folder="defoldsdk-$version"
if [ ! -d "$folder" ]; then
    mkdir -p "$folder"
else
    echo "Folder '$folder' already exists"
fi
cp -r defoldsdk/share/proto/*  $folder 
rm -rf defoldsdk
