# Linux Mint
## Disable Win+Num Hotkey
```sh
# Open folder
cd /usr/share/cinnamon/applets/grouped-window-list@cinnamon.org

# Open applet config file
code /usr/share/cinnamon/applets/grouped-window-list@cinnamon.org/applet.js

# Commment this
bindAppKey(i) {
    Main.keybindingManager.addHotKey('launch-app-key-' + i, '<Super>' + i, () => this.onAppKeyPress(i));
}
```