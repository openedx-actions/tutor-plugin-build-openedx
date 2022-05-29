#!/bin/bash
#---------------------------------------------------------
#
# copy the requirements file to the plugins path
#
#---------------------------------------------------------

echo "adding requirementws"
pwd
ls -lha
echo "parent looks like this..."
ls ../ -lha
echo "tutor root is "
echo "$(tutor config printroot)"
echo "tutor directory contents:"
ls $(tutor config printroot) -lha
echo "PLUGINS_PATH: ${PLUGINS_PATH}"

cp ./requirements/private.txt ${PLUGINS_PATH}
