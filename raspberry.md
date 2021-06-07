# Raspberry Pi

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