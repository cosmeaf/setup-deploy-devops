#!/bin/bash

source /var/www/setup/config.sh

for container in "${CONTAINERS[@]}"; do
  if docker ps -a --format "{{.Names}}" | grep -q "$container"; then
    log_output "Verificar contêiner ativo: $container" "success"
  else
    log_output "Verificar contêiner ativo: $container" "error"
  fi
done
