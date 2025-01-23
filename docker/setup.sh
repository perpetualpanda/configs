#!/bin/sh
# Author: Yuzhou "Joe" Mo (@yuzhoumo)
# License: MIT

# upgrade packages and install docker
apk update && apk upgrade
apk add docker docker-compose linux-virt linux-virt-dev

# create docker service
rc-update add docker boot
service docker start

# install tailscale and authenticate
curl -fsSL https://tailscale.com/install.sh | sh
tailscale up --accept-routes --auth-key "${TS_AUTHKEY}"

# bring up docker containers
docker pull caddy
docker compose \
  -f caddy/docker-compose.yml \
  -f uptime-kuma/docker-compose.yml \
  up -d
