#!/usr/bin/env bash

set -euo pipefail
usage() {
	echo "Usage: $(basename "$0") [-h] <directory1>..."
	echo "  -h               Display this help message"
	echo
	echo "Environment:"
	echo "  BUILDO_CLOSEOUT_BACKUP_ROOT_DIRECTORY"
	echo "                       Backup root (default: $HOME/.buildo/closeout)"
}
while getopts "h" arg; do
	case $arg in
	h)
		usage
		exit 0
		;;
	*)
		usage
		exit 1
		;;
	esac
done
shift $((OPTIND - 1))
if [[ $# -eq 0 ]]; then
	usage
	exit 1
fi

run_user=${SUDO_USER:-$(id -un)}
files_owner="$run_user:$(id -gn "$run_user")"
readonly backup_root_directory=${BUILDO_CLOSEOUT_BACKUP_ROOT_DIRECTORY:-$HOME/.buildo/closeout}
backup_directory=${backup_root_directory}/$(date +%Y%m)
mkdir -p "$backup_directory"

TMPDIR=$(mktemp -d --tmpdir "$(basename "$0")-XXXXXXXXXX")
status=0
for ARG in "$@"; do
	if [[ -f "$ARG" ]] || [[ -d "$ARG" ]]; then
		filename=$(basename "$ARG").$(date +%Y%m%d%H%M%S).$$.txz

		tmp_tarball_path="$TMPDIR/$filename"
		final_tarball_path="$backup_directory/$filename"
		(
			set -x
			if [[ ! -r "$ARG" ]] || { [[ -d "$ARG" ]] && [[ ! -x "$ARG" ]]; } ||
				find "$ARG" ! -readable -print -quit 2>/dev/null | grep -q .; then
				sudo chown -R -- "$files_owner" "$ARG"
				sudo chmod -R u+rX -- "$ARG"
			fi

			tar Jcvf "$tmp_tarball_path" -- "$ARG"
			ls -l "$tmp_tarball_path"
			if [[ -e "$final_tarball_path" ]]; then
				echo "refusing to overwrite $final_tarball_path" >&2
				exit 1
			fi
			mv --verbose -- "$tmp_tarball_path" "$final_tarball_path"
			rm -rf -- "$ARG"
		)
	else
		echo "$ARG" is not exists. >&2
		status=1
	fi
done
exit "$status"
