#!/bin/bash

TODAY=`date +%m-%d-%y`
USER=`whoami`

if [ $USER != "root" ];then
       echo "Sorry, you must run this using sudo."
       exit 1
fi

#Get the web site to block
 if [ -n "$1" ]; then
        var="$1"
    else
        echo
        echo Usage: "dansguardian_allowed.sh <site>"
        echo 
        echo Example - dansguardian_allowed.sh "www.cnn.com"
        exit
    fi

#Make backups of the files first
cp /etc/dansguardian/lists/exceptionfilesitelist /etc/dansguardian/lists/exceptionfilesitelist.$TODAY
cp /etc/dansguardian/lists/exceptionfileurllist /etc/dansguardian/lists/exceptionfileurllist.$TODAY
cp /etc/dansguardian/lists/exceptionsitelist /etc/dansguardian/lists/exceptionsitelist.$TODAY

#Add the banned site to the files
echo $1 >> /etc/dansguardian/lists/exceptionfilesitelist
echo $1 >> /etc/dansguardian/lists/exceptionfileurllist
echo $1 >> /etc/dansguardian/lists/exceptionsitelist

#Restart Dansguardian
/etc/init.d/dansguardian restart
