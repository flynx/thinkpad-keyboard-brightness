# Thinkpad keyboard backlight brightness

This systemd service will turn the keyboard backlight on/off brightness 
based on ambient light level threshold.

This is initially designed for _Thinkpad X1 Yoga (gen3)_ but should work 
on other devices with no or minor configuration tweaks.


## Install

```bash
$ sudo make install
```


## Configure

For device-specific configuration see:
[thinkpad-keyboard-brightness.conf](thinkpad-keyboard-brightness.conf)

This file lives in `/etc/thinkpad-keyboard-brightness.conf`


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
