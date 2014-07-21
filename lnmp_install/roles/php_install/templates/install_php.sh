#!/bin/bash
check_system_lib=$(grep -c "/usr/local/lib/" /etc/ld.so.conf)
if [ $check_system_lib -eq 0 ];then
    echo "/usr/local/lib/" >>/etc/ld.so.conf
fi
check_mysql_lib=$(grep -c "{{ mysql_basedir }}/lib/" /etc/ld.so.conf)
if [ $check_mysql_lib -eq 0 ];then
    echo "{{ mysql_basedir }}/lib/" >>/etc/ld.so.conf
fi
if [ -e "/lib64" ];then
    ln -s /usr/local/lib/libmcrypt.la /usr/lib64/libmcrypt.la
    ln -s /usr/local/lib/libmcrypt.so /usr/lib64/libmcrypt.so
    ln -s /usr/local/lib/libmcrypt.so.4 /usr/lib64/libmcrypt.so.4
    ln -s /usr/local/lib/libmcrypt.so.4.4.8 /usr/lib64/libmcrypt.so.4.4.8
    ln -s /usr/local/lib/libmhash.a /usr/lib64/libmhash.a
    ln -s /usr/local/lib/libmhash.la /usr/lib64/libmhash.la
    ln -s /usr/local/lib/libmhash.so /usr/lib64/libmhash.so
    ln -s /usr/local/lib/libmhash.so.2 /usr/lib64/libmhash.so.2
    ln -s /usr/local/lib/libmhash.so.2.0.1 /usr/lib64/libmhash.so.2.0.1
    ln -s /usr/local/bin/libmcrypt-config /usr/bin/libmcrypt-config
    ln -s {{ mysql_basedir }}/lib/libmysqlclient.so.18 /lib64/libmysqlclient.so.18
else
    ln -s /usr/local/lib/libmcrypt.la /usr/lib/libmcrypt.la
    ln -s /usr/local/lib/libmcrypt.so /usr/lib/libmcrypt.so
    ln -s /usr/local/lib/libmcrypt.so.4 /usr/lib/libmcrypt.so.4
    ln -s /usr/local/lib/libmcrypt.so.4.4.8 /usr/lib/libmcrypt.so.4.4.8
    ln -s /usr/local/lib/libmhash.a /usr/lib/libmhash.a
    ln -s /usr/local/lib/libmhash.la /usr/lib/libmhash.la
    ln -s /usr/local/lib/libmhash.so /usr/lib/libmhash.so
    ln -s /usr/local/lib/libmhash.so.2 /usr/lib/libmhash.so.2
    ln -s /usr/local/lib/libmhash.so.2.0.1 /usr/lib/libmhash.so.2.0.1
    ln -s /usr/local/bin/libmcrypt-config /usr/bin/libmcrypt-config
    ln -s {{ mysql_basedir }}/lib/libmysqlclient.so.18 /lib/libmysqlclient.so.18
fi
/sbin/ldconfig
