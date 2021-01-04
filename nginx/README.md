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


