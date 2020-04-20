# pip

## Upgrade all packages
  ```bash
  pip list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip install -U
  ```

## Check dependencies of package
  ```
  pip show PACKAGE
  ```

