# Xaptum Buildroot External

External buildroot tree for the Xaptum router card firmware.

## Organization

`buildroot` - the upstream Buildroot tree (git submodule)

`buildroot-external` - the external Buildroot tree for Xaptum boards and pacakges

## Preparation

After first cloning this repo, initialize the submodule:

    git submodule init --update

## Usage

To build the Xaptum Router Card (xap-rc-001) firmware run:

``` bash
    # Initialize the default config
    make xaprc001_defconfig

    # Customize the config, if desired
    make menuconfig

    # Customize the linux config, if desired
    make linux-menuconfig

    # Build the firmware
    make
```

The firmware image will be built in
`buildroot/output/images/emmc.img`.

## Defconfigs

Five defconfigs are available.

`xaprc001_defconfig` - the production config for the XAP-RC-001 router
card.

`xaprc001_dev_defconfig` - a config for the XAP-RC-001 router card
that enables extra development and debugging tools and options.

`sama5d2_xplained_xaprc_defconfig` - a config for the SAMA5D2
Xplained development board that closely mirrors that of the
`xaprc001`. Useful for development that requires additional hardware
(e.g., an ethernet port or additional USB port).

`xaprw001_defconfig` - the production config the XAP-RW-001 router
card. This hardware is nearly identifical to the XAP-RC-001, but
includes a WiFi chipset.

`xaprw001_dev_defconfig` - a config the XAP-RW-001 router card that
enables extra development and debugging tools and options. This
hardware is nearly identifical to the XAP-RC-001, but includes a WiFi
chipset.

## xaprc_eval_tool

This tool can be used to control the development board for the router
cards.  It uses `libftdi`, not `ftd2xx`, and thus can be run
concurrently with the `ftdi_sio` kernel module.

You can attach to the `/dev/ttyS2` (or `/dev/ttyS3`) serial console
while also controlling the development board.

It is built in
`buildroot/output/host/usr/bin/xaprc_eval_tool`.

`xaprc_eval_tool -s 1 boot romboot reboot` will configure slot 1 to
disable boot and then power cycle the card.

`xaprc_eval_tool -s 1 boot emmc reboot` will configure slot 1 to
reenable boot and then power cycle the card.

The following commands are supported

- `power on`
- `power off`
- `reboot`
- `boot romboot`
- `boot emmc`
- `wireless disable`
- `wireless enable`

See `xaprc_eval_tool --help` for full options.

## SAM-BA

The SAM-BA software can be used to flash a new firmware to the board.

### Installation

Download the precompiled sam-ba utility from the following link.

http://ww1.microchip.com/downloads/en/DeviceDoc/sam-ba_3.2.1-linux_x86_64.tar

### Usage

``` bash
# Reboot the card into the romboot mode
xaprc_eval_tool -s 1 boot romboot reboot

# Enable regular users to write to the device
sudo chmod a+rw /dev/ttyACM0

# Flash the new firmware to the card
sam-ba -p serial -b sama5d2-xplained -a sdmmc -c write:emmc.img

# Reboot the card from the emmc
xaprc_eval_tool -s 1 boot emcc reboot
```

## Serial console

A serial console is available on `/dev/ttyUSB2` (for slot 1 on the
evaluation kit) or `/dev/ttyUSB3` (for slot 2 on the evaluation kit).

Connect to the serial console using a terminal emulator like minicom.

``` bash
sudo minicom -D /dev/ttyUSB2
```

## Help

Read the [Buildroot
manual](https://buildroot.org/downloads/manual/manual.html) manually,
paying particular attention to the section on [Project-specific
customization](https://buildroot.org/downloads/manual/manual.html#customize). It
is very well written.
