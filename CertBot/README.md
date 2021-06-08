# Lets Encrypt

## Install snap
- Enable snap: comment all lines
```bash
sudo vi /etc/apt/preferences.d/nosnap.pref
```

## Renew

```bash
sudo certbot renew --dry-run
sudo certbot renew
```
