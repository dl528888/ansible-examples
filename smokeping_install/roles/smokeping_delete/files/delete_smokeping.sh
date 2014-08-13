#!/bin/bash
. /etc/profile
#stop zabbix client service
ps -ef|grep FPing|grep -v grep|awk '{print $2}'|xargs kill -9 >>/dev/null 2>&1
#delete boot start
sed -i '/smokeping*/d' /etc/rc.local
#delete smokeping log 
rm -rf /var/log/smokeping.log
#delete install dir
rm -rf /usr/local/smokeping
rm -rf /tmp/$(basename $0)
echo -e "\033[1;32mSmokeping remove is success!\033[0m"
exit 0
