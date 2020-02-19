# Enable High Quality Audio Linux

First you have to do little bit of tweaking of the Pulse configuration, to match your preference by creating the daemon.conf file in your home config directory:

```shell
nano ~/.config/pulse/daemon.conf
```

Or you can directly modify */etc/pulse/daemon.conf*. Although be careful and have a backup of original configuration to restore if you messed it up.

And add or modify below options:

```bash
default-sample-format = float32le
default-sample-rate = 48000
alternate-sample-rate = 44100
default-sample-channels = 2
default-channel-map = front-left,front-right
default-fragments = 2
default-fragment-size-msec = 125
resample-method = soxr-vhq
enable-lfe-remixing = no
high-priority = yes
nice-level = -11
realtime-scheduling = yes
realtime-priority = 9
rlimit-rtprio = 9
daemonize = no
```

## What are these configurations and what they do

### default-sample-format

The default sampling format of the sampler. The quality will be different for each sample format. For me, *float32le* appears to be producing the highest quality of sound.
When determining sample format you must select it depending on your CPU architecture’s byte order or also called Endianness. You can determine your CPU’s byte order by using below command:

```shell
$ lscpu | grep 'Byte Order'
Byte Order:          Little Endian
```

In my case it’s *Little Endian* hence I have selected *float32le*. If your output returns *Big Endian* then select *float32be* sampling format.

Available sample formats:

```shell
u8, s16le, s16be, s24le, s24be, s24-32le, s24-32be, s32le, s32be float32le, float32be, ulaw, alaw
```

### default-sample-rate and alternate-sample-rate

This determines in ADC or DAC conversion sampling rate and the alternative sample rate. The sound system will determine which to use, either the default or alternative automatically.

In this configuration, I have used 48000Hz. This is more than enough to get higher quality sound. You can learn more about sampling here: Sampling_(signal_processing)

### default-sample-channels and default-channel-map

The number of channels to be sampled and their configuration map. I usually listen to music using my headset so I have selected the number of channels to be 2 and channel map to be front-left and front-right.

In case if you have 2.1 or 5.1 surround sound system, you will have to consult the pulse documentation to figure out how to do tweak the configuration or comment it out, then the system will determine the best settings for you.

### default-fragments and default-fragment-size-msec

Some hardware drivers require the hardware playback buffer to be subdivided into several fragments. These configurations determines the number of fragments and a duration of a single fragment. Defaults are 4 and 25ms so the total buffer will be 100ms long. I have selected 2 and 125ms.

If you have a good sound card you can ignore this configuration since most of newer sound drivers support timer-base scheduling.

### resample-method

The resampling algorithm to use. I have selected soxr-vhq. It is the point sampler, which offers better sound quality than speex-* methods however it is CPU intensive.

Available values:

```shell
src-sinc-best-quality, src-sinc-medium-quality, src-sinc-fastest, src-zero-order-hold, src-linear, trivial, speex-float-N, speex-fixed-N, ffmpeg, soxr-mq, soxr-hq, soxr-vhq.
```

### enable-lfe-remixing

This determines the upmixing or downmixing channel behaviour. If disabled output LFE channel is available the signal on the input LFE channel will be ignored.

The Low-frequency effects (LFE) channel is the name of an audio track specifically intended for deep, low-pitched sounds ranging from 3–120 Hz

### Scheduling configuration of pulse daemon

```shell
high-priority = yes
nice-level = -11
realtime-scheduling = yes
realtime-priority = 9
rlimit-rtprio = 9
daemonize = no
```

*high-priority* setting makes the pulse daemon is a high priority process. If you enable the realtime-scheduling, it can cause a system lock up. Although this gives you a high priority IO threads of pulse daemon.

Finally you have to configure the alsa to get the best audio output:

```shell
nano /etc/asound.conf
```

The default configuration will be something similar to following:

```shell
# Use PulseAudio by default
pcm.!default {
  type pulse
  fallback "sysdefault"
  hint {
    show on
    description "Default ALSA Output (currently PulseAudio Sound Server)"
  }
}
```

Change it to this:

```shell
# Use PulseAudio plugin hw
pcm.!default {
   type plug
   slave.pcm hw
}
```

slave.pcm `hw` plugin will communicates directly with ALSA kernel driver. It is a raw communication without any conversion thus giving you a low latency audio output.
Then reboot your computer or restart Pulse and ALSA processes.
