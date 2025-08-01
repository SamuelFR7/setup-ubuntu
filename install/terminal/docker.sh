#!/usr/bin/env bash

if ! command -v docker &>/dev/null; then
  # Add the official Docker repo
  sudo install -m 0755 -d /etc/apt/keyrings
  sudo wget -qO /etc/apt/keyrings/docker.asc https://download.docker.com/linux/ubuntu/gpg
  sudo chmod a+r /etc/apt/keyrings/docker.asc
  echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | sudo tee /etc/apt/sources.list.d/docker.list >/dev/null
  sudo apt update -y

  # Install Docker engine and standard plugins
  sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin docker-ce-rootless-extras

  # Give this user privileged Docker access
  sudo usermod -aG docker ${USER}
  sudo chown $(whoami):$(whoami) /var/run/docker.sock
  sudo chown $USER:$USER ~/.docker

  # Limit log size to avoid running out of disk
  echo '{"log-driver":"json-file","log-opts":{"max-size":"10m","max-file":"5"}}' | sudo tee /etc/docker/daemon.json
fi
