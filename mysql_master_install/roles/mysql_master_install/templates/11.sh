#!/bin/bash
{{ mysql_basedir }}/bin/mysql -h localhost -u {{ mysql_database_user }} -P {{ mysql_port }} -S {{ mysql_sock }} -e "grant all privileges on *.* to {{ mysql_database_user }}@'localhost' identified by '{{ mysql_passwd }}' with grant option;"
{{ mysql_basedir }}/bin/mysql -h localhost -u {{ mysql_database_user }} -P {{ mysql_port }} -S {{ mysql_sock }} -e "grant PROCESS,REPLICATION CLIENT ON *.* TO 'zabbix'@'%' identified BY 'zabbix';"
{{ mysql_basedir }}/bin/mysql -h localhost -u {{ mysql_database_user }} -P {{ mysql_port }} -S {{ mysql_sock }} -e "flush privileges;"
{{ mysql_basedir }}/bin/mysql -h localhost -u {{ mysql_database_user }} -P {{ mysql_port }} -S {{ mysql_sock }} -e "delete from mysql.user where password='';"
{{ mysql_basedir }}/bin/mysql -h localhost -u {{ mysql_database_user }} -P {{ mysql_port }} -S {{ mysql_sock }} -e "drop database test;"
{{ mysql_basedir }}/bin/mysql -h localhost -u {{ mysql_database_user }} -P {{ mysql_port }} -S {{ mysql_sock }} -e "flush privileges;"
