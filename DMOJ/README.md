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
pip3 install mysqlclient redis
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
# Line 194 ~ 195
CELERY_BROKER_URL = 'redis://localhost:6379'
CELERY_RESULT_BACKEND = 'redis://localhost:6379'
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

- Create initial data
```bash
python3 manage.py loaddata navbar
python3 manage.py loaddata language_all
python3 manage.py createsuperuser
```

- Run redis
```
systemctl start redis-server
systemctl status redis-server
```

- Run the server with DEBUG
```bash
python3 manage.py runserver 0.0.0.0:8000
```

- Test for productions
```bash
python3 manage.py runbridged
celery -A dmoj_celery worker
```

### DMOJ Site production mode

- uwsgi.ini, site.conf, bridged.conf, celery.conf 설정

  - 설정 파일 다운로드
  ```bash
  mkdir conf
  cd conf

  # https://github.com/DMOJ/docs/blob/master/sample_files/uwsgi.ini
  wget https://raw.githubusercontent.com/DMOJ/docs/master/sample_files/uwsgi.ini

  # https://github.com/DMOJ/docs/blob/master/sample_files/site.conf
  wget https://raw.githubusercontent.com/DMOJ/docs/master/sample_files/site.conf

  # https://github.com/DMOJ/docs/blob/master/sample_files/bridged.conf
  wget https://raw.githubusercontent.com/DMOJ/docs/master/sample_files/bridged.conf

  # https://github.com/DMOJ/docs/blob/master/sample_files/celery.conf
  wget https://raw.githubusercontent.com/DMOJ/docs/master/sample_files/celery.conf

  # https://github.com/DMOJ/docs/blob/master/sample_files/nginx.conf
  wget https://raw.githubusercontent.com/DMOJ/docs/master/sample_files/nginx.conf

  # https://github.com/DMOJ/docs/blob/master/sample_files/wsevent.conf
  wget https://raw.githubusercontent.com/DMOJ/docs/master/sample_files/wsevent.conf
  ```


  - uwsgi.ini
  ```
  # Line 12~14
  chdir = /home/code/site
  pythonpath = /home/code/site
  virtualenv = /home/code/dmojsite
  ```

  - site.conf
  ```
  # Line 2~3
  command=/home/code/dmojsite/bin/uwsgi --ini uwsgi.ini
  directory=/home/code/site
  ```

  - bridged.conf
  ```
  # Line 2~7
  command=/home/code/dmojsite/bin/python manage.py runbridged
  directory=/home/code/site$
  user=code
  group=code
  ```

  - celery.conf
  ```
  # Line 2~7
  command=/home/code/dmojsite/bin/celery -A dmoj_celery worker
  directory=/home/code/site$
  user=code
  group=code
  ```

  - nginx.conf
  ```
  # Line 10
  #server_name <hostname>;
  # Line 21
          root /home/code/site;
  # Line 25
          root /home/code/site/resources/icons
  # Line 41
          root /tmp;
  # Line 66~77
  ## Uncomments
  # Line 67
          proxy_pass http://127.0.0.1:15100/;
  # Line 76
          proxy_pass http://127.0.0.1:15102;
  ```

  - wsevent.conf
  ```
  # Line 2~6
  command=/usr/bin/node /home/code/site/websocket/daemon.js
  environment=NODE_PATH="/home/code/site/node_modules"
  user=code
  group=code
  ```

  - site/dmoj/localsettings.py
  ```python
  # Line 167
  EVENT_DAEMON_USE = True
  # Line 173
  EVENT_DAEMON_POST = 'ws://127.0.0.1:15101/event/'
  # Line 183~185
  EVENT_DAEMON_GET = 'ws://127.0.0.1:15100/event/'
  EVENT_DAEMON_GET_SSL = 'wss://127.0.0.1:15100/event/'
  EVENT_DAEMON_POLL = '/channels/'
  ```

  - site/websocket/config.js
  ```
  module.exports = {
    get_host: '127.0.0.1',
    get_port: 15100,
    post_host: '127.0.0.1',
    post_port: 15101,
    http_host: '127.0.0.1',
    http_port: 15102,
    long_poll_timeout: 29000,
  };
  ```

```bash
pip3 install uwsgi
uwsgi --ini uwsgi.ini
```

- supervisord 설치
```bash
apt install supervisor
```

- Link conf files
```bash
ln -s /home/code/site/conf/site.conf /etc/supervisor/conf.d/
ln -s /home/code/site/conf/bridged.conf /etc/supervisor/conf.d/
ln -s /home/code/site/conf/celery.conf /etc/supervisor/conf.d/
```

- nginx 설치
```bash
apt install nginx
```

- nginx.conf
```
rm /etc/nginx/sites-enabled/default
ln -s /home/code/site/conf/nginx.conf /etc/nginx/sites-available/dmojsite
ln -s /etc/nginx/sites-available/dmojsite /etc/nginx/sites-enabled/
```

- event server
```bash
npm install qu ws simplesets
pip3 install websocket-client
```


# Online judges

## JAVA11

```bash
apt install openjdk-11-jdk
```

## Python3

```bash
wget https://www.python.org/ftp/python/3.9.1/Python-3.9.1.tar.xz
apt install libbz2-dev libcurses-ocaml-dev libdbm-deep-perl libgdbm-dev liblzma-dev libsqlite3-dev libssl-dev libreadline-dev zlib1g-dev libtk-img-dev libffi-dev
tar -xvf Python-3.9.1.tar.xz
cd Python-3.9.1
./configure --prefix=/opt/Python3 --enable-optimizations
```

## Online judge

```bash
apt install python3-dev python3-pip build-essential libseccomp-dev
pip3 install dmoj
```
