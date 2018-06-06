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
