#!/bin/bash
# wait-for-postgres.sh

set -e

host="$1"
shift
cmd="$@"

echo $host

until PGPASSWORD=gps_collector psql -h "$host" -U "gps_collector" -c '\l'; do
  >&2 echo "Postgres is unavailable - sleeping"
  sleep 1
done

>&2 echo "Postgres is up - executing command"
exec $cmd


PGPASSWORD=gps_collector psql -h "db" -port 5432 -U "gps_collector" 