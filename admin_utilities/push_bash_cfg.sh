#!/usr/bin/env bash

function usage {
    echo
    echo -e "Usage: push_bash_cfg.sh <server name>"
    echo
    echo "Example - push_bash_cfg.sh n1pvir001"
    exit
}

if [ -n "$1" ]; then
    var="$1"
else
        usage
fi

server=$1

scp ~/configs/.bash* $server:~/
