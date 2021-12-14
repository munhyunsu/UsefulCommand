## Installation

### Download install-tl.zip

- [Official site](https://www.tug.org/texlive/)

### Launch the installer

```bash
sudo ./install-tl -gui
```

- Open advanced options

```
Installation root: /usr/local/texlive/20xx/
TEXMFHOME: ~/.texmf
```

## Configuration

### Set global environmnet variables

```bash
sudo vi /etc/profile.d/texlive.sh
```

```bash
if [ -d "/usr/local/texlive/2020/bin/x86_64-linux" ] ; then
    PATH="/usr/local/texlive/2020/bin/x86_64-linux:$PATH"
    MANPATH="/usr/local/texlive/2020/texmf-dist/doc/man:$MANPATH"
    INFOPATH="/usr/local/texlive/2020/texmf-dist/doc/info:$INFOPATH"
fi
```

## Commands

### Execute tlmgr on usermode using custom installed TexLive

```bash
sudo tlmgr --gui --usermode --usertree /usr/local/texlive/2020
```

### Compile tex
