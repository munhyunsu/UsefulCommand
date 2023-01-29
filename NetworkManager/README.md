# Update timezone automatically using NetworkManager
  - vi /etc/NetworkManager/dispatcher.d/09-timezone
  ```bash
  #!/bin/sh
  case "$2" in
      up)
          timedatectl set-timezone "$(curl --fail https://ipapi.co/timezone)"
      ;;
  esac
  ```


# `nmcli`

```bash
nmcli c show
```
