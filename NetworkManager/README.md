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
nmcli connection show
```

## VPN Auto-reconnect

```bash
nmcli connection modify <Your VPN connection name> connection.autoconnect-retries 0
nmcli connection modify <Your VPN connection name> vpn.persistent yes
```

- [Ref](https://askubuntu.com/questions/679059/auto-reconnect-to-vpn-on-disconnect)
