# nginx/Dockerfile
FROM nginx:1.24-alpine

LABEL maintainer="Your Name <email@example.com>"
LABEL description="Nginx security gateway with DDoS protection"

# Устанавливаем дополнительные модули
RUN apk add --no-cache \
    nginx-mod-http-headers-more \
    nginx-mod-http-lua \
    curl \
    && rm -rf /var/cache/apk/*

# Копируем конфигурацию
COPY conf/nginx.conf /etc/nginx/nginx.conf
COPY conf/security.conf /etc/nginx/conf.d/security.conf
COPY conf/proxy.conf /etc/nginx/conf.d/proxy.conf
COPY conf/blocked_ips.conf /etc/nginx/conf.d/blocked_ips.conf

# Создаем необходимые директории
RUN mkdir -p /var/cache/nginx/client_temp \
    && mkdir -p /var/cache/nginx/proxy_temp \
    && mkdir -p /var/log/nginx \
    && chown -R nginx:nginx /var/cache/nginx /var/log/nginx

# Настраиваем права
RUN chmod -R 755 /var/log/nginx \
    && chmod 644 /etc/nginx/conf.d/*.conf

EXPOSE 80

HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
    CMD curl -f http://localhost/health || exit 1

CMD ["nginx", "-g", "daemon off;"]