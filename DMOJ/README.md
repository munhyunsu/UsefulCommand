# DMOJ 설치 및 관리 매뉴얼
- [Github Repository](https://github.com/DMOJ/online-judge)
- [공식 문서](https://docs.dmoj.ca/#/)

## DMOJ 설치

### DMOJ Site 설정 on OS
- 사전 패키지 설치
```bash
apt update
apt install git gcc g++ make python3-dev python3-pip python3-venv libxml2-dev libxslt1-dev zlib1g-dev gettext curl redis-server vim build-essential
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

- Python dJango-based DMOJ 프로젝트 설정
```bash
python3 -m venv dmojsite
source dmojsite/bin/activate
```

```bash
git clone https://github.com/DMOJ/site.git
cd site
git checkout v?.?.? # check the stable version
git submodule init
git submodule update
```

```bash
pip3 install --upgrade pip wheel
pip3 install -r requirements.txt
pip3 install mysqlclient
```

```bash
cd dmoj
# https://github.com/DMOJ/docs/blob/master/sample_files/local_settings.py
wget https://raw.githubusercontent.com/DMOJ/docs/master/sample_files/local_settings.py
```

- dJango local\_settings.py 설정 **예시** (_개인적인 설정이였으니 참고만 할 것_)
```python
# Line 13
SECRET_KEY = '<http://www.miniwebtool.com/django-secret-key-generator/>'
# Line 21
ALLOWED_HOSTS = ['*'] # until DEBUG = False
# Line 42
        'PASSWORD': '<password>'
# Line 57
## https://www.gnu.org/software/gettext/manual/gettext.html
LANGUAGE_CODE = 'ko-KR'
## https://en.wikipedia.org/wiki/List_of_tz_database_time_zones
DEFAULT_USER_TIME_ZONE = 'Asia/Seoul'
# Line 110
   ('Your Name', 'your.email@example.com'),
# Line 139 ~ 142
SITE_NAME = 'DMOJ'
SITE_LONG_NAME = 'DMOJ: Modern Online Judge'
SITE_ADMIN_EMAIL = 'admin@example.com'
# Line 271
            'filename': '<desired bridge log path>'
```

```bash
cd .. # /home/code/site/
python3 manage.py check
```

- Compile assets
```bash
./make_style.sh
python3 manage.py collectstatic
python3 manage.py compilemessages
python3 manage.py compilejsi18n
```

- Database setup
```bash
python3 manage.py migrate
```
