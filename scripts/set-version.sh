#!/bin/bash
set -e

# shellcheck disable=SC1091
. ./release.env

sed -i 'src/DEBIAN/control' -e 's@Version: .*@Version: '"$COMPONENT_VERSION"'@g'
sed -i 'src/DEBIAN/control' -e 's@Package: .*@Package: '"$COMPONENT_NAME"'@g'
