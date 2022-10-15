# Android Modding Guide

## Pixel 3

### Install ROM
1.  Download the ROM and boot image
2.  Flash the boot image → `fastboot flash boot boot.img`
3.  Wipe userdata (required for first installed)
4.  Reboot into fastbootd → `fastboot reboot fastboot`
5.  Use volume keys and power button to select “enter recovery”
6.  Select “apply update from ADB”
7.  Sideload the ROM zip → `adb sideload rom.zip`
8.  Reboot
    
### Dirty flash ROM update
Just skip the step “wipe userdata”


### Fastboot Commands
* Show connected devices → `fastboot devices`
* Show current slot → `fastboot getvar current-slot`
* Change active slot → `fastboot --set-active=b`
