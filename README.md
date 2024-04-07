# Thinkpad keyboard backlight brightness

This systemd service will set the keyboard backlight brightness based on 
ambient light levels.

This is initially designed for _Thinkpad X1 Yoga (gen3)_ but should work 
on other devices with minor configuration tweaks.


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

Note that the above will not uninstall user configuration files, for a 
full uninstall run:

```bash
$ sudo make full-uninstall
```


## License

[BSD 3-Clause License](./LICENSE)

Copyright (c) 2024, Alex A. Naanou,  
All rights reserved.


<!-- vim:set ts=4 sw=4 spell : -->
