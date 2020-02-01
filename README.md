# System Rescue USB

![System-Rescue-USB](https://github.com/LordH3lmchen/eilish-linux/blob/master/images/Screenshot.png)

System Rescue USB is a modified Arch Linux live cd. It is build as a rescue tool. I was looking for a Live CD to install Arch Linux. I found system-rescue-cd.org, but I wasn't satisfied with the system. I decided to build my own customized version, after I realized how easy it is to compile and customize your own Arch Linux iso.

It is configured to boot into a LXDE desktop using an
unprivilged user. You can use **sudo** to get root priviges. It uses fish as default shell. tmux is configured with mouse support. I have no plans to keep the iso small.

## Creating a boot media

### Burning to a CD/DVD in Windows

In Windows 7 and later, support for burning an ISO to DVD is built-in. Simply right click on the on .iso file and select "Burn disk image". This will bring up a series of dialogues to walk you through the process.

For Windows Vista or older versions of Windows you will need to download 3rd party software. Several free software burner applications are available for Windows. One such tool is DeepBurner. The portable version can be downloaded from here.

### Writing to a USB Stick in Linux

This section describes how to write a Linux ISO file to USB.

#### Using a Burning Application

ImageWriter
ImageWriter should be available for installation from your distribution's Software Center / Software Manager / Package Manager / repositories. Once Imagewriter has been downloaded and installed, ensure that your USB stick is plugged in before starting it.

A brief guide to writing the Manjaro .ISO image has been provided:

1. Click on the centre icon

2. Navigate to where the ISO image has been saved and select it

3. Ensure that your USB device has been selected from the drop-down menu

4. Click on the Write button

5. After the Write process has finished, reboot your system

#### Using the Terminal

To burn the iso on an usb stick, enter the following command in a terminal :

```bash
sudo dd bs=4M if=/path/to/manjaro.iso of=/dev/sd[drive letter] status=progress oflag=sync
```

Where [drive letter] is the letter of your removable device. Please note that it is the device (e.g. /dev/sdb), and not the partition number (e.g. /dev/sdb1).

To find which drive letter it might be write:

```bash
sudo fdisk -l
```

### Writing to a USB Stick in Windows using Rufus

[Rufus](http://rufus.akeo.ie/) is a utility that helps format and create bootable USB flash drives, such as USB keys/pendrives, memory sticks, etc.

When you use Rufus to write a Manjaro Live ISO to USB you must select DD mode when prompted to use standard or DD mode.

See its website for more details: [1](http://rufus.akeo.ie/)

## Included Tools

The main purpose of the Live CD is to rescue data.

- clonezilla
- ddrescue
- gparted
- fdisk
- gdisk
- ...

## How to create and modifiy an iso

This only works on arch based Linux ditributions.

Install **archiso**

```bash
pacman -S archiso
```

Clone this Repository

```bash
git clone https://github.com/LordH3lmchen/system-rescue-usb.git
```

Run the buidl script.

```bash
./build.sh
```

Additional information can be found in the [Arch Linux Wiki - Archiso](https://wiki.archlinux.org/index.php/Archiso)
