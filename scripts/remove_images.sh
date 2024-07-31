#!/bin/bash

source /var/www/setup/config.sh

for image in "${IMAGES[@]}"; do
  local image_ids=$(docker images --filter=reference="$image" --format "{{.ID}}")
  if [ -n "$image_ids" ]; then
    docker rmi -f $image_ids
    log_output "Remover imagens: $image" "success"
  else
    log_output "Remover imagens: $image" "error"
  fi
done
