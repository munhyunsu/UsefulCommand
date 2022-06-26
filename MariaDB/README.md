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

## Database disk path

```bash
docker run --name some-mariadb -v /my/own/datadir:/var/lib/mysql -e MARIADB_ROOT_PASSWORD=my-secret-pw -d mariadb:tag
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
docker exec -i CONTAINER bash -c 'exec mysql -uroot -p"$MYSQL_ROOT_PASSWORD" DATABASE' < backup.sql
```


# MariaDB Repository setup (for Connector/C)

- [MariaDB Repo Setup](https://mariadb.com/downloads/repo-setup/)

```bash
wget https://downloads.mariadb.com/MariaDB/mariadb_repo_setup
echo "d4e4635eeb79b0e96483bd70703209c63da55a236eadd7397f769ee434d92ca8  mariadb_repo_setup" | sha256sum -c -
chmod +x mariadb_repo_setup
sudo ./mariadb_repo_setup
```


