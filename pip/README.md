# pip

## Upgrade all packages

```bash
pip list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip install -U
```

## Check dependencies of package

- For installed package
```
pip3 show PACKAGE
```

- For not-installed package
```
pip3 download PACKAGE -d ./tmp
```
