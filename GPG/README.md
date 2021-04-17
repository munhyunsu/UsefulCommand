# The GNU Privacy Guard (called gpg)

## Renew expired key
- Check all of keys
```bash
gpg --list-keys
gpg --edit-key KEYID
```

- Manage keys at gpg prompt
```bash
gpg> key 1
gpg> expire
```


## Github renew GPG key
1. update the expiration

2. delete the expired key in Github account settings

3. upload the new key to Github


## Backup and restore gpg keys
1. Identify private key

2. Export private key

3. Import private key

```bash
gpg --list-secret-keys
gpg --export-secret-keys ID > secret-keys.gpg
gpg --import secret-keys.gpg
```

## Encrypt and decrypt file or directory
- Files
```bash
gpg --encrypt --output FILE.gpg -r RECIPIENT SRCFILE
```

```bash
gpg --decrypt --output FILE ECRYPTEDFILE
```

- Directories
```bash
gpg-zip --encrypt --output FILEZIP.gpg -r RECIPIENT SRCDIR
gpgtar --encrypt --output FILEZIP.gpg -r RECIPIENT SRCDIR
```

```bash
gpg-zip --decrypt ENCRYPTEDDIR
gpgtar --decrypt ENCRYPTEDDIR
```

