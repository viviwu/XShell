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

### uninstall
yum remove mariadb-server mariadb-client
