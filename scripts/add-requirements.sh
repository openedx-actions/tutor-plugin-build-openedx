#!/bin/bash
#---------------------------------------------------------
#
# copy the requirements file to the plugins path
#
#---------------------------------------------------------

cat <<EOT>> ${PLUGINS_PATH}/private.txt
# This file will drive the x-blocks and requirements customization
# as described in https://docs.tutor.overhang.io/configuration.html#installing-extra-xblocks-and-requirements
# It will be placed on the location tutor expect is during the CI build.
# If it uses a local private repo it will need to also be checked out in the CI worflow.

# Add your additional requirements, such as xblocks, to this file. For
# requirements coming from private repositories, clone the repository to this
# folder and then add your requirement with the `-e` flag. Ex:
#
#   git clone git@myserver:myprivaterepo.git
#   echo "-e ./myprivaterepo/" >> private.txt

#git+https://github.com/Stanford-Online/xblock-in-video-quiz
#git+https://github.com/open-craft/xblock-activetable.git
#factory_boy
#django-debug-toolbar

-e ./${CUSTOM_PLUGIN}
-e ./${CUSTOM_XBLOCK}
EOT

echo "saved to ./private.txt"
echo "file looks like this...."
cat "${PLUGINS_PATH}/private.txt"
