#!/bin/bash
#---------------------------------------------------------
#
# copy the requirements file to the plugins path
#
#---------------------------------------------------------

echo "adding requirementws"
pwd
ls -lha
cp ./requirements/private.txt ${PLUGINS_PATH}
