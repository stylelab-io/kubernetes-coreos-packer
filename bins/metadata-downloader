#!/usr/bin/env bash
key=$1
output=$2

function check {
    status_code=$(curl -s -o /dev/null -w "%{http_code}" "http://metadata.google.internal/computeMetadata/v1/project/attributes/${key}" -H "Metadata-Flavor: Google")
}
function download {
    curl -o ${output} "http://metadata.google.internal/computeMetadata/v1/project/attributes/${key}" -H "Metadata-Flavor: Google"
}

check
if [ "$status_code" -eq 200 ]
then
   download
   echo "File Downloaded"
   exit 0
elif [ "$status_code" -eq 000 ]
then
   echo "Not on GCE. Exiting"
   exit 0
elif [ "$status_code" -eq 404 ]
then
   echo "Key not found"
   exit 1
else
   echo "Something went wrong"
   exit 1
fi
