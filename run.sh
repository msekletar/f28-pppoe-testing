#!/bin/bash

set -e

echo "Starting virtual machines"
vagrant up --no-provision >vagrant.log

echo "Configuring PPPoE server"
vagrant provision server >server.config.log

echo "Configuring PPPoE client"
vagrant provision client >client.config.log

# pppd on server is a daemon, give it some time to setup connection
sleep 3

echo "Checking that ppp0 connection was established"
vagrant ssh client -c "ip link show ppp0"
