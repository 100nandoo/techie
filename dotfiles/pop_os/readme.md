# Readme

## How to Backup & Restore Gnome Keybinding

#### Backup
```bash
dconf dump '/org/gnome/desktop/wm/keybindings/' > keybindings.dconf
dconf dump '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/' > custom-keybindings.dconf
```
#### Restore
```bash
dconf load '/org/gnome/desktop/wm/keybindings/' < keybindings.dconf
dconf load '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/'
```

## Backup Pop OS
```bash
# Backup
dconf dump / > "$(date -I)"_pop-os-desktop

# Restore
dconf load / < pop-os-desktop

# Reset
dconf reset -f /
```
