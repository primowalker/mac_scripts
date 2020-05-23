#!/bin/bash

# Set the hostname
HOST=`hostname`

check_dups () {
    fs=$1
    dups=`grep $is /etc/fstab | grep -v \# | grep -v swap | sort | uniq -d | awk '{print $2}'`
    if [ ! -z "$dups" ];then
        echo "$HOST,$is,Duplicate Entry in /etc/fstab"
    fi
    if [ -z "$dups" ];then
        echo "$HOST,$is,Only found in /etc/fstab"
    fi
}

# Check to see if an older output file exists
if [ -f "/root/FS_Check" ];then
    rm -f /root/FS_Check
fi

# Make sure df isn't hanging
host=`hostname`
/usr/bin/timeout 5 df > /dev/null
out=$?
if [ $out -eq 124 ];then
        echo "$host,df hanging!"
                exit
fi

# Get the currently mounted file systems
if [ -f "/usr/bin/timeout" ];then
    /usr/bin/timeout 5 df -hPT | grep -v Filesystem | grep -v '/dev$'| grep -Ev '(rootfs|swap|shm|floppy|/run|sys|udev|Filesystem|nfs|secfs2|cifs)' | awk '{print $7}' | sort  > /root/df-hP.out
else
    df -hPT | grep -Ev '(rootfs|swap|shm|floppy|/run|udev|Filesystem|nfs|secfs2|cifs)' | awk '{print $7}' | sort  > /root/df-hP.out
fi

# Get info from /etc/fstab
cat /etc/fstab | sort | grep -Evw '(pts|proc|shm|floppy|swap|/sys|nfs|cifs|/media|/mnt)' | grep -v \# | sed '/^\s*$/d' | awk '{print $2}' | sort > /root/fstab.out

# Do a standard diff of df and fstab.outputs and save it to a file
# diff /root/df-hP.out /root/fstab.out | grep -v "^---" | grep -v "^[0-9c0-9]" >> /root/FS_Check
diff df-hP.out fstab.out | grep -v "^---" | grep -v "^[0-9c0-9]" | sed 's/<//g' | sed 's/>//g' | sort | uniq >> /root/FS_Check

# Get output
output=`cat /root/FS_Check`

for i in $output;do
        fstab_count=`grep $i /etc/fstab | wc -l`
        fstab_out=`grep $i /etc/fstab | awk '{print $2}'`
                if [ -z "$fstab_out" ];then
                        fstab_status="Not in /etc/fstab"
                else
                        fstab_status="In /etc/fstab"
                fi

                df_out=`df -hP | grep $i | awk '{print $6}'`
                if [ -z "$df_out" ];then
                        df_status="Not mounted"
                else
                        df_status="Is mounted"
                fi
                # Output the results
                echo "$HOST,$i,$fstab_status,$fstab_count,$df_status"
done
#for i in $output;do
#    [[ $(diff /root/df-hP.out /root/fstab.out | grep -v "^---" | grep -v "^[0-9c0-9]" | awk '{print $1}') =~ "<" ]] || check_dups ${i}
#    [[ $(diff /root/df-hP.out /root/fstab.out | grep -v "^---" | grep -v "^[0-9c0-9]" | awk '{print $1}') =~ ">" ]] || echo "$HOST,$i,only found in df output"
#done
