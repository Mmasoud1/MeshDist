#!/bin/sh
# Set DNS server
echo "nameserver 8.8.8.8" > /etc/resolv.conf

# Verify network connectivity
apt-get update && apt-get install -y iputils-ping dnsutils
ping -c 4 google.com
nslookup google.com
