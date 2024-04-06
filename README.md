# Thinkpad keyboard backlight brightness

This service will set the keyboard backlight brightness based on ambient 
light levels.


## Install

```bash
$ sudo make install
```


## Configure

```bash
$ sudo systemctl edit thinkpad-keyboard-brightness.service
```

Variables that can change depending on device
```
[Service]
Environment=SENSOR=/sys/bus/iio/devices/iio:device2/in_illuminance_raw
Environment=TRIGGER=/sys/class/leds/tpacpi::kbd_backlight/brightness
Environment=THRESHOLD=1500
Environment=VALUE=1
```


## Uninstall

```bash
$ sudo make uninstall
```

