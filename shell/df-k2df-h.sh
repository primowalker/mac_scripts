#!/bin/bash

ROOT_USED=`df -k | grep c1t0d0s0 | awk '{print $3}'`
iROOT_USED=`expr $ROOT_USED / 1024`
ROOT_AVAIL=`df -k | grep c1t0d0s0 | awk '{print $4}'`
iROOT_AVAIL=`expr $ROOT_AVAIL / 1024`
ROOT_CAP=`df -k | grep c1t0d0s0 | awk '{print $5}'`
iROOT_CAP=`expr $ROOT_CAP / 1024`
ROOT_MOUNT=`df -k | grep c1t0d0s0 | awk '{print $6}'`
iROOT_MOUNT=`expr $ROOT_MOUNT / 1024`

EXHOME_USED=`df -k | grep c1t0d0s7 | awk '{print $3}'`
iEXHOME_USED=`expr $EXHOME_USED / 1024`
EXHOME_AVAIL=`df -k | grep c1t0d0s7 | awk '{print $4}'`
iEXHOME_AVAIL=`expr $EXHOME_AVAIL / 1024`
EXHOME_CAP=`df -k | grep c1t0d0s7 | awk '{print $5}'`
iEXHOME_CAP=`expr $EXHOME_CAP / 1024`
EXHOME_MOUNT=`df -k | grep c1t0d0s7 | awk '{print $6}'`
iEXHOME_MOUNT=`expr $EXHOME_MOUNT / 1024`

TEST_USED=`df -k | grep /dev/dsk/md/d0 | awk '{print $3}'`
iTEST_USED=`expr $TEST_USED / 1024`
TEST_AVAIL=`df -k | grep /dev/dsk/md/d0 | awk '{print $4}'`
iTEST_AVIL=`expr $TEST_AVIL / 1024`
TEST_CAP=`df -k | grep /dev/dsk/md/d0 | awk '{print $5}'`
iTEST_CAP=`expr $TEST_CAP / 1024`
TEST_MOUNT=`df -k | grep /dev/dsk/md/d0 | awk '{print $6}'`
iTEST_MOUNT=`expr $TEST_MOUNT / 1024`

echo "Filesystem        Used 	     Avail 	   Use%        Mounted on"
echo "/dev/dsk/c1t0d0s0 $iROOT_USED   $iROOT_AVAIL   $iROOT_CAP   $iROOT_MOUNT"
echo "/dev/dsk/c1t0d0s7 $iEXHOME_USED $iEXHOME_AVAIL $iEXHOME_CAP $iEXHOME_MOUNT"
echo "/dev/dsk/d0	$iTEST_USED   $iTEST_AVAIL   $iTEST_CAP   $iTEST_MOUNT"

