TARGET_EXEC ?= xaprc_eval_tool

BUILD_DIR ?= ./build
SRC_DIRS ?= ./src

SRCS := $(shell find $(SRC_DIRS) -name *.c)
OBJS := $(SRCS:%=$(BUILD_DIR)/%.o)
DEPS := $(OBJS:.o=.d)

INC_DIRS := $(shell find $(SRC_DIRS) -type d)
INC_FLAGS := $(addprefix -I,$(INC_DIRS))

override CFLAGS += $(INC_FLAGS) -MMD -MP -g -std=c99
override LDFLAGS += -lftdi

$(BUILD_DIR)/$(TARGET_EXEC): $(OBJS)
	echo CFLAGS $(CFLAGS)
	echo LDFLAGS $(LDFLAGS)
	$(CC) $(OBJS) -o $@ $(LDFLAGS)

$(BUILD_DIR)/%.c.o: %.c
	$(MKDIR_P) $(dir $@)
	$(CC) $(CFLAGS) -c $< -o $@

.PHONY: install clean

install:
	install -m 755 $(BUILD_DIR)/$(TARGET_EXEC) $(PREFIX)/bin

clean:
	$(RM) -r $(BUILD_DIR)

-include $(DEPS)

MKDIR_P ?= mkdir -p
