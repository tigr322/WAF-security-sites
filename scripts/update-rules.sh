#!/bin/bash
# scripts/update-rules.sh
echo "Updating Suricata rules..."

docker exec suricata-ips suricata-update
docker exec suricata-ips suricatasc -c ruleset-reload-rules

echo "Rules updated successfully!"