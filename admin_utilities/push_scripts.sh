#!/usr/bin/env bash

function usage {
    echo
    echo -e "Usage: push_script.sh <script> <remote location><server>"
    echo
    echo "Example - push_script.sh format_salt_output /home/x2linux/unix_sysadmin_scripts/ <server>"
    exit
}

if [ -n "$1" ]; then
    var="$1"
else
        usage
fi

if [ -n "$2" ]; then
    var="$2"
else
        usage
fi

if [ -n "$3" ]; then
    var="$3"
else
        usage
fi

file=$1
remote_location=$2
server=$3

scp ${file} ${server}:${remote_location}


