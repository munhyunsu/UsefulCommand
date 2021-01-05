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
```
