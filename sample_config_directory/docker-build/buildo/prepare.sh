#!/bin/bash

if [[ $# -ne 1 ]]; then
  echo.error "Usage: $(basename "$0") working_dir"
  exit 0
fi

readonly WORKING_DIR=$1

set -e

BINDIR=$WORKING_DIR/bin
mkdir -p "$BINDIR"

cat > "$BINDIR/hello-buildo.sh" << _EOF
#!/bin/bash

echo "hello buildo!"
_EOF
