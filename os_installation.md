# OS Installation

## Tools

|Host OS| Target OS | Tools |
|--|--|--|
| Windows | Windows | [https://rufus.ie/](https://rufus.ie/) |
| Linux | Windows | [https://github.com/slacka/WoeUSB](https://github.com/slacka/WoeUSB)**
| Linux/Windows/MacOs | Linux | [https://www.balena.io/etcher/](https://www.balena.io/etcher/) |

** Use this command 

```
sudo woeusb \
    --target-filesystem NTFS \
    --device Win10_1809Oct_v2_EnglishInternational_x64.iso /dev/sdX
```