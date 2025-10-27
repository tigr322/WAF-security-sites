#!/bin/bash
# scripts/monitor.sh
echo "Security Gateway Monitoring"

echo "=== Suricata Stats ==="
docker exec suricata-ips suricatasc -c stats

echo "=== Nginx Status ==="
docker exec nginx-gateway nginx -t
curl -s http://localhost/health

echo "=== Container Status ==="
docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"