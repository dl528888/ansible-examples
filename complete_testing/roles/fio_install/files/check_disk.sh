#!/bin/bash
awk -v result=`df -h|egrep -Ev '(Filesystem|shm|boot|mapper|devtmpfs|/$)'|awk '{print $NF}'|head -n 1`  'BEGIN{if(result=="") {print "/tmp"} else {print result}}'
