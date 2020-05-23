#! /bin/bash

for i in *.torrent 
do 
  transmissioncli $i
done 
