### Linux OS Related Stuff

Ubuntu driver ppa: `sudo add-apt-repository ppa:graphics-drivers/ppa -y`

#### Backup KDE Plasma
```
note: I don't really use Plasma 5 yet but this looks correct

backup your plasma files, appears to be ~/.config/plasma* (this will also backup the plasma-workspace folder)

Code: Select all
tar -cf plasma-backup-`date +%Y-%m-%d--%H-%M` ~/.config/plasma*


to restore you would need to stop plasma and restore the backed up files

1) stop plasma
Code: Select all
kquitapp plasmashell

2) restore backed up files

3) restart plasma
Code: Select all
plasmashell
```
