#!/bin/bash

VOLUME_NAMES=("smartlogger_data")

log_output() {
  local task=$1
  local status=$2
  local color_reset='\033[0m'
  local color_red='\033[0;31m'
  local color_green='\033[0;32m'
  local color_status=""

  if [ "$status" == "success" ]; then
    color_status="${color_green}success${color_reset}"
  else
    color_status="${color_red}error${color_reset}"
  fi

  echo -e "$(date '+%Y-%m-%d %H:%M:%S') - $task - status [$color_status]"
}

for volume in "${VOLUME_NAMES[@]}"; do
  if docker volume ls | grep -q "$volume"; then
    docker volume rm "$volume"
    log_output "Remover volume: $volume" "success"
  else
    log_output "Remover volume: $volume" "error"
  fi
done
