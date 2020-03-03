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

## Restart GPG agent
  ```bash
  gpg-connect-agent RELOADAGNET BYE
  ```
