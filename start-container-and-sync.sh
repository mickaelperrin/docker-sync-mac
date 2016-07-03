#!/usr/bin/env bash
set -e
echo "Starting docker containers"
docker-compose -p test up -d

echo "Starting synchronisation"
/bin/bash ./docker-sync.sh -c docker-compose.yml -l DEBUG
