# Flatpak

## List applications
```bash
flatpak list
```

## Remote add
```bash
flatpak remote-add --user --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
```

## Install
```bash
flatpak install --user flathub INSTALL
```

## Update
```bash
flatpak update
```

## Remove unused application
```bash
flatpak remove --unused
```
