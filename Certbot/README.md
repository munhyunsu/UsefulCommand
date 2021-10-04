# Lets Encrypt

## Install snap
- Enable snap: comment all lines
```bash
sudo vi /etc/apt/preferences.d/nosnap.pref
```

- Update snapd
```bash
sudo snap install core
sudo snap refresh core
```

## Install Certbot
- Remove and install certbot
```bash
sudo apt remove certbot
sudo snap install --classic certbot
```

- Link command
```bash
sudo ln -s /snap/bin/certbot /usr/bin/certbot
```

- Container with root
```bash
sudo snap set certbot trust-plugin-with-root=ok
```

## Acquire certificate (with Google DNS)

- [Ref](https://certbot-dns-google.readthedocs.io/en/stable/)
```bash
sudo certbot certonly --dns-google --dns-google-credential JSONPATH -d *.domain.com -d domain.com
```

## Renew

```bash
sudo certbot renew --dry-run
sudo certbot renew
```

# Lets Encrypt Commands

## Renew
- Google DNS JSON located at /etc/letsencrypt

```bash
sudo -s
cd /etc/letsencrypt
certbot renew --dry-run
certbot renew
```

### Copy to other workstation
```bash
tar -cvf letsencrypt.tar.gz /etc/letsencrypt
```

```bash
scp -i PRIKEY /etc/letsencrypt.tar.gz ./
# chown / chgrp
```

### (Optional) Reload nginx
```bash
nginx -s reload
```
