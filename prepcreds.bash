#!/bin/bash

# Prepare a credentials file so we can publish to artifactory.  
# For now making a call and updating the gradle properties with 
# the right value.  

CURRENT_RESULT=$(curl http://vault.vertigo.stitchfix.com/secure/flotilla-auto)
sed "s/dummy/$CURRENT_RESULT/" settings.xml > settings.xml2
mv settings.xml2 settings.xml 
echo "Credentials file saved"
