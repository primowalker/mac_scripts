#!/bin/bash

# Test to see if files exist and, if so, copy them, the remove the originals

if ls /Users/jpwalker/Downloads/*.flv 1> /dev/null 2>&1; then 
	rsync -avP /Users/jpwalker/Downloads/*.flv /Volumes/Files/Dropbox/Misc/working/to_convert/
	rm /Users/jpwalker/Downloads/*.flv
else
	echo "No FLV files found"
fi

if ls /Users/jpwalker/Downloads/*.mp4 1> /dev/null 2>&1; then 
	rsync -avP /Users/jpwalker/Downloads/*.mp4  /Volumes/Files/Dropbox/Misc/working/incomming
	rm /Users/jpwalker/Downloads/*.mp4
else
	echo "No MP4 files found"
fi

if ls /Users/jpwalker/Downloads/*.wmv 1> /dev/null 2>&1; then 
	rsync -avP /Users/jpwalker/Downloads/*.wmv  /Volumes/Files/Dropbox/Misc/working/to_convert/
	rm /Users/jpwalker/Downloads/*.wmv
else
	echo "No WMV files found"
	fi
