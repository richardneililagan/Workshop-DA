#!/bin/bash
WORKSHOP_CONTENT_FOLDER=$(dirname $0)/../workshop/content
NUMBERING_CORRECTOR=$(dirname $0)/NumberingCorrecter.py

pushd $WORKSHOP_CONTENT_FOLDER
MD_FILES=`find . -iname *.md`
popd
for file in $MD_FILES
do
    echo "correcting file $WORKSHOP_CONTENT_FOLDER/$file"
    python $NUMBERING_CORRECTOR $WORKSHOP_CONTENT_FOLDER/$file
done
