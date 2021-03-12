# MariaDB Installation

## Running MariaDB on Docker

## Export Database on Docker

```bash
docker exec CONTAINER /usr/bin/mysqldump --max_allowed_packet=1G -u root --password=PASSWORD DATABASE > backup.sql
```
