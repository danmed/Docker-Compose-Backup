#!/bin/sh

# Path to backup location
backup_dir="$HOME/compose-backups"

docker pull red5d/docker-autocompose
current_time=$(date "+%Y.%m.%d-%H.%M.%S")
docker ps --format '{{.Names}}' > containers.txt
while IFS="" read -r p || [ -n "$p" ]
do
  docker run --rm -v /var/run/docker.sock:/var/run/docker.sock red5d/docker-autocompose $p > "$backup_dir/$p-$current_time.yaml"
done < containers.txt
find "$backup_dir" -name "*.yaml" -mtime +5 -exec rm {} \;
