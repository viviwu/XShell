## Install MySQL(MariaDB) on CentOS7-amd64 

### prepare for mariadb10.4 as mysql5.7
```
vi /etc/yum.repos.d/mariadb.repo

[mariadb]
name = MariaDB
baseurl = http://yum.mariadb.org/10.4/centos7-amd64
gpgkey=https://yum.mariadb.org/RPM-GPG-KEY-MariaDB
gpgcheck=1
```

### install
```
yum install MariaDB-server MariaDB-client
```

### start
```
systemctl start mariadb
```

### auto run on boot
```
systemctl enable mariadb
```

### init && set root passwd
```
mysql_secure_installation
```

### optional config 1
```
vi /etc/my.cnf
[mysqld]
default-storage-engine = innodb
innodb_file_per_table
max_connections = 4096
collation-server = utf8_general_ci
character-set-server = utf8
 
vi /etc/my.cnf.d/client.cnf
[mysql]
default-character-set=utf8
 
vi /etc/my.cnf.d/mysql-clients.cnf
[mysql]
default-character-set=utf8
```


```
[mysqld]
# 开启远程访问
bind-address=0.0.0.0
skip-networking=0

# 设置3306端口
port=3306
# 设置mysql的安装目录
basedir=E:\\software\\mysql\\mysql-8.0.11-winx64   # 切记此处一定要用双斜杠\\，单斜杠我这里会出错，不过看别人的教程，有的是单斜杠。自己尝试吧
# 设置mysql数据库的数据的存放目录
datadir=E:\\software\\mysql\\mysql-8.0.11-winx64\\Data   # 此处同上
# 允许最大连接数
max_connections=200
# 允许连接失败的次数。这是为了防止有人从该主机试图攻击数据库系统
max_connect_errors=10
# 服务端使用的字符集默认为UTF8
character-set-server=utf8
# 创建新表时将使用的默认存储引擎
default-storage-engine=INNODB
# 默认使用“mysql_native_password”插件认证
default_authentication_plugin=mysql_native_password
[mysql]
# 设置mysql客户端默认字符集
default-character-set=utf8
[client]
# 设置mysql客户端连接服务端时默认使用的端口
port=3306
default-character-set=utf8
```
systemctl restart mariadb

### uninstall
yum remove mariadb-server mariadb-client

mysql --help | grep Distrib

select version(); 

status;

show databases;

use mysql;
  
show tables;

select user,host,authentication_string from mysql.user;

### for 5.7+
```
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'wxw.8899' WITH GRANT OPTION;

FLUSH PRIVILEGES; 
```

### for 8.0+
```
CREATE USER 'root'@'%' IDENTIFIED BY 'wxw.8899';
grant all privileges on *.* to 'root'@'%' ;
```

systemctl stop firewalld
