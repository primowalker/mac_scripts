#!/bin/bash

ROOT_USED=`df -k | grep sda1 | awk '{print $3}'`
echo ROOT_USED is $ROOT_USED
iROOT_USED=`expr $ROOT_USED / 1024`
ROOT_AVAIL=`df -k | grep sda1 | awk '{print $4}'`
echo ROOT_AVAIL is $ROOT_AVAIL
iROOT_AVAIL=`expr $ROOT_AVAIL / 1024`
ROOT_CAP=`df -k | gre
p sda1 | awk '{print $5}'`
echo ROOT_CAP is $ROOT_CAP
ROOT_MOUNT=`df -k | grep sda1 | awk '{print $6}'`
echo ROOT_MOUNT is $ROOT_MOUNT

echo iROOT_USED is $iROOT_USED
echo iROOT_AVAIL is $iROOT_AVAIL

echo "Filesystem Used         Avail         Capcity % Mounted on"
echo "/dev/sda1  $iROOT_USED  $iROOT_AVAIL  $ROOT_CAP $ROOT_MOUNT"
