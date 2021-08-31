# MAME (Multiple Arcade Machine Emulator)

- [OfficialSite](https://www.mamedev.org/)

## Installation

### Requirements
```bash
apt install git build-essential libgtk2.0-dev libgnome2-dev libsdl2-dev libsdl2-ttf-dev gcc-5 g++-5
```

- If needed
```bash
update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-5 50
update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-5 50
```

- QT5
```bash
wget http://download.qt.io/official_releases/online_installers/qt-unified-linux-x64-online.run
chmod +x qt-unified-linux-x64-online.run
sudo ./qt-unified-linux-x64-online.run
sudo echo'/opt/Qt/5.6/gcc_64/lib' > vi /etc/ld.so.conf.d/qt5.conf
sudo ldconfig
```

```bash
vi makefile for /opt/Qt/...
```

- Python3 (Line 102)

```bash
vi makefile
```

```bash
PYTHON_EXECUTABLE = python3
```
