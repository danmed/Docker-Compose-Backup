#!/bin/sh
docker pull red5d/docker-autocompose
current_time=$(date "+%Y.%m.%d-%H.%M.%S")
docker ps --format '{{.Names}}' > containers.txt
while IFS="" read -r p || [ -n "$p" ]
do
  docker run --rm -v /var/run/docker.sock:/var/run/docker.sock red5d/docker-autocompose $p > /mnt/downloads/ONEDRIVE/DOCKER-COMPOSE-BACKUPS/$p-$current_time.yaml
done < containers.txt
find /mnt/downloads/ONEDRIVE/DOCKER-COMPOSE-BACKUPS -name "*.yaml" -mtime +5 -exec rm {} \;
