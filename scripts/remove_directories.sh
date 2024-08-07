#!/bin/bash

BIND_DIRS=("/mnt/smartlogger_data" "/mnt/smartlogger_api_data")

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

for dir in "${BIND_DIRS[@]}"; do
  if [ -d "$dir" ]; then
    rm -rf "$dir"
    log_output "Remover diretório: $dir" "success"
  else
    log_output "Remover diretório: $dir" "error"
  fi
done
