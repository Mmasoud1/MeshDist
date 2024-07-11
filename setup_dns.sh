#!/bin/sh
set -e

# Log the start of the script
echo "Running setup_dns.sh..."

# Set DNS server
echo "Setting DNS server to 8.8.8.8..."
echo "nameserver 8.8.8.8" > /etc/resolv.conf

# Verify network connectivity
echo "Updating package lists..."
apt-get update && apt-get install -y iputils-ping dnsutils || { echo "Failed to install networking tools"; exit 1; }

echo "Pinging google.com..."
ping -c 4 google.com || { echo "Ping to google.com failed"; exit 1; }

echo "Performing nslookup for google.com..."
nslookup google.com || { echo "Nslookup for google.com failed"; exit 1; }

# Log network configuration
echo "Logging network configuration..."
ip addr show || { echo "Failed to show IP address"; exit 1; }
cat /etc/resolv.conf || { echo "Failed to show resolv.conf"; exit 1; }

echo "setup_dns.sh completed successfully"

