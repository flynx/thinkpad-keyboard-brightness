
SERVICE_DIR := /etc/systemd/system/

TIMER := thinkpad-keyboard-brightness.timer
UNIT := thinkpad-keyboard-brightness.service



.PHONY:install
install: $(TIMER) $(UNIT)
	cp -f $? $(SERVICE_DIR) 
	systemctl daemon-reload
	systemctl enamble ${UNIT}
	systemctl enamble ${TIMER}
	systemctl start ${TIMER}

