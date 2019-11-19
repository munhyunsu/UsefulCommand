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

