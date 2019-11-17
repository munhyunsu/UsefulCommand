# Domjudge management

## To resolve Internal Error HTTP 500
- To get problem status
```bash
service domjudge-judgehost status
```

### MySQL Error
- To get problem status
  - Failure to launch
  ```bash
  service mysql status
  ```

- Remove mysql lock
```bash
rm -rvf /var/lib/mysql/ib_logfile*
touch /var/lib/mysql/mysql.sock
touch /vat/lib/mysql/mysql.pid
chown -R mysql:mysql /var/lib/mysql
service mysql restart
```

