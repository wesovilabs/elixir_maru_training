#!/bin/bash
set -e
set -x

echo "******PostgreSQL initialisation******"


echo "Starting postgres"
gosu postgres pg_ctl -w start

gosu postgres psql -h localhost -p 5432 -U wesovi -d elixir_ecto_training_db -a -f /var/sql/create-tables.sql

echo "Stopping Postgres"
gosu postgres pg_ctl stop

echo "Stopped postgres"

echo "******Initialisation finished******"