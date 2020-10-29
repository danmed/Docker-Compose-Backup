# Docker-Compose-Backup
Create compose files from running containers

* pulls the latest image for red5d/docker-autocompose
* creates a list of running containers (containers.txt)
* creates compose files for each one (containername-date-time-.yaml)
* deletes yaml files older than 5 days.
