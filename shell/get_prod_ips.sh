#!/bin/bash

sites=`cat sites`
rm prod_ips
for i in $sites;do
	prod=`grep $i webagent.conf | grep address | awk -F= '{print $2 " " $3}'`
	echo $prod >> prod_ips
 done
