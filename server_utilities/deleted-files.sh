#!/bin/sh

# List deleted but still open files on the given filesystems

# -----------------------------------------------------------------------------

fs_procs()
{
	# List processes using a filesystem
	#
	# Different OS's have different support for running fuser with and w/o
	# the '-c' option against directories, mount points, and mount devices.

	case `uname -r` in
		5.10)
			mnts=`df -k $@ | awk '($1 != "Filesystem") { print $NF}'`
			pids=`fuser -c $mnts 2>/dev/null` ;;
		*)
			devs=`df -k $@ | awk '($1 != "Filesystem") { print $1}'`
			pids=`fuser $devs 2>/dev/null` ;;
	esac
	if [ -z "$pids" ]; then
		: echo "`basename $0`: No processes are using the $@ filesystem(s)." >&2
	else
		# ps -fp "$pids"
		echo $pids
	fi
}


# -----------------------------------------------------------------------------

get_tmpfs_dev()
{
	(
		touch /tmp/t
		sleep 30 < /tmp/t > /dev/null 2>&1 &
		pid=$!
		tmpfs_dev=`pfiles $pid | sed -n -e 's/ ino:.*$//' -e '/^[       ]*0:/s/^.*dev://p'`
		kill $pid
		echo $tmpfs_dev
	) 2>/dev/null	# lose the "<pid> terminated" message
}

# -----------------------------------------------------------------------------

# First, find the relevent processes

# devs=`df -k $@ | awk '($1 != "Filesystem") { print $1}'`
# pids=`fuser $devs 2>/dev/null`
pids=`fs_procs "$@"`
if [ -z "$pids" ]; then
	echo "`basename $0`: No processes are using the $@ filesystem(s)." >&2
	exit 1
fi

cd /proc || exit 1
find $pids -type f -links 0

# TODO: examine fds via "pfiles" and match FS devs against those specified
# on the command line
