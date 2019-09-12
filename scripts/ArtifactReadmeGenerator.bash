#!/bin/bash

# Version 0.2

# This script generates the <ArtifactName>-README.md file 
# associated with each artifact bundle found in the 
# artifact-bundles directory. It overwrites any already existing 
# file. It must be ran after the ExtractArtifactSources.bash script.

# Check argument(s)
NUM_ARG=1

if [ "$#" != "$NUM_ARG" ] ; then
   echo "Usage: $0 <artifact directory>"
   echo
   echo "       where <artifact directory> represents the path" 
   echo "       to the directory containing the artifacts zip files"
   echo 
   echo "example: $0 ../artifact-bundles"
   exit 1
fi
 
# Variables initialization
MyName=$(basename ${0})
ARTIFACT_DIR="$1"

# Verify that ARTIFACT_DIR exists and contains at least one valid bundle
if [ -d $ARTIFACT_DIR ] ; then
	cd $ARTIFACT_DIR
	ARTIFACT_SRC="${PWD}/../src"
	ARTIFACT_FILE_LIST="$(ls ${ARTIFACT_DIR}/*zip)"

	# extract only base with no .zip suffix
	for file in $ARTIFACT_FILE_LIST ; do
		ARTIFACT_LIST="$ARTIFACT_LIST $(basename $file .zip)"
	done

	if [ -z "${ARTIFACT_LIST}" ] ; then
		echo "Could not find any artifact bundle in ${ARTIFACT_DIR}. Exiting"
		exit 1
	fi
fi

# Verify artifact sources are present or not
for artifact in $ARTIFACT_LIST ; do
	echo "Processing $artifact"
	# Verify that the sources have been extracted
	if [ ! -d ${ARTIFACT_SRC}/$artifact ] ; then
		echo "Could not find artifact sources for $artifact"
		echo "Make sure to extract sources before running $MyName" 
	else
	NEW_ARTIFACT_LIST="$NEW_ARTIFACT_LIST $artifact"
	fi
done
echo

for artifact in $NEW_ARTIFACT_LIST ; do
	cd ${ARTIFACT_SRC}/$artifact
	ARTIFACT_README="../${artifact}-README.md"
	echo -e "# Artifact content\n\n## Plan scripts content\n\nName | Description\n-|-" \
		> $ARTIFACT_README

	# ToDo: verify the PlanScripts directory exits
	PLANSCRIPT_LIST="$(ls PlanScripts)"
	cd PlanScripts
	for ps in $PLANSCRIPT_LIST ; do
		echo "Processing $ps"
		awk -F'#' 'BEGIN {Descr=""} \
			!/Description:/ {Descr=Descr $NF} \
			/############/ {exit} \
			END {print FILENAME, "|", Descr}' $ps >> ../$ARTIFACT_README
	done

done


echo -e "\n## Build plans content\n" >> ../$ARTIFACT_README
echo "TBD" >> ../$ARTIFACT_README
# Work in progress



