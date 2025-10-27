FROM jasonish/evebox:latest

# Создаем папку для базы данных с правильными правами
USER root
RUN mkdir -p /var/lib/evebox && chown 1000:1000 /var/lib/evebox
USER 1000