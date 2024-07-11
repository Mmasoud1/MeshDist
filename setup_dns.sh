#!/bin/sh
# Set DNS server
echo "nameserver 8.8.8.8" > /etc/resolv.conf

# Verify network connectivity
apt-get update && apt-get install -y iputils-ping dnsutils
echo "Pinging google.com..."
ping -c 4 google.com || { echo "Ping failed"; exit 1; }
echo "Performing nslookup for google.com..."
nslookup google.com || { echo "Nslookup failed"; exit 1; }

# Log network configuration
echo "Logging network configuration..."
ip addr show
cat /etc/resolv.conf
