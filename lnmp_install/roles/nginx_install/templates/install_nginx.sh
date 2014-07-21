#!/bin/bash
if [ `grep -c "^{{ nginx_user }}" /etc/passwd` -eq 0 ];then
    echo "adding nginx user {{ nginx_user }}"
    if [ $(grep -i -c "ubuntu" /etc/issue) = 1 ];then
        /usr/sbin/useradd {{ nginx_user }} -M -s /usr/sbin/nologin
    else
        /usr/sbin/useradd {{ nginx_user }} -M -s /sbin/nologin
    fi
else
    echo "nginx user {{ nginx_user }} is exist"
fi

mkdir -p /usr/local/nginx-{{ nginx_version }}/conf/vhost
mkdir -p {{ nginx_web_dir }}/vhost/
mkdir -p {{ nginx_web_dir }}/logs/
chown -R {{ nginx_user }} :{{ nginx_user }}  {{ nginx_web_dir }}
cat > {{ nginx_web_dir }}/vhost/index.html << EOF
nginx {{ nginx_version }} in {{ ansible_default_ipv4.address }} is succefully
EOF
chmod +x /etc/init.d/nginx
rm -rf /tmp/$(basename $0)
echo "nginx install success!"
