#!/usr/bin/env bash


function usage {
    echo
    echo -e "Usage: push_config <server>"
    echo
    echo "Example - push_config n1pvir001"
    exit
}

if [ -n "$1" ]; then
    var="$1"
else
        usage
fi

server=$1

scp ~//configs/authorized_keys $server:~/.ssh/
scp ~//configs/.bash* $server:~/