#!/bin/sh
set -euo pipefail

TO_KEEP=$(echo "
  usr/bin/mysql$
  usr/bin/mariadb$
  usr/bin/getconf
	usr/bin/getent
	usr/share/mariadb/charsets
	usr/share/mariadb/english" |
  tr -d " \t\n\r" | sed -e 's/usr/|usr/g' -e 's/^.//')

INSTALLED_FILES="$(apk info -q -L mariadb-client | tail -n +2)
$(apk info -q -L mariadb-common | tail -n +2)"

for path in $(echo "${INSTALLED_FILES}" | grep -v -E "${TO_KEEP}"); do
	eval rm -rf "${path}"
done
