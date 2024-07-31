#!/bin/bash

PROJECT_DIR="/var/www/api_smartlogger"
IMAGE_NAME="smartlogger-api"

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

docker build -t $IMAGE_NAME:latest $PROJECT_DIR
if [ $? -eq 0 ]; then
  log_output "Construir imagem do smartlogger-api" "success"
else
  log_output "Construir imagem do smartlogger-api" "error"
  exit 1
fi
