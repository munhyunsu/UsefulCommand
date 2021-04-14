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
  du -sh .[!.]* * >(grep -v 'Permission denied') | sort -h
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
