#!/usr/bin/env bash

# Redis
sudo docker run -d --restart unless-stopped -p "6379:6379" --name=redis7 redis:7

# Postgres
sudo docker run -d --restart unless-stopped -p "5432:5432" --name=postgres17 -e POSTGRES_HOST_AUTH_METHOD=trust postgres:17