#!/bin/bash
#1. grant user for slave in master
{{ mysql_basedir }}/bin/mysql -h localhost -u {{ mysql_database_user }} -P {{ mysql_port }} -p{{ mysql_passwd }} -e "grant all on *.* to {{ mysql_database_user }}@'{{ mysql_slave_ip }}' identified by '{{ mysql_passwd }}' with grant option;"
{{ mysql_basedir }}/bin/mysql -h localhost -u {{ mysql_database_user }} -P {{ mysql_port }} -p{{ mysql_passwd }} -e "flush privileges;"
