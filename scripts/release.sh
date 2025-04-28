#!/bin/bash
set -e
# shellcheck disable=SC1091
source ./release.env

readonly deb_file="./target/$COMPONENT_NAME-$COMPONENT_VERSION.deb"

if [[ ! -f $deb_file ]]; then
  echo "File $deb_file not found"
  exit 1
fi

mkdir -p /mnt/c/Users/sing/Documents/artifacts/buildo
cp -v "$deb_file" /mnt/c/Users/sing/Documents/artifacts/buildo

sudo apt install "$deb_file"
