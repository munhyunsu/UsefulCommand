# Laptop Lid action at login screen

- `vi /etc/systemd/logind.conf`

```
HandleLidSwitch=suspend
HandleLidSwitchExternalPower=ignore
HandleLidSwitchDocked=ignore
```


