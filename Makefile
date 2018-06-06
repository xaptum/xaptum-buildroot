export BR2_EXTERNAL ?= $(realpath buildroot-external-xaptum)

%:
	$(MAKE) -C buildroot $@
