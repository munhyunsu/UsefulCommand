# DMOJ 설치 및 관리 매뉴얼
- [Github Repository](https://github.com/DMOJ/online-judge)
- [공식 문서](https://docs.dmoj.ca/#/)

## DMOJ 설치

### DMOJ Site 설정 on OS
- 사전 패키지 설치
```bash
apt update
apt install git gcc g++ make python3-dev python3-pip libxml2-dev libxslt1-dev zlib1g-dev gettext curl redis-server vim build-essential
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
apt install nodejs
npm install -g sass postcss-cli postcss autoprefixer
```

- 데이터베이스 설치
```bash
apt update
apt install mariadb-server libmysqlclient-dev
mysql_secure_installation
```

- 데이터베이스 설정
```bash
mysql -uroot -p
```

```sql
CREATE DATABASE dmoj DEFAULT CHARACTER SET utf8mb4 DEFAULT COLLATE utf8mb4_general_ci;
GRANT ALL PRIVILEGES ON dmoj.* to 'dmoj'@'localhost' IDENTIFIED BY '<password>';
exit
```
