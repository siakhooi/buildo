#!/bin/bash
set -e
# shellcheck disable=SC1091
source ./release.env

readonly deb_file="$COMPONENT_NAME-$COMPONENT_VERSION.deb"

apt install ./target/"$deb_file"

echo "do source /usr/lib/buildo/buildo-init"
