#!/bin/bash
#0. create slave account in master
{{ mysql_basedir }}/bin/mysql -h {{ mysql_master_ip }} -u {{ mysql_database_user }} -P {{ mysql_port }} -p{{ mysql_passwd }} -e "GRANT REPLICATION SLAVE ON *.* to '{{ mysql_slave_user }}'@'{{ ansible_default_ipv4.address }}' identified by '{{ mysql_slave_passwd }}';"
{{ mysql_basedir }}/bin/mysql -h {{ mysql_master_ip }} -u {{ mysql_database_user }} -P {{ mysql_port }} -p{{ mysql_passwd }} -e "flush privileges;"
#1. get master log file and post in master
master_log=`{{ mysql_basedir }}/bin/mysql -h {{ mysql_master_ip }} -u {{ mysql_master_user }} -P {{ mysql_master_port }} -p{{ mysql_master_passwd }} -e "show master status;"`
master_file=`echo $master_log|awk '{print $5}'`
master_post=`echo $master_log|awk '{print $6}'`
#2. change master on slave 
{{ mysql_basedir }}/bin/mysql -h {{ ansible_default_ipv4.address }} -u {{ mysql_database_user }} -P {{ mysql_port }} -p{{ mysql_passwd }} -e "change master to master_host='{{ mysql_master_ip }}',master_user='{{ mysql_slave_user }}',master_password='{{ mysql_slave_passwd }}',master_log_file='${master_file}',master_log_pos=${master_post}; "
#3. start slave
{{ mysql_basedir }}/bin/mysql -h {{ ansible_default_ipv4.address }} -u {{ mysql_database_user }} -P {{ mysql_port }} -p{{ mysql_passwd }} -e "start slave;"
sleep 10
#4. check master and slave status
slave_result=`{{ mysql_basedir }}/bin/mysql -h {{ ansible_default_ipv4.address }} -u {{ mysql_database_user }} -P {{ mysql_port }} -p{{ mysql_passwd }} -e "show slave status\G"|grep -c "Yes"`
if [ $slave_result -eq 2 ];then
    exit 0
else
    exit 1
fi
