#!/bin/bash

# Configurações dos projetos
PROJECTS=(
  "smartlogger-react"
)

# Diretórios dos projetos
PROJECT_DIRS=(
  "/var/www/web_smartlogger"
)

# Imagens dos projetos
IMAGES=(
  "smartlogger-react"
)

# Volumes dos projetos
VOLUMES=(
  "smartlogger_data"
)

# Contêineres dos projetos
CONTAINERS=(
  "smartlogger-react"
)

# Diretórios de bind dos projetos
BIND_DIRS=(
  "/mnt/smartlogger_data"
)

# Docker Compose arquivos
DOCKER_COMPOSE_FILES=(
  "/var/www/setup/docker/docker-compose-reactjs.yml"
)
