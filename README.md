# 🛡️ Security Gateway Setup

Полная система защиты веб-приложений с **Suricata IPS** и **Nginx Gateway**.

---

## 🎯 Что реализовано

Вы успешно развернули **многоуровневую систему безопасности** для веб-приложений, включающую:

### 🧩 Компоненты системы
- **Nginx Gateway** — Web Application Firewall (WAF) и обратный прокси
- **Suricata** — система обнаружения и предотвращения вторжений (IPS/IDS)
- **Изолированная сеть** — сегментированная архитектура безопасности
- **Скрытый бэкенд** — основное приложение недоступно напрямую извне

---

## 🔧 Архитектура безопасности

```
[Внешний трафик]
        ↓
[Suricata IPS/IDS] ← мониторинг
        ↓
[Nginx Gateway :80] ← единственная точка входа
        ↓
[Сеть security-net] ← изолированный сегмент
        ↓
[Основное приложение] ← скрыто от внешнего доступа
```

---

## 📁 Структура проекта

```
project/
├── docker-compose.yml         # Шлюз безопасности
├── main-docker-compose.yml    # Основное приложение
├── nginx/
│   └── conf/
│       └── nginx.conf         # Конфигурация WAF
├── suricata-logs/             # Логи IPS
├── scripts/
│   ├── monitor.sh             # Мониторинг системы
│   └── update-rules.sh        # Обновление правил
└── .env                       # Переменные окружения
```

---

## 🚀 Быстрый старт

1. **Клонируйте репозиторий**
2. **Настройте параметры** в `.env`
3. **Запустите систему**
   ```bash
   docker-compose up -d
   ```
4. **Проверьте работоспособность**
   ```bash
   ./scripts/monitor.sh
   ```

---

## ⚙️ Основные команды

```bash
# Запуск всей системы
docker-compose up -d

# Остановка системы
docker-compose down

# Обновление правил Suricata
./scripts/update-rules.sh

# Мониторинг состояния
./scripts/monitor.sh

# Просмотр логов Suricata
tail -f suricata-logs/fast.log

# Проверка сетевых соединений
docker network inspect security-net
```

---

## 🔒 Порты и доступность

| Порт | Назначение |
|------|-------------|
| 80   | HTTP-трафик (единственный открытый порт) |
| 443  | HTTPS-трафик |
| —    | Основное приложение скрыто за шлюзом |

---

## 📊 Мониторинг и логи

**Suricata:**
- `suricata-logs/fast.log` — основные события
- `suricata-logs/eve.json` — детализированные события (JSON)

**Nginx:**
- `nginx/logs/` — доступ и ошибки
- Health check: `http://localhost/health`
- Статус системы: `./scripts/monitor.sh`

---

## 🛠️ Конфигурация безопасности

### 🔐 Nginx Gateway как WAF

```nginx
# Защитные заголовки
add_header X-Frame-Options "SAMEORIGIN";
add_header X-XSS-Protection "1; mode=block";
add_header X-Content-Type-Options "nosniff";

# Ограничения запросов
limit_req_zone $binary_remote_addr zone=one:10m rate=1r/s;
```

### ⚔️ Suricata IPS

- Обнаружение SQL-инъекций
- Защита от XSS атак
- Мониторинг подозрительных payloads
- Детектирование сканирования портов

---

## 🔄 Обновление правил

```bash
# Автоматическое обновление правил
./scripts/update-rules.sh

# Или вручную
docker exec suricata-ips suricata-update
```

---

## 🚨 Реагирование на инциденты

```bash
# Проверить логи Suricata
tail -f suricata-logs/fast.log

# Анализ атак
cat suricata-logs/eve.json | jq .

# Блокировка IP
# (через конфигурацию Nginx)

# Обновление правил при обнаружении новых угроз
./scripts/update-rules.sh
```

---

## ✅ Преимущества реализации

- 🧱 **Глубокая защита** — многоуровневая security-архитектура
- 🔒 **Полная изоляция** — основное приложение недоступно извне
- 🩺 **Мониторинг в реальном времени** — Suricata детектирует угрозы
- ⚙️ **Масштабируемость** — легко добавить новые сервисы
- 🧭 **Простота управления** — единая точка входа и контроля

---

## 🔍 Проверка работоспособности

```bash
# Проверить доступность через шлюз
curl http://localhost/

# Проверить health check
curl http://localhost/health

# Проверить логи Suricata
docker logs suricata-ips

# Убедиться, что основной сайт скрыт
curl http://localhost:8099  # должен быть недоступен
```

---

🎉 **Поздравляем!**  
Вы успешно развернули профессиональную систему безопасности.  
Ваше приложение теперь защищено по **enterprise-стандартам**.
