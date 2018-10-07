#!/bin/bash

# This script extracts the Plan Scripts of the supplied
# artifact bundle and renames them with their meaningful
# names.
#
# Typical invocation:
#     ./artifact-sources.bash ../artifacts-bundles/Didactic-Linux-MultiDistro-Artifact-Bundle-V0.2-FDZ.zip

# Version: 0.2

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
SRC_DIR="../src"

# Check Requirements

# jq and unzip must be present in the system
if [ -z $JQ -o -z $UNZIP ] ; then
   echo "jq or unzip not present in this system. Exiting..." 
   exit 2 
fi

# Verify ARTIFACT exists and is potentially a real .zip file
if [[ ! -f $ARTIFACT || $(file $ARTIFACT | grep -q "Zip archive data") ]] ; then
   echo "Artifact file dos not exists or is not a .ZIP file" 
   echo "Exiting...." 
   exit 3
fi

# Remove all files ending with -FDZ
cd ${SRC_DIR}
rm -f *-FDZ 2> /dev/null

# unzip locally
unzip $ARTIFACT -d .

# 
PS_LIST=$(ls *.json)

# Extract script sources from the .json files
for f in $PS_LIST ; do
    echo "Processing file: $f"
    PS_NAME=$($JQ  -r '.name' $f)
    PS_ID=$($JQ  -r '.id' $f)
    PS_CONTENT=$($JQ  '.content' $f)
    echo -e $PS_CONTENT | sed '1s/^"// ; $s/"$// ; 1,$s/\\"/"/g' > $PS_NAME
done

# Cleanup 
rm *.json MANIFEST.MF SHA256SUM.sha256sum > /dev/null 2>&1

exit 0

