# Raspberry

### Resouce
* [Tech spec](https://www.raspberrypi.org/products/raspberry-pi-4-model-b/specifications/)

#### Blog
* [Jeff Geerling](https://www.jeffgeerling.com/blog)
* [The Smart Home Journey](https://thesmarthomejourney.com/2020/05/11/guide-zigbee2mqtt/)
* [Not Enough Tech](https://notenoughtech.com/home-automation/ikea-tradfri-socket-in-nodered/)


#### Guide
```sh
# Connect through ssh
ssh pi@raspberrypi.local

# Config
sudo raspi-config

# Enable vnc
1. Go to raspi-config > Interface > Enable vnc
2. type `vncserver`

# Enable vn autostart at boot
cd ~
cd .config
mkdir autostart
cd autostart
nano tightvnc.desktop

# Add this text
[Desktop Entry]
Type=Application
Name=TightVNC
Exec=vncserver :1
StartupNotify=false
```