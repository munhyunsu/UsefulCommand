# Bash

## Show disk usage
- Basic command
  ```bash
  du -sh ./*
  ```

- Sorted result command
  ```bash
  du -sh * | sort -h
  ```

- Sorted result with hidden direcotries command
  ```bash
  du -sh .[!.]* * | sort -h
  du -sh .[!.]* * 2> >(grep -v 'Permission denied') | sort -h
  ```

## Rename multiple files
- rename .jpeg to .jpeg
  ```bash
  rename 's/\.jpeg$/\.jpg/' *.jpeg
  ```

- remove blank in filename
  ```bash
  rename 's/\ //' ./*
  ```

## Count files in subdirectory
```bash
find -maxdepth 1 -type d | sort | while read -r dir; do n=$(find "$dir" -type f | wc -l); printf "%4d : %s\n" $n "$dir"; done
```

## X11 authrization of sudo
- [Ref](https://unix.stackexchange.com/questions/110558/su-with-error-x11-connection-rejected-because-of-wrong-authentication)
```bash
sudo su
xauth merge $HOME/.Xauthority
exit
```

## Check hardware Product Name
```bash
sudo dmidecode
```

## Mount CDROM (virtualbox guest addition)
```bash
sudo mkdir -p /media/cdrom
sudo mount -t iso9660 -o ro /dev/sr0 /media/cdrom
sudo umount /media/cdrom
sudo rmdir /media/cdrom
```

## Backlight adjustment

```bash
cat /sys/class/backlight/intel_backlight/brightness
echo 0 | sudo tee /sys/class/backlight/intel_backlight/brightness
```

## Check laptop lid status

```bash
cat /proc/acpi/button/lid/LID/state
```

## Check battery status

```bash
upower -i /org/freedesktop/UPower/devices/battery_BAT01
```

## Pulseaudio

### Microphone unmute
- If it is default device
```
pactl set-source-mute $(pactl info | grep "Default Source" | awk '{print $3;}') 0
```

## Special parameters

- (`$*`): Expands to the positional parameters, starting from one.
- (`$@`): Expands to the positional parameters, starting from one.
- (`$#`): Expands to the number of positional parameters in decimal.
- (`$?`): Expands to the exit status of the most recently executed foreground pipeline.
- (`$-`): Expands to the current option flags as specified upon invocation, by the set builtin command, or those set by the shell itself (such as the -i option).
- (`$$`): Expands to the process ID of the shell. In a () subshell, it expands to the process ID of the invoking shell, not the subshell.
- (`$!`): Expands to the process ID of the job most recently placed into the background, whether executed as an asynchronous command or using the bg builtin (see Job Control Builtins).
- (`$0`): Expands to the name of the shell or shell script.


# Sound redirect using ssh

- arecord [manual](https://linux.die.net/man/1/arecord)
- Sound quality [reference](https://trac.ffmpeg.org/wiki/audio%20types)

```bash
#!/bin/bash

if [ -z "$1" ];
    then
        BITRATE=16000
    else
        BITRATE=$1
fi

ssh IPADDRESS "arecord -f S16_LE -c 2 -r $BITRATE -B 10000" | mpv -
```

```bash
if [ -z "$1" ];
    then
        BITRATE=8000
    else
        BITRATE=$1
fi
echo "Bitrate is setted by $BITRATE"
if [ "$2" == "on" ] || [ "$2" == "ON" ];
    then
        GUI="--profile=pseudo-gui --geometry=360"
    else
        GUI=""
fi
echo "GUI is setted by $GUI"
ssh IPADDRESS "arecord -f S16_LE -c 2 -r $BITRATE -B 10000" | mpv $GUI -
```

### Auto startup application

- In crontab to system boot

- In startup application to user log-in

  - (LinuxMint) Startup application


## Infinity `command` loop

```bash
while [ 1 ]; do COMMAND; test $? -gt 128 && break; done
```

- [StackExchange](https://unix.stackexchange.com/questions/42287/terminating-an-infinite-loop)

## Remove matched line using (`sed`)

```bash
sed -i '/^cd/d' FILENAME
```
