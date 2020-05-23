#!/usr/bin/env bash

mv /srv/www/htdocs/UnixOps/FDC_Master_Server_List.csv /srv/www/htdocs/UnixOps/FDC_Master_Server_List.csv.bak
cp /var/tmp/FDC_Master_Server_List.csv /srv/www/htdocs/UnixOps/
chmod 644 /srv/www/htdocs/UnixOps/FDC_Master_Server_List.csv
