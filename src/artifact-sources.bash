#!/bin/bash

# This script extracts the Plan Scripts of the supplied
# artifact bundle and renames them with their meaningful
# names.
#
# Typical invocation:
#     ./artifact-sources.bash ../artifacts-bundles/Didactic-Linux-MultiDistro-Artifact-Bundle-V0.2-FDZ.zip

# Version: 0.1

# Check argument(s)
NUM_ARG=1

if [ "$#" != "$NUM_ARG" ] ; then
   echo "Usage: $0 <artifact.zip>" 
   exit 1
fi

# Variable initialization
JQ=$(which jq 2> /dev/null)
UNZIP=$(which jq 2> /dev/null)
ARTIFACT=$1

# Check Requirements

# jq and unzip must be present in the system
if [ -z $JQ -o -z $UNZIP ] ; then
   echo "jq or unzip not present in this system. Exiting..." 
   exit 2 
fi

# Verify ARTIFACT exists and is potentiall a real .zip file
if [[ ! -f $ARTIFACT || $(file $ARTIFACT | grep -q "Zip archive data") ]] ; then
   echo "Artifact file dos not exists or is not a .ZIP file" 
   echo "Exiting...." 
   exit 3
fi

# Remove all files in this directory
# except this script and the README.md
mkdir ./tmp
mv $0 README.md ./tmp
rm -f * 2> /dev/null
mv ./tmp/{$0,README.md} .
rmdir ./tmp

# unzip locally
unzip $ARTIFACT 

# 
PS_LIST=$(ls *.json)

for f in $PS_LIST ; do
    echo "Processing file: $f"
    PS_NAME=$($JQ  -r '.name' $f)
    PS_ID=$($JQ  -r '.id' $f)
    PS_CONTENT=$($JQ  '.content' 51ab6ad0-dc26-46d2-bb15-a054b19c3ec6_planscript.json)
    echo -e $PS_CONTENT | sed '1s/^"// ; $s/"$// ; 1,$s/\\"/"/g' > $PS_NAME
done

# Cleanup 
rm *.json MANIFEST.MF SHA256SUM.sha256sum > /dev/null 2>&1

exit 0

