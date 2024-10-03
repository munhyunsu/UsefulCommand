# Lets Encrypt

# Install Certbot
- Install Certbot using pip

```
pip wheel certbot certbot-nginx certbot-dns-google
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

