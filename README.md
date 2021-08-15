# Ubuntu for Razer Blade 14 2021. By Jiaxin Li
## Install Ubuntu 21.04 or newer.
Blade 14 2021 is using Intel AX210 wifi card. The first kernel that includes proper driver is version 5.10. However, Ubuntu 20.04 comes with kernel 5.8.x, and it is non-trivial to upgrade the kernel to 5.10 because libc version compatibility. It is easier to install Ubuntu 21.04 that comes with kernel version 5.11. 

Note that you have to allocate a swap partition of size >=16GB if you need hibernation (to disk). Personally I don't think hibernation is necessary. Suspend (to RAM) is much more useful.

## Screen Brightness Adjustment
- Kernel 5.12.rc5 introduces a fix to brightness problem. However, nvidia 470 driver doesn't support kernel 5.12.x yet.
- The solution is to add "amdgpu.backlight=0" to the kernel parameter. Instructions of adding kernel parameter:
```
https://askubuntu.com/questions/19486/how-do-i-add-a-kernel-boot-parameter
```

## Suspend problem
Please refer to:
```
suspend/suspend.sh
```

## Audio Jack
Not working yet. No idea how to solve it.

## CPU and Fan control
Please refer to the following instructions. Branch blade14 is modified based on the original razer-laptop-control project to support Razer Blade 14 2021.

# Razer laptop control project
A standalone driver + application designed for Razer notebooks

## Join the unofficial Razer linux Channel
I can be contacted on this discord server under the 'laptop-control' channel
[Discord link](https://discord.gg/GdHKf45)

## Project demo videos:
[Playlist of all demos can be viewed here](https://www.youtube.com/playlist?list=PLxrw-4Vt7xtsO21RxaDwd7GJlKs3YU-g4)

## Install
### Arch linux
Use the 2 PKGBUILDS located here:
* [DKMS Driver](https://aur.archlinux.org/packages/razer-laptop-control-dkms-git/)
* [CLI and Daemon](https://aur.archlinux.org/packages/razer-laptop-control-git/)

### Other distros
Unfortunatly, you have to build from scrath.

## What does this control
On all razer notebooks, the following is supported:
* RGB keyboard control (Experimental)
* Fan control
* Power control

### RGB control
Currently, there are various build in effects to choose from, and multiple 'effect layers' can be stacked on top of eachother, allowing for each key to be controlled with its own effect!
### Fan control
Control the notebooks fan RPM just like in Synapse! - Currently supports switching between Automatic and manual (Up to 5300 RPM)
### Power control
Control the power target of the notebook just like in Synapse!
* Balanced - Standard 35W CPU TDP
* Gaming - 55W CPU TDP - Allows for higher and more sustained CPU boost clocks (Additionally fan RPMs are increased)
* Creator (Select notebooks only!) - Allows for higher GPU TDP

## Repo contents
### Driver
Kernel module required for the software to work

### razer_control_gui
Experimental code for system daemon and UI/CLI interface for controlling both RGB aspects and fan+Power subsystem of razer notebooks

## Changelog

### 1.3.0 - 04/01/2021
* Add support for Razer book 2020
* Add support for Razer blade pro 2020 FHD

### 1.2.1 - 17/07/2020
* Added initial rust based Daemon - see razer_control_gui for more details
* Removed useless printk calls in kernel module - DMESG output should not longer be cluttered

### 1.1.0 - 08/07/2020
* Re-wrote the kernel driver (Made my life easier for the future)
* Added native ledfs backlight control (You should now be able to control the keyboard backlight via gnome/KDE Desktop)

### 1.0.0
* Initial release
