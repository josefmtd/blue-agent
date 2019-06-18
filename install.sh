#!/bin/bash

DIR=`dirname $0`

# Install the dependencies
/usr/bin/apt update
/usr/bin/apt -y upgrade
/usr/bin/apt install -y bluez-tools

# Copy the services to systemd
/bin/cp "${DIR}/bluetooth.service" /lib/systemd/system/bluetooth.service
/bin/cp "${DIR}/blue-agent.service" /etc/systemd/system/blue-agent.service

# Add pi to the bluetooth user group
/usr/sbin/adduser pi bluetooth

# Copy the PIN configuration file
/bin/cp "${DIR}/pin.conf" /etc/bluetooth/pin.conf
/bin/chmod 600 /etc/bluetooth/pin.conf

# Reload the systemd daemon and add the services
/bin/systemctl daemon-reload
/bin/systemctl enable blue-agent.service
/bin/systemctl start blue-agent.service

# Reboot the system
echo "Rebooting the system, press CTRL-C to cancel"
/bin/sleep 5
/sbin/reboot

exit 0
