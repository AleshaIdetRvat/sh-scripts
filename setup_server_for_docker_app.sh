#!/bin/bash

echo "Обновляем список пакетов..."
sudo apt update

echo "Устанавливаем необходимые пакеты..."
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common

echo "Скачиваем и устанавливаем Docker"
 (
  # Change umask so that /usr/share/keyrings/docker-archive-keyring.gpg has the right permissions.
  # We do this in a subprocess so the umask for the calling process is unaffected.
  umask 0022
  curl --silent --show-error --fail https://get.docker.com/ | sh
) >&2

echo "Запускаем и включаем Docker..."
systemctl enable --now docker.service

echo "Проверяем версию Docker и docker-compose..."
docker --version
