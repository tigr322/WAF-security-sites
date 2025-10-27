# suricata/Dockerfile
FROM jasonish/suricata:latest

# Копируем только конфигурацию
COPY config/suricata.yaml /etc/suricata/suricata.yaml
COPY rules/local.rules /var/lib/suricata/rules/local.rules

# Обновляем правила
RUN suricata-update

CMD ["sh", "-c", "suricata -c /etc/suricata/suricata.yaml -i eth0 --af-packet"]