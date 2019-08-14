#!/bin/bash

# This script extracts Plan Scripts and Build Plans of the supplied
# artifact bundle and renames them with their meaningful
# names.
#
# Typical invocation:
#     ./artifact-sources.bash ../artifacts-bundles/Didactic-Linux-MultiDistro-Artifact-Bundle-V0.3-FDZ.zip

# Version: 0.32

# Check argument(s)
NUM_ARG=1

if [ "$#" != "$NUM_ARG" ] ; then
   echo "Usage: $0 <artifact.zip>" 
   exit 1
fi

# Variables initialization
JQ=$(which jq 2> /dev/null)
UNZIP=$(which unzip 2> /dev/null)
ARTIFACT=$1
SRC_DIR="../src"
PlanScript_DIR=${SRC_DIR}/PlanScripts
BuildPlan_DIR=${SRC_DIR}/BuildPlans

# Check Requirements

# jq and unzip must be present in the system
if [ -z $JQ ] ; then
   echo "jq not present in this system. Exiting..." 
   exit 2 
fi
if [ -z $UNZIP ] ; then
   echo "unzip not present in this system. Exiting..." 
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
mkdir ${PlanScript_DIR} > /dev/null 2>&1
mkdir ${BuildPlan_DIR}  > /dev/null 2>&1
rm -f *-FDZ 2> /dev/null

# unzip locally
unzip $ARTIFACT -d .

# 
PS_LIST=$(ls *_planscript.json)
BP_LIST=$(ls *_buildplan.json)

# Extract script sources from the .json files
for f in $PS_LIST ; do
    echo "Processing Plan Script: $f"
    PS_NAME=$($JQ  -r '.name' $f)
    PS_FILENAME=$($JQ  -r '.name' $f | tr ' ' "-")
    PS_ID=$($JQ  -r '.id' $f)
    PS_CONTENT=$($JQ  '.content' $f)
    echo -e $PS_CONTENT | sed '1s/^"// ; $s/"$// ; 1,$s/\\"/"/g' > ${PlanScript_DIR}/${PS_FILENAME}
done

echo
# Extract Build Plan info from the .json files
for f in $BP_LIST ; do
    echo "Processing Build Plan: $f"
    BP_NAME=$($JQ  -r '.name' $f) 
    BP_FILENAME=$($JQ  -r '.name' $f | tr ' ' "-") 
    BP_ID=$($JQ  -r '.buildPlanid' $f)
    BP_DESCRIPTION=$($JQ  '.description' $f | tr --delete '"' )
    BP_TYPE=$($JQ '.oeBuildPlanType' $f  | tr --delete '"')
    BP_STEPS=$($JQ '.buildStep[] | .planScriptName' $f | tr --delete '"')
    BP_CUSTOM_ATTRIBUTES=$($JQ '.customAttributes' $f | tr --delete '[]')
    
    cat > ${BuildPlan_DIR}/${BP_FILENAME} << __EOF__
Build Plan properties summary


Name: $BP_NAME
Type: $BP_TYPE
ID  : $BP_ID
Description: $BP_DESCRIPTION

Steps:
$BP_STEPS

Custom Attributes:
$BP_CUSTOM_ATTRIBUTES



__EOF__
    #echo -e $BP_CONTENT | sed '1s/^"// ; $s/"$// ; 1,$s/\\"/"/g' > $BP_NAME
done

# Cleanup 
rm *.json MANIFEST.MF SHA256SUM.sha256sum > /dev/null 2>&1

exit 0

