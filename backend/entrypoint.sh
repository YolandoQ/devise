#!/bin/bash
set -e
rm -f /rails/tmp/pids/server.pid
rails db:prepare
exec "$@"