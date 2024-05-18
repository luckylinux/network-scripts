#!/bin/bash

# Define Gateway
gateway="192.168.1.1"

# Define Interface
interface="eth0"

# Attempt to Ping Gateway
ping -c4 $gateway > /dev/null

# If Ping is NOT successful, then Restart Network Interface
if [ $? != 0 ]
then
  echo "No network connection, restarting $interface"
  /sbin/ifdown "$interface"
  sleep 5
  /sbin/ifup --force "$interface"
fi
