# blue-agent
Bluetooth Agent Service for Raspbian Stretch

This bluetooth agent service is based on the CLI tools provided by https://github.com/khvzak/bluez-tools

## How to use

Make sure you already have git installed on your Raspberry Pi

```
# apt install git
```

Clone the repository

```
$ git clone https://github.com/josefmtd/blue-agent
```

Run the install shell script

```
# /home/pi/blue-agent/install.sh
```

After rebooting the Raspberry Pi, it will be discoverable and pairable by the PIN of 270996. The PIN configuration can be changed by changing the file:

```
# nano /etc/bluetooth/pin.conf
```

Replace the PIN '270996' with other PIN that you want, or add a specific by using this format:
```
AA:BB:CC:DD:EE:FF 012345
RemoteDeviceName 543210
```
