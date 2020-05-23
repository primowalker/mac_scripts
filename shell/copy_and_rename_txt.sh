#! /bin/bash
ORIG_FILE=`find /media/Extra/daddy/BBC_SHAKESPEARE_COLLECTION -name '*.txt' `
NEW_FILE=`find /media/Extra/daddy/BBC_SHAKESPEARE_COLLECTION -name '*.txt' | sed 's/)/-/g' | sed 's/_//'`

#echo $ORIG_FILE
#echo $NEW_FILE
for i in *.txt
do 
  j=`echo $i | sed 's/)/-/g' | sed 's/_//'`
  #mv $i $j 
done 
