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

## Restart GPG agent
  ```bash
  gpg-connect-agent RELOADAGNET BYE
  ```
