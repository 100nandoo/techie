# Mac OS Related Stuff

### Setup HiDPi

1. Disable system integrity protection
2. Install [SwitchResX](http://www.madrau.com/srx_download/download.html)
3. Run [this script](https://github.com/xzhih/one-key-hidpi)

### My Brew Setup
```bash
brew install --cask google-chrome iterm2 telegram aldente visual-studio-code alfred gitkraken spotify maccy android-studio
```

### Fix Brew Permission
`sudo chown -R $(whoami) $(brew --prefix)/*`