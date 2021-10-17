#!/bin/sh
set -e
if [ -f /app/tmp/pids/server.pid ]; then
  rm /app/tmp/pids/server.pid
fi

echo "==============="
echo "|$RAILS_MASTER_KEY|"
echo "==============="

bundle exec rake db:migrate 2>/dev/null || bundle exec rake db:setup
exec bundle exec "$@"