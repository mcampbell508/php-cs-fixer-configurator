#!/bin/bash
set -o errexit
set -o pipefail
set -o nounset

pushd . > /dev/null
SCRIPT_PATH="${BASH_SOURCE[0]}";
while([ -h "${SCRIPT_PATH}" ]) do
    cd "`dirname "${SCRIPT_PATH}"`"
    SCRIPT_PATH="$(readlink "`basename "${SCRIPT_PATH}"`")";
done
cd "`dirname "${SCRIPT_PATH}"`" > /dev/null

while read -r LINE; do
	if [ -n "$LINE" ]; then
		php update-docs.php $LINE
	fi
done < versions.txt