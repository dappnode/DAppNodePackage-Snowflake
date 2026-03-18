#!/bin/sh
set -eu

set -- /bin/proxy -ephemeral-ports-range 30000:30999

if [ -n "${EXTRA_OPTS:-}" ]; then
  # Intentionally allow word splitting so users can pass multiple flags.
  set -- "$@" ${EXTRA_OPTS}
fi

exec "$@"
