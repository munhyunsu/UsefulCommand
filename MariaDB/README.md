# MariaDB Installation

## Running MariaDB on Docker

- [Docker Hub Reference](https://hub.docker.com/_/mariadb)

```bash
docker run --network some-network --name some-mariadb -e MYSQL_ROOT_PASSWORD=my-secret-pw -d mariadb:tag
```

- If connect database viewer on Host

```
docker run --name some-mariadb -p 3306:3306 -e MYSQL_ROOT_PASSWORD=my-secret-pw -d mariadb 
```

- If import large database sql files

```
docker run --name some-mariadb -p 3306:3306 -e MYSQL_ROOT_PASSWORD=my-secret-pw -d mariadb --max_allowed_packet=1G
```

## Create Database and User

- Connect only local users

```sql
CREATE DATABASE DATABASENAME;
GRANT ALL PRIVILEGES ON DATABASENAME.* TO 'USERNAME'@'localhost' IDENTIFIED BY 'PASSWORD';
FLUSH PRIVILEGES;
```

- Remote users

```sql
CREATE DATABASE DATABASENAME;
GRANT ALL PRIVILEGES ON DATABASENAME.* TO 'USERNAME'@'%' IDENTIFIED BY 'PASSWORD';
FLUSH PRIVILEGES;
```

## Export Database on Docker

```bash
docker exec CONTAINER /usr/bin/mysqldump --max_allowed_packet=1G -u root --password=PASSWORD DATABASE > backup.sql
```

## Import Database on Docker

```bash
docker exec -i CONTAINER bash -c 'exec mysql -uroot -p"$MYSQL_ROOT_PASSWORD
```
```bash
docker exec -i CONTAINER mysql -u root -p=PASSWORD DATABASE < backup.sql
```

```bash
cat dump.sql | docker exec -i mysql-container mysql -uuser -ppassword db_name
```
