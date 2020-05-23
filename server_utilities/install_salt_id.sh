#!/usr/bin/env bash
#
# Install the salt_id.json file into /opt/admin/etc

# Create /opt/admin/etc/ if it doesn't exist
if [ ! -d /opt/admin/etc ];then
    mkdir -p /opt/admin/etc
fi

# If /tmp/salt_id.json exist then copy it to /opt/admin/etc
if [ ! -d /tmp/salt_id.json ];then
    echo "/tmp/salt_id.json does not exist"
else
    cp /tmp/salt_id.json /opt/admin/etc/
fi

# Display the salt_id.json file
ls -l /opt/admin/etc/salt_id.json

