#!/bin/bash
/usr/bin/redis-cli -h {{ ansible_default_ipv4.address }} -p {{ redis_port }} shutdown
rm -rf /usr/bin/redis-server /usr/bin/redis-cli
rm -rf {{ redis_dir }}/redis-{{ redis_version }}
sed -i '/{{ redis_port }}*/d' /etc/rc.local
