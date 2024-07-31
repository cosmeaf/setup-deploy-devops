#!/bin/bash

# Carregar as configurações
source /var/www/setup/config.sh

# Função para saída formatada
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

# Executar os scripts
/var/www/setup/scripts/check_containers.sh
/var/www/setup/scripts/stop_containers.sh
/var/www/setup/scripts/remove_images.sh
/var/www/setup/scripts/remove_volumes.sh
/var/www/setup/scripts/remove_directories.sh
/var/www/setup/scripts/create_volumes.sh
/var/www/setup/scripts/build_images.sh
/var/www/setup/scripts/create_containers.sh

# Informar status geral do sistema
log_output "Implantação concluída" "success"
