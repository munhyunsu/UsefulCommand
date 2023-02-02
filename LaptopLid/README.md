# Laptop Lid action at login screen

- `vi /etc/systemd/logind.conf`

```
HandleLidSwitch=suspend
HandleLidSwitchExternalPower=ignore
HandleLidSwitchDocked=ignore
```

- `gsettings get org.gnome.settings-daemon.plugins.power`

```bash
gsettings get org.gnome.settings-daemon.plugins.power lid-close-ac-action
gsettings get org.gnome.settings-daemon.plugins.power lid-close-battery-action
gsettings get org.gnome.settings-daemon.plugins.power lid-close-suspend-with-external-monitor
```
