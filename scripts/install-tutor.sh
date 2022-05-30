#!/bin/bash
#---------------------------------------------------------
#
# install tutor and set tutor-specific environment variables.
#
#---------------------------------------------------------
pip install --upgrade pyyaml
echo "TUTOR_ROOT=${{ github.action_path }}/tutor" >> $GITHUB_ENV
pip install tutor
echo "TUTOR_VERSION=$(tutor --version | cut -f3 -d' ')" >> $GITHUB_ENV
echo "TUTOR_ENABLE_HTTPS=true" >> $GITHUB_ENV
