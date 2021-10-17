#!/bin/sh
set -e
if [ -f /app/tmp/pids/server.pid ]; then
  rm /app/tmp/pids/server.pid
fi

# Workaround for https://github.com/rails/rails/issues/33528
RAILS_MASTER_KEY=$(echo $RAILS_MASTER_KEY | tr -d '\n')

echo "==============="
echo "|$RAILS_MASTER_KEY|"
echo "==============="

bundle exec rake db:migrate 2>/dev/null || bundle exec rake db:setup
exec bundle exec "$@"