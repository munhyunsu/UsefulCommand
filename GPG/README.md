# The GNU Privacy Guard (called gpg)

## Renew expired key
  ```bash
  gpg --list-keys
  gpg --edit-key KEYID
  ```
  ```bash
  gpg> key 1
  gpg> expire
  ```
