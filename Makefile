
SBIN_DIR := /usr/sbin/
SERVICE_DIR := /etc/systemd/system/

SCRIPT := thinkpad-keyboard-brightness
TIMER := $(SCRIPT).timer
UNIT := $(SCRIPT).service



.PHONY:install
install: $(TIMER) $(UNIT) $(SCRIPT)
	cp -f $(UNIT) $(TIMER) $(SERVICE_DIR) 
	systemctl daemon-reload
	systemctl enable ${UNIT}
	systemctl enable ${TIMER}
	systemctl start ${TIMER}


.PHONY:disable
disable: $(TIMER) $(UNIT)
	systemctl stop ${TIMER}
	systemctl disable ${TIMER}
	systemctl disable ${UNIT}

.PHONY:uninstall
uninstall: disable $(TIMER) $(UNIT)
	rm -f \
		$(SERVICE_DIR)/$(TIMER) \
		$(SERVICE_DIR)/$(UNIT)
	systemctl daemon-reload

.PHONY:reinstall
reinstall: uninstall install 

