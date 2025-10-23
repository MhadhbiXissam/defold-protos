# defold-protos
defold game engine proto files , bash script to get proto files downloaded .  
check branches in this repo for already downloaded proto files along side with bin of protoc used .
```bash
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
echo "🗑️ download defold sdk " 
wget "$linksdk"


echo "🗑️ extracting defold sdk " 
folder="defold-sdk"
if [ ! -d "$folder" ]; then
    mkdir -p "$folder"
    unzip -o defoldsdk.zip && rm defoldsdk.zip 
else
    rm -r "$folder"
    mkdir -p "$folder"
    unzip -o defoldsdk.zip && rm defoldsdk.zip 
fi


echo "🗑️ copying proto files to  defold-sdk" 
cp -r defoldsdk/share/proto/*  $folder
cp -r defoldsdk/ext/include/google $folder/
echo "🗑️ protoc bins" 
mkdir -p bin || true 
cp -r defoldsdk/ext/bin/* bin/
rm -rf defoldsdk
```