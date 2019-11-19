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



