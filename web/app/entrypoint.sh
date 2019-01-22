#!/bin/sh
set -e

if [ ! -d /home/app/tmp/pids ]; then
  mkdir -p /home/app/tmp/pids
fi

if [ ! -d /home/app/log/scans ]; then
  mkdir -p /home/app/log/scans
fi

if [ -f /home/app/tmp/pids/sidekiq.pid ]; then
  rm /home/app/tmp/pids/sidekiq.pid
fi

bundle exec rake db:migrate 2>/dev/null || bundle exec rake db:setup
exec bundle exec "$@"
