#!/bin/bash

# Make sudo actually work
HOSTNAME=$(cat /etc/hostname)
echo "127.0.1.1 $HOSTNAME" >> /etc/hosts
hostname $HOSTNAME

if [ "$INITSYSTEM" != "on" ]; then
  /usr/sbin/sshd -p 80 &
fi

python /usr/src/app/main.py
