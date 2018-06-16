#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include <argp.h>
#include <ftdi.h>

enum property { none = 0, power, boot, wireless };

// -------------------------- Hardware operations ----------------------------
struct ftdi_context ftdi;

static int
configure_interface(enum ftdi_interface iface) {
    int ret;
    if ((ret = ftdi_set_interface(&ftdi, iface)) < 0) {
        fprintf(stderr, "Failed to set interface: %d (%s)\n", ret, ftdi_get_error_string(&ftdi));
        goto out;
    }

    if ((ret = ftdi_usb_open(&ftdi, 0x403, 0x6011)) < 0) {
        fprintf(stderr, "Failed to open FTDI device: %d *(%s)\n", ret, ftdi_get_error_string(&ftdi));
        goto out;
    }

    if ((ret = ftdi_set_bitmode(&ftdi, 0xE0, BITMODE_BITBANG)) < 0) {
        fprintf(stderr, "Failed to set asynchronous bit-bang mode: %d (%s)\n", ret, ftdi_get_error_string(&ftdi));
        goto out;
    }

    if ((ret = ftdi_set_baudrate(&ftdi, 115200)) < 0) {
        fprintf(stderr, "Failed to set baudrate: %d (%s)\n", ret, ftdi_get_error_string(&ftdi));
        goto out;
    }

 out:
    return ret;
}

static int
set_property(int pin_number, int pin_value) {
    int ret;
    unsigned char pins;

    if ((ret = ftdi_read_pins(&ftdi, &pins)) < 0) {
        fprintf(stderr, "Failed to read pins: %d (%s)\n", ret, ftdi_get_error_string(&ftdi));
        goto out;
    }

    if (pin_value)
        pins |= 1UL << pin_number;
    else
        pins &= ~(1UL << pin_number);

    if ((ret = ftdi_write_data(&ftdi, &pins, 1)) < 0) {
        fprintf(stderr, "Failed to write pins: %d (%s)\n", ret, ftdi_get_error_string(&ftdi));
        goto out;
    }

 out:
    return ret;
}

static int
get_property(int pin_number) {
    int ret;
    unsigned char pins;

    if ((ret = ftdi_read_pins(&ftdi, &pins)) < 0) {
        fprintf(stderr, "Failed to read pins: %d (%s)\n", ret, ftdi_get_error_string(&ftdi));
        goto out;
    }

    return (pins  >> pin_number) & 1U;

 out:
    return ret;
}

static int
do_reboot() {
    int ret;

    if ((ret = set_property(7, 0)) < 0) {
        fprintf(stderr, "Failed to turn off\n");
        goto out;
    }

    sleep(1);

    if ((ret = set_property(7, 1)) < 0) {
        fprintf(stderr, "Failed to turn on\n");
        goto out;
    }

 out:
    return ret;
}

// ---------------------------- Argument parsing -----------------------------
static int
parse_options(int key, char* arg, struct argp_state *state) {
    enum property* prop = state->input;

    switch (key) {
    case 's':
        if (atoi(arg) == 1)
            configure_interface(INTERFACE_A);
        else if (atoi(arg) == 2)
            configure_interface(2);
        else
            argp_failure(state, 1, 0, "%s is not a valid slot number", arg);
        break;
    case ARGP_KEY_ARG:
        switch (*prop) {
        case none:
            if (strcmp(arg, "power") == 0)
                *prop = power;
            else if (strcmp(arg, "boot") == 0)
                *prop = boot;
            else if (strcmp(arg, "wireless") == 0)
                *prop = wireless;
            else if (strcmp(arg, "reboot") == 0)
                return do_reboot();
            else
                argp_failure(0, 1, 0, "%s is not a valid property", arg);
            break;
        case power:
            if (strcmp(arg, "on") == 0)
                set_property(7, 1);
            else if (strcmp(arg, "off") == 0)
                set_property(7, 0);
            else
                argp_failure(0, 1, 0, "%s is not a valid power value", arg);
            *prop = none;
            break;
        case boot:
            if (strcmp(arg, "emmc") == 0)
                set_property(6, 0);
            else if (strcmp(arg, "romboot") == 0)
                set_property(6, 1);
            else
                argp_failure(0, 1, 0, "%s is not a valid boot value", arg);
            *prop = none;
            break;
        case wireless:
            if (strcmp(arg, "enable") == 0)
                set_property(5, 0);
            else if (strcmp(arg, "disable") == 0)
                set_property(5, 1);
            else
                argp_failure(0, 1, 0, "%s is not a valid wireless value", arg);
            *prop = none;
            break;
        }
        break;
    case ARGP_KEY_END:
        switch (*prop) {
        case none:
            break;
        case power:
            switch (get_property(7)) {
            case 0:
                printf("off\n");
                break;
            case 1:
                printf("on\n");
                break;
            default:
                return -1;
            }
            break;
        case boot:
            switch (get_property(6)) {
            case 0:
                printf("emmc\n");
                break;
            case 1:
                printf("romboot\n");
                break;
            default:
                return -1;
            }
            break;
        case wireless:
            switch (get_property(5)) {
            case 0:
                printf("enable\n");
                break;
            case 1:
                printf("disable\n");
                break;
            default:
                return -1;
            }
            break;
        }
        break;
    }

    return 0;
}

int
main(int argc, char **argv) {
    int ret;

    if ((ret = ftdi_init(&ftdi)) < 0) {
        fprintf(stderr, "Failed to initialize FTDI context: %d (%s)\n", ret, ftdi_get_error_string(&ftdi));
        exit(ret);
    }

    static struct argp_option options[] =
        {
            { "slot", 's', "SLOT", 0, "The slot to control [1|2]. Will control both if not specified." },
            { 0 }
        };

    struct argp argp = { options, parse_options, "property [value]", 0 };

    enum property prop = none;
    return argp_parse(&argp, argc, argv, 0, 0, &prop);
}
