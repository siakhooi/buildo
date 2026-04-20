#!/bin/bash
set -e

# shellcheck disable=SC1091
. ./release.env

sed -i 'src/DEBIAN/control' -e 's@Version: .*@Version: '"$COMPONENT_VERSION"'@g'
sed -i 'src/DEBIAN/control' -e 's@Package: .*@Package: '"$COMPONENT_NAME"'@g'
sed -i 'src/RPMS/siakhooi-buildo.spec' -e 's@Version:        .*@Version:        '"$COMPONENT_VERSION"'@g'
sed -i 'src/RPMS/siakhooi-buildo.spec' -e 's@Name:           .*@Name:           '"$COMPONENT_NAME"'@g'
# Update publish-to-apt.yml
sed -i 'publish-to-apt.yml' -e 's@siakhooi-buildo_[0-9.]*_amd64.deb@siakhooi-buildo_'"$COMPONENT_VERSION"'_amd64.deb@g'
sed -i 'publish-to-apt.yml' -e 's@docs/pool/main/binary-amd64/siakhooi-buildo_[0-9.]*_amd64.deb@docs/pool/main/binary-amd64/siakhooi-buildo_'"$COMPONENT_VERSION"'_amd64.deb@g'

# Update publish-to-rpms.yml
sed -i 'publish-to-rpms.yml' -e 's@siakhooi-buildo-[0-9.]*-1.fc43.noarch.rpm@siakhooi-buildo-'"$COMPONENT_VERSION"'-1.fc43.noarch.rpm@g'
sed -i 'publish-to-rpms.yml' -e 's@docs/siakhooi-buildo-[0-9.]*-1.fc43.noarch.rpm@docs/siakhooi-buildo-'"$COMPONENT_VERSION"'-1.fc43.noarch.rpm@g'
