
NAME := thinkpad-keyboard-brightness

SBIN_DIR := /usr/sbin
CONFIG_DIR := /etc/
SERVICE_DIR := /etc/systemd/system/

SCRIPT := $(NAME)
CONFIG := $(NAME).conf
TIMER := $(NAME).timer
UNIT := $(NAME).service

SERVICE_FILES := \
	$(TIMER) \
	$(UNIT)

FILES := \
	$(SERVICE_FILES) \
	$(SCRIPT) \
	$(CONFIG)


.PHONY:install
install: $(FILES)
	cp -f $(SERVICE_FILES) $(SERVICE_DIR) 
	cp -f $(SCRIPT) $(SBIN_DIR) 
	cp -f $(CONFIG) $(CONFIG_DIR) 
	systemctl daemon-reload
	systemctl enable ${UNIT}
	systemctl enable ${TIMER}
	systemctl start ${UNIT}
	systemctl start ${TIMER}


.PHONY:disable
disable: $(TIMER) $(UNIT)
	systemctl stop ${TIMER}
	systemctl stop ${UNIT}
	systemctl disable ${TIMER}
	systemctl disable ${UNIT}


# NOTE: this will not remove user config files...
.PHONY:uninstall
uninstall: disable $(TIMER) $(UNIT)
	rm -f \
		$(SERVICE_DIR)/$(TIMER) \
		$(SERVICE_DIR)/$(UNIT) \
		$(SBIN_DIR)/$(SCRIPT)
	systemctl daemon-reload


.PHONY:full-uninstall
full-uninstall: uninstall
	rm -f $(CONFIG_DIR)/$(CONFIG)


.PHONY:reinstall
reinstall: uninstall install 

