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
        echo Usage: "dansguardian_blocked.sh <site>"
        echo 
        echo Example - dansguardian_blocked.sh "www.myspace.com"
        exit
    fi

#Make backups of the files first
#cp /etc/dansguardian/lists/bannedsitelist /etc/dansguardian/lists/bannedsitelist.$TODAY
#cp /etc/dansguardian/lists/bannedurllist /etc/dansguardian/lists/bannedurllist.$TODAY
#cp /etc/dansguardian/lists/domains /etc/dansguardian/lists/domains.$TODAY
#cp /etc/dansguardian/lists/domains.processed /etc/dansguardian/listsdomains.processed.$TODAY
#cp /etc/dansguardian/lists/urls /etc/dansguardian/lists/urls.$TODAY
cp /etc/dansguardian/lists/blacklists/userdefined/domains /etc/dansguardian/lists/blacklists/userdefined/domains.$TODAY
cp /etc/dansguardian/lists/blacklists/userdefined/domains.processed /etc/dansguardian/lists/blacklists/userdefined/domains.processed.$TODAY
cp /etc/dansguardian/lists/blacklists/userdefined/urls /etc/dansguardian/lists/blacklists/userdefined/urls.$TODAY

#Add the banned site to the files
#echo $1 >> /etc/dansguardian/lists/bannedsitelist
#echo $1 >> /etc/dansguardian/lists/bannedurllist
#echo $1 >> /etc/dansguardian/lists/domains
#echo $1 >> /etc/dansguardian/lists/domains.processed
#echo $1 >> /etc/dansguardian/lists/urls
echo $1 >> /etc/dansguardian/lists/blacklists/userdefined/domains
echo $1 >> /etc/dansguardian/lists/blacklists/userdefined/domains.processed
echo $1 >> /etc/dansguardian/lists/blacklists/userdefined/urls

#Restart Dansguardian
/etc/init.d/dansguardian restart
