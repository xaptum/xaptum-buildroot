# Xaptum Buildroot

Buildroot tree for Xaptum router card firmware.

## Organization

* `buildroot` - the upstream Buildroot tree (git submodule)
* `buildroot-external` - the external Buildroot tree for Xaptum boards and pacakges
	* `board` Configurations and static overlay files specific to the `xaprc*` and `xaprw*` builds.
	* `configs` Buildroot defconfigs
	* `package` Out of tree package definitions
	* `patches` Patches to apply to packages

## Preparation

After first cloning this repo, initialize the submodule:

    git submodule update --init

## Usage

To build the Xaptum Router Card (xap-rc-001) firmware run:

``` bash
# Enter an out-of-tree directory for the build
mkdir build && cd build

# Initialize the default config
make O=$PWD -C .. xaprc001_defconfig

# Customize the config, if desired
make menuconfig

# Customize the linux config, if desired
make linux-menuconfig

# Build using Buildroots official Docker image
sudo docker run -v $(dirname $(pwd)):$(dirname $(pwd)) buildroot/base bash -c "cd $(pwd); make BR2_JLEVEL=$(nproc)"

# Or build the firmware locally. See buildroot docs for dependencies
make BR2_JLEVEL=$(nproc)
```

The firmware image will be built as
`images/emmc.img`.

Use separate build directories to simplify working with multiple
configurations. The builds will not interfere with each other and
switching between configurations won't require a clean and full
rebuild.

``` bash
cd build
# Initialize a build directory for one config
mkdir xaprw_dev_build
pushd xaprw_dev_build
make O=$PWD -C ../.. xaprw001_dev_defconfig
```

## Defconfigs

Five defconfigs are available.

`xaprc001_defconfig` - the production config for the XAP-RC-001 router
card.

`xaprc001_dev_defconfig` - a config for the XAP-RC-001 router card
that enables extra development and debugging tools and options.

`xaprw001_defconfig` - the production config the XAP-RW-001 router
card. This hardware is nearly identifical to the XAP-RC-001, but
includes a WiFi chipset.

`xaprw001_dev_defconfig` - a config the XAP-RW-001 router card that
enables extra development and debugging tools and options. This
hardware is nearly identifical to the XAP-RC-001, but includes a WiFi
chipset.

`xaprc001_prov_defconfig` - a config for the XAP-RC-001 router card
that runs live in RAM and exposes the cards TPM to the host. Used
for initial provisioning.

## Writing Images

Xaptum provides [xaprc-provisioning](https://github.com/xaptum/xaprc-provisioning) for writing firmware images to the card.

# Running the flashed firmware

Once the firmware is written future power cycles will boot the written image without further user intervention. Xaptum provides [xaprc-control](https://github.com/xaptum/xaprc-control) for controlling the cards boot states on development and production programming boards.

## Help

Read the [Buildroot
manual](https://buildroot.org/downloads/manual/manual.html),
paying particular attention to the section on [Project-specific
customization](https://buildroot.org/downloads/manual/manual.html#customize). It
is very well written.

## License
Copyright (c) 2018 Xaptum, Inc.

This program is free software; you can redistribute it and/or
modify it under the terms of the GNU General Public License
as published by the Free Software Foundation; either version 2
of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.
