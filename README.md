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

Three defconfigs are available.

`xaprc001_defconfig` - the production config for the XAP-RC-001 router
card

`xaprc001_dev_defconfig` - a config for the XAP-RC-001 router card
that enables extra development and debugging tools and options

`sama5d2_xplained_xaprc001_defconfig` - a config for the SAMA5D2
Xplained development board that closely mirrors that of the
`xaprc001`. Useful for development that requires additional hardware
(e.g., an ethernet port or additional USB port).

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

## Help

Read the [Buildroot
manual](https://buildroot.org/downloads/manual/manual.html) manually,
paying particular attention to the section on [Project-specific
customization](https://buildroot.org/downloads/manual/manual.html#customize). It
is very well written.
