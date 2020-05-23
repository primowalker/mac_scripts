#!/usr/bin/env bash

if [ -n "$1" ]; then
        var="$1"
else
    echo
    echo "Usage: <upload_fdc_master_server.sh> <name>"
    echo
    echo "Example - upload_fdc_master_server.sh FDC_Master_Server_List.csv"
    exit
fi

file=$1

scp $file n1pvir001:/var/tmp/FDC_Master_Server_List.csv
scp $file n3pvir001:/var/tmp/FDC_Master_Server_List.csv
