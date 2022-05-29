#!/bin/bash
#---------------------------------------------------------
#
# copy the requirements file to the plugins path
#
#---------------------------------------------------------

cp ${{ github.action_path }}/requirements/private.txt ${PLUGINS_PATH}
