# Security Gateway Setup

Полная система защиты веб-приложений с Suricata IPS и Nginx Gateway.

## Быстрый старт

1. Клонируйте структуру проекта
2. Настройте параметры в `.env`
3. Запустите: `docker-compose up -d`
4. Проверьте: `./scripts/monitor.sh`

## Команды управления

- `docker-compose up -d` - запуск системы
- `docker-compose down` - остановка системы
- `./scripts/update-rules.sh` - обновление правил Suricata
- `./scripts/monitor.sh` - мониторинг состояния

## Порты

- 80: HTTP трафик
- 443: HTTPS трафик

## Мониторинг

- Suricata логи: `suricata/logs/`
- Nginx логи: `nginx/logs/`
- Health check: `http://localhost/health`