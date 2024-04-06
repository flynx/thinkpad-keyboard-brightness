
NAME := thinkpad-keyboard-brightness

SERVICE_DIR := /etc/systemd/system/

TIMER := $(NAME).timer
UNIT := $(NAME).service



.PHONY:install
install: $(TIMER) $(UNIT)
	cp -f $? $(SERVICE_DIR) 
	systemctl daemon-reload
	systemctl enable ${UNIT}
	systemctl enable ${TIMER}
	systemctl start ${TIMER}
	systemctl start ${UNIT}


.PHONY:disable
disable: $(TIMER) $(UNIT)
	systemctl stop ${TIMER}
	systemctl stop ${UNIT}
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

