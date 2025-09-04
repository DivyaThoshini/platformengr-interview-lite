#!/bin/bash

# Values to substitute
 BUILD="abc1234"
 BUCKET="gcs_mythd_bucket"
 PROJECT="my_new_project"
 VERSION="v1.0"

 # Read template and perform replacements
 sed -e "s/_BUILD_NAME_/$BUILD/" \
     -e "s/_BUCKET_/$BUCKET/" \
     -e "s/_PROJECT_/$PROJECT/" \
     -e "s/_VERSION_/$VERSION/" \
     config.json.tmpl > config.json
echo "config.json generated successfully!"
