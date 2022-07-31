#!/bin/bash

version=$1
debrel=$2
if [ ! $version ] || [ ! $debrel ]; then
    echo "Usage: $0 <new-version> <debrel>"
    exit 1
fi

# Remove old debian files
rm openrazer_*
# Run various scripts
./make_debian_orig_tar_xz.sh $version
./make_debian_tar_xz.sh $version $debrel
./update_release.sh $version $debrel

# Remove _service:download_url:* file as I don't want it in the history
rm _service:download_url:*

echo "Everything should be updated!"
