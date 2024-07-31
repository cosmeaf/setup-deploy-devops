#!/bin/bash

source /var/www/setup/config.sh

for container in "${CONTAINERS[@]}"; do
  if docker ps -a --format "{{.Names}}" | grep -q "$container"; then
    docker stop "$container" && docker rm "$container"
    log_output "Parar e remover contêiner: $container" "success"
  else
    log_output "Parar e remover contêiner: $container" "error"
  fi
done
