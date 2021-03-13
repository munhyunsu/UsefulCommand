# MariaDB Installation

## Running MariaDB on Docker

- [Docker Hub Reference](https://hub.docker.com/_/mariadb)

```bash
docker run --net some-network --name some-mariadb -e MYSQL_ROOT_PASSWORD=my-secret-pw -d mariadb:tag
```

## Export Database on Docker

```bash
docker exec CONTAINER /usr/bin/mysqldump --max_allowed_packet=1G -u root --password=PASSWORD DATABASE > backup.sql
```
