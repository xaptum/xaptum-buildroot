export BR2_EXTERNAL ?= $(realpath buildroot-external-xaptum)

.DEFAULT_GOAL := all

%:
	$(MAKE) -C buildroot $@
