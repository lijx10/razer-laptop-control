# Ubuntu for Razer Blade 14 2021.
## Install Ubuntu 20.04.3 or newer.
Blade 14 2021 is using Intel AX210 wifi card. The first kernel that includes proper driver is version 5.10. However, Ubuntu 20.04.2 comes with kernel 5.8.x, and it is non-trivial to upgrade the kernel to 5.10 because libc version compatibility. Good news is that Ubuntu 20.04.3 is shipped with kernel 5.11.x. Please wait for Aug 26, 2021 to get Ubuntu 20.04.3.

You may need to disable `security boot` in BIOS to avoid problems like low-resolution during Ubuntu installation.

For Windows + Ubuntu dual boot, please refer to 
```
https://regulus.cc/2019/10/05/Windows10+Ubuntu18.04%E5%8F%8C%E7%B3%BB%E7%BB%9F%E7%AE%80%E5%8D%95%E5%AE%89%E8%A3%85%E6%8C%87%E5%8C%97/
```

Note that you have to allocate a swap partition of size >=16GB if you need hibernation (to disk). Personally I don't think hibernation is necessary. Suspend (to RAM) is much more useful.

## Screen Brightness Adjustment
- Kernel 5.12 should have solved it. Nvidia 470 driver works with kernel 5.12. Not sure if nvidia 470 works with 5.13 yet, need experiments.
- Another solution is to add "amdgpu.backlight=0" to the kernel parameter. Instructions of adding kernel parameter:
```
https://askubuntu.com/questions/19486/how-do-i-add-a-kernel-boot-parameter
```

## Suspend problem
Please refer to:
```
suspend/suspend.sh
```

## Audio Jack
Not working yet. No idea how to solve it with software. A workaround is to buy a usb-to-3.5mm converter.

## nvidia and cuda
GTX/RTX 30xx requires cuda 11. Blade 14 2021 requires driver version >= 470 to avoid HDMI output problems. The solution is to follow the guide of 
```
https://docs.nvidia.com/cuda/cuda-installation-guide-linux/index.html
```

I was using network deb method, but there are errors in the installation process. I ran the following command to fix the error, and then continue with the cuda/driver installation.
```
sudo apt-get -f install
```

Please refer to `gpu/gpu_control.sh` for fine-grain power and performance control of the nvidia gpu.

## CPU and Fan control
Please refer to the following instructions. Branch blade14 is modified based on the original razer-laptop-control project to support Razer Blade 14 2021.

Fine-grain cpu control is possible with several methods. It seems gnome extension `cpufreq` is working fine, and it is more convenient.
##### cpupower. 
It can be installed using apt-get. Please refer to `cpu/cpu_control.sh` for usage examples. GUI available at `https://github.com/vagnum08/cpupower-gui`.

##### gnome extension cpufreq
The `cpufreq` pluggin allows gui based control of CPU core number, governor, boost frequency, etc.
1. Install gnome tweaks. It is an app with GUI.
```
sudo apt-get install gnome-tweaks
```
2. Open gnome tweaks in launcher, go to tab `Extensions`, enable the switch on the top bar of the app.
3. Go the the following website to install `cpufreq`.
```
https://extensions.gnome.org/extension/1082/cpufreq
``` 
------

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
