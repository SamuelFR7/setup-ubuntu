#!/usr/bin/env bash

echo "gets here"
redisName="redis7"

# Redis
[[ $(docker ps -f "name=$redisName" --format '{{.Names}}') == $redisName ]] ||
sudo docker run -d --restart unless-stopped -p "6379:6379" --name "$redisName" redis:7

pgName="postgres17"

# Postgres
[[ $(docker ps -f "name=$pgName" --format '{{.Names}}') == $pgName ]] ||
sudo docker run -d --restart unless-stopped -p "5432:5432" --name "$pgName" -e POSTGRES_HOST_AUTH_METHOD=trust postgres:17