#!/bin/bash
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f /myapp/tmp/pids/server.pid

yarn install --check-files

rake db:create
rake db:migrate


# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"