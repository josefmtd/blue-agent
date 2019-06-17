#!/bin/bash

DIR=`dirname $0`

# Install the dependencies
echo "Updating and installing the dependencies"
/usr/bin/apt update
/usr/bin/apt -y upgrade
/usr/bin/apt install -y bluez-tools

# Copy the services to systemd
echo "Copying the bluetooth agent service to systemd"
/bin/cp "${DIR}/bluetooth.service" /lib/systemd/system/bluetooth.service
/bin/cp "${DIR}/blue-agent.service" /etc/systemd/system/blue-agent.service

# Add pi to the bluetooth user group
echo "Adding the PI user account to bluetooth system group"
/usr/sbin/adduser pi bluetooth

# Copy the PIN configuration file
echo "Copying the bluetooth pin configuration file"
/bin/cp "${DIR}/pin.conf" /etc/bluetooth/pin.conf
/bin/chmod 600 /etc/bluetooth/pin.conf

# Copy the Bluez configuration file
/bin/cp main.conf /etc/bluetooth/main.conf

# Reload the systemd daemon and add the services
echo "Restarting the systemd daemon"
/bin/systemctl daemon-reload
/bin/systemctl enable blue-agent.service
/bin/systemctl start blue-agent.service

# Reboot the system
echo "Rebooting the system, press CTRL-C to cancel"
/bin/sleep 5
/sbin/reboot

exit 0
