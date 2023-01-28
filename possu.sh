#!/bin/bash

docker rm posso
rm mock_data.sql
rm dump.sql

npm run dump
touch dump.sql

cat tables.sql >> dump.sql &&
cat mock_data.sql >> dump.sql

docker build --tag possu -f Postgres.Dockerfile .
docker run -p 5432:5432 --name posso possu
