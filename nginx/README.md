# [nginx.org](https://nginx.org/) or [nginx.com](https://www.nginx.com/)

## Install nginx
- add repository (Ubuntu based)
```bash
wget -q https://nginx.org/keys/nginx_signing.key -O- | sudo apt-key add -
```

- vi /etc/apt/source.list.d/nginx.list
```
deb [arch=amd64] https://nginx.org/packages/mainline/ubuntu/ focal nginx
deb-src [arch=amd64] https://nginx.org/packages/mainline/ubuntu/ focal nginx
```

- Install
```bash
apt update
apt install nginx
```

- Check installed nginx
```
crul -I 127.0.0.1
```

## Reverse proxy
- vi /etc/nginx/nginx.conf
```bash
cd /etc/nginx
cp nginx.conf nginx.conf.backup
vi nginx.conf
```

- nginx.conf
```

user  nginx;
#worker_processes  1;
worker_processes  auto;

error_log  /var/log/nginx/error.log warn;
pid        /var/run/nginx.pid;


events {
    worker_connections  1024;
}


http {
    include       /etc/nginx/mime.types;
    default_type  application/octet-stream;

    log_format  main  '$remote_addr - $remote_user [$time_local] "$request" '
                      '$status $body_bytes_sent "$http_referer" '
                      '"$http_user_agent" "$http_x_forwarded_for"';

    access_log  /var/log/nginx/access.log  main;

    sendfile        on;
    #tcp_nopush     on;

    keepalive_timeout  65;

    #gzip  on;

    include /etc/nginx/conf.d/*.conf;
}
```

- vi /etc/nginx/conf.d/jupyterlab.conf
```bash
cd /etc/nginx/conf.d
cp default.conf default.conf.backup
mv default.conf jupyterlab.conf
vi jupyterlab.conf
```

- jupyterlab.conf
```
server {
    listen 443 ssl;
    server_name _;
    ssl_certificate /etc/letsencrypt/live/coding.cnu.ac.kr/fullchain.pem;$
    ssl_certificate_key /etc/letsencrypt/live/coding.cnu.ac.kr/privkey.pem;$
    ssl_session_cache shared:le_nginx_SSL:10m;$
    ssl_session_timeout 1440m;$
    ssl_protocols TLSv1.2 TLSv1.3;$
    ssl_prefer_server_ciphers off;$
    ssl_ciphers "ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES256-GCM-SHA384:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-CHACHA20-POLY1305:ECDHE-RSA-CHACHA20-POLY1305:DHE-RSA-AES128-GCM-SHA256:DHE-RSA-AES256-GCM-SHA384";$
    add_header Strict-Transport-Security max-age=15768000;$
    return 444;
}

map $http_upgrade $connection_upgrade {
    default upgrade;
    ''      close;
}

server {
    listen 80;
    server_name domain.com;

    return 302 https://$host$request_uri;
}

server {
    listen 443 ssl;

    server_name domain.com;

    # SSL setting
    ssl_certificate /etc/letsencrypt/live/domain.com/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/domain.com/privkey.pem;

    # This file contains important security parameters. If you modify this file
    # manually, Certbot will be unable to automatically provide future security
    # updates. Instead, Certbot will print and log an error message with a path to
    # the up-to-date file that you will need to refer to when manually updating
    # this file.
    ssl_session_cache shared:le_nginx_SSL:10m;
    ssl_session_timeout 1440m;
    ssl_session_tickets off;

    ssl_protocols TLSv1.2 TLSv1.3;
    ssl_prefer_server_ciphers off;

    ssl_ciphers "ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES256-GCM-SHA384:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-CHACHA20-POLY1305:ECDHE-RSA-CHACHA20-POLY1305:DHE-RSA-AES128-GCM-SHA256:DHE-RSA-AES256-GCM-SHA384";

    add_header Strict-Transport-Security max-age=2592000;

    # reverse proxy
    location / {
        proxy_pass http://127.0.0.1:8888;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header Host $host;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;

        # websocket headers
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection $connection_upgrade;
        proxy_set_header X-Scheme $scheme;

        proxy_buffering off;
    }
}

```
