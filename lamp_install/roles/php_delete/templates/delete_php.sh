#!/bin/bash
/etc/init.d/php-fpm stop
chkconfig -del php-fpm
if [ -e "/lib64" ];then
	rm -rf /usr/lib64/libmcrypt.la
	rm -rf /usr/lib64/libmcrypt.so
	rm -rf /usr/lib64/libmcrypt.so.4
	rm -rf /usr/lib64/libmcrypt.so.4.4.8
	rm -rf /usr/lib64/libmhash.a
	rm -rf /usr/lib64/libmhash.la
	rm -rf /usr/lib64/libmhash.so
	rm -rf /usr/lib64/libmhash.so.2
	rm -rf /usr/lib64/libmhash.so.2.0.1
	rm -rf /usr/bin/libmcrypt-config
	rm -rf /lib64/libmysqlclient.so.18
else
	rm -rf /usr/lib/libmcrypt.la
	rm -rf /usr/lib/libmcrypt.so
	rm -rf /usr/lib/libmcrypt.so.4
	rm -rf /usr/lib/libmcrypt.so.4.4.8
	rm -rf /usr/lib/libmhash.a
	rm -rf /usr/lib/libmhash.la
	rm -rf /usr/lib/libmhash.so
	rm -rf /usr/lib/libmhash.so.2
	rm -rf /usr/lib/libmhash.so.2.0.1
	rm -rf /usr/bin/libmcrypt-config
	rm -rf /lib/libmysqlclient.so.18
fi
/sbin/ldconfig
rm -rf {{ php_dir }}/php-{{ php_version }}
rm -rf {{ php_dir }}/libevent-2.0.21 {{ php_dir }}/memcached-1.4.15 {{ php_dir }}/lib/
rm -rf /etc/init.d/php-fpm
