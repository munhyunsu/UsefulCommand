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

## Renew

```bash
sudo certbot renew --dry-run
sudo certbot renew
```
