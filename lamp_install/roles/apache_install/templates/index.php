<?php
$link = mysql_connect('{{ ansible_default_ipv4.address }}','zabbix','zabbix');
if ($link)
echo "Successs!!!Php install success!\n";
else
echo "Fail!!!Php install fail!\n";
mysql_close();
?>
