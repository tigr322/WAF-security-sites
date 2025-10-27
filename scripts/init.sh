#!/bin/bash
# scripts/init.sh
echo "Initializing Security Gateway..."

# Создаем директории
mkdir -p {suricata/{config,rules,logs},nginx/{conf,logs,cache},scripts}

# Копируем базовые конфиги (если нужно)
if [ ! -f suricata/config/suricata.yaml ]; then
    echo "Copying Suricata configuration..."
    cp templates/suricata.yaml suricata/config/
fi

if [ ! -f nginx/conf/nginx.conf ]; then
    echo "Copying Nginx configuration..."
    cp templates/nginx.conf nginx/conf/
fi

# Настраиваем права
chmod +x scripts/*.sh

echo "Setup completed!"