#!/bin/bash

echo "Updating Suricata rules..."

# Создаем директории если их нет
mkdir -p suricata/lib/rules
mkdir -p suricata/cache

# Обновляем правила внутри контейнера
docker exec suricata-ips suricata-update --no-test

# Или если контейнер не запущен, используем временный контейнер
# docker run --rm -v $(pwd)/suricata/lib:/var/lib/suricata \
#   -v $(pwd)/suricata/cache:/var/cache/suricata \
#   jasonish/suricata:latest suricata-update --no-test

echo "Rules updated successfully!"