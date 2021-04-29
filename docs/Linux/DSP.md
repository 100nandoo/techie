# System wide audio DSP

[System Wide DSP Guide](https://github.com/bmc0/dsp/wiki/System-Wide-DSP-Guide)

```
INSTALL DEPENDENCIES

sudo apt-get update && sudo apt install build-essential pkg-config git ladspa-sdk fftw3 fftw3-dev libzita-convolver-dev 
sudo apt install libsndfile1 libsndfile1-dev libavcodec58 libavcodec-dev
sudo apt-get install libavcodec-dev --fix-missing
sudo apt-get install libavformat-dev libasound2-dev libao-common libao-dev libmad0-dev

# DEPENDENCY INSTALLATION COMPLETE. RUN DSP SETUP.
git clone https://github.com/bmc0/dsp.git
cd dsp
make
sudo make install
cd ..
mkdir ~/.config/ladspa_dsp/
sudo nano ~/.config/ladspa_dsp/config
add this ->  effects_chain=gain -3.0 lowshelf 90 0.9s +3.0
	
# INSTALLATION COMPLETE. TEST DSP.

Coffee.mp3 gain -15 lowshelf 160 0.5 +6.0
```

## Load DSP module
1. load from pulseaudio daemon, change `(module-name)`, you can list all available module `pacmd list-sinks` 
   How to choose? play music and, the one that has `running` status
```bash
pacmd load-module module-ladspa-sink sink_name=dsp master=(module-name) plugin=ladspa_dsp label=ladspa_dsp
```
2. Check whether the module load successfully
`pacmd list-sinks | grep dsp`
3. restart pulseaudio
`pulseaudio -k`
4. change default audio from your DE


## Load DSP on Startup
1. edit `/etc/pulse/default.pa` configuration file
2. add this
```
.ifexists module-ladspa-sink.so
.nofail
# this line is the same as the one on `Load DSP module` section
load-module module-ladspa-sink sink_name=dsp master=alsa_output.pci-0000_28_00.4.analog-stereo plugin=ladspa_dsp label=ladspa_dsp
.fail
.endif

# Sink index number can be seen on `pacmd list-sinks`
set-default-sink 2
```


### Config files:
```bash

# Beyerdynamic DT 770 80 Ohm #1
effects_chain=eq 20 1.28 3.3 eq 54 1.45 -3.3 eq 220 2.75 4.3 eq 3703 2.84 10.8 eq 18582 0.03 -4.5 eq 137 4.75 -1.4 eq 2254 2.98 -2.4 eq 2773 0.34 0.9 eq 7161 1.84 -3.8 eq 9225 1.26 2.8

# Brainwavz B400
effects_chain=eq 20 0.69 5.2 eq 207 0.54 -6.1 eq 2289 1.96 5.2 eq 5468 1.46 5.8 eq 12755 1.26 6.4 eq 879 2.94 1.8 eq 2333 1.58 0.7 eq 8435 5.68 -3.4 eq 9290 0.39 3.2 eq 16465 0.04 -2.3

# HiFi Tin T2
effects_chain=eq 29 0.53 6.4 eq 274 0.60 -4.2 eq 1932 2.11 2.0 eq 3726 2.69 3.9 eq 6217 3.58 6.3 eq 970 5.54 1.1 eq 9464 4.50 2.5 eq 19213 0.36 -2.2 eq 19858 0.32 -6.6
```
