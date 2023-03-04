[简体中文](./README.zh-CN.md) | English

[![GitHub release (latest by date)](https://img.shields.io/github/v/release/chrisblue/OpenWrt-Redmi-AX6?style=for-the-badge&label=Download)](https://github.com/chrisblue/OpenWrt-Multi/releases/latest)

# About this repository

> This repository is based on [P3TERX/Actions-OpenWrt](https://github.com/P3TERX/Actions-OpenWrt)<br>
> OpenWRT branch from [Official](https://github.com/openwrt/openwrt/)<br>

Use Github Actions Automatically compile firmware for Redmi AX6
In principle, the firmware of this project is automatically compiled once a week, and you can also fork to modify it by yourself.  
If you think this project is good, you can star it, I will be very grateful!  

## Redmi AX6 Specification

![luci\_admin\_status\_overview](.gitbook/assets/redmi-ax6.jpg)

   | Specification | value |
   | :--- | :--- |
   | CPU | [Qualcomm Pro 600 Series IPQ8071A](https://www.qualcomm.com/products/application/networking/qualcomm-networking-pro-600-platform) |
   | CPU Frequency | 4xA53 1.4GHz |
   | ROM | 128MB |
   | RAM | 512MB |
   | Peak Speed | 3000Mbps (5GHz:2402Mbps,2.4GHz:572Mbps) |
   | Standards | 802.11ax (WIFI 6) |
   | Network Port | 10/100/1000Mbps x4 |

#### Note: Some parameters may only be used by the official


## Features

* [OpenClash](https://github.com/vernesong/OpenClash)
* Wake-On-LAN
* DDNS
* More functions by themselves (may be refreshed from time to time to check)...

## Instructions

1. Upload your own `AX6-***.config` file (depending on which branch you want to be on)
2. Enter the Actions page to manually start the compilation
3. When the compilation is complete, download the compiled `xxx-factory.ubi` firmware on the Releases page.
4. If you have previously flashed dual systems to AX6, please enter `fw_setenv flag_last_success=1` and `fw_setenv flag_boot_rootfs=1` and then restart the device to switch the system (if not, please click the [reference link(Please solve the translation problem yourself)](https://www.right.com.cn/forum/thread-6054985-1-1.html) to install the dual system)
5. Upload the firmware with the suffix of .ubi via scp
6. Flashing in the firmware `ubiformat /dev/mtd13 -y -f /tmp/openwrt-xxx-redmi_ax6-squashfs-nand-factory.ubi` PS: The file name is just an example. When flashing in, the ubi file name you downloaded will prevail
7. Enter `fw_setenv flag_last_success=0` and `fw_setenv flag_boot_rootfs=0` and then restart the device

## Instructions（with uboot）

1. If you haven't flashed it, please flash uboot first, and the second step if you have flashed it. [123pan(Extraction password：88g5 compressed file password：RA69)](https://www.123pan.com/s/o17DVv-hClm) [Google Drive(compressed file password：RA69)](https://drive.google.com/file/d/1cuJoNP-8yTMXOVPIBPK1KmOOsvPcJbFU/view?usp=sharing)
2. After flashing, please plug in the power supply and use the card pin or any object to hold down the reset hole of the AX6 router for 5 seconds until the red light turns on, modify the ip to 192.168.1.10 and the gateway to 192.168.1.1 to enter uboot
3. Upload the firmware with the .ubi suffix, wait for the automatic restart, and complete

## Instructions (for 2023.02.03 and later firmware)

1. First flash into the official partition table and uboot of ZhiPing/AnYun [partition table reference link](https://www.right.com.cn/forum/thread-8253493-1-1.html) [ZhiPing uboot reference Link](https://www.right.com.cn/FORUM/thread-8253375-1-1.html) [AnYun uboot reference link](https://mbd.pub/o/anyun/work)
2. Use a method such as winscp to transfer uboot and partition table to ax6 router
3. SSH into ax6，enter the following commands in sequence:
```
mtd erase /dev/mtd1
mtd write /tmp/(the mibib partition table you downloaded).bin /dev/mtd1
mtd erase /dev/mtd7
mtd write /tmp/(uboot you downloaded).bin /dev/mtd7
```
4. Unplug the power and turn it on again, hold the reset hole with a needle or other thin objects at the same time, and set the computer IP address to 192.168.1.10 after the blue light is on, and the network gateway to 192.168.1.1
5. Enter 192.168.1.1 in the browser, flash into ***-initramfs-factory.ubi
6. Change back to DHCP, enter the background of the router, click [How to update the firmware](tutorial/ru-he-geng-xin-gu-jian.md) to flash ***-squashfs-sysupgrade.bin
7. finish

## Default IP address and password
   | project | value |
   | :--- | :--- |
   | Default IP address | `192.168.2.1` |
   | Default password | `password` |

## Screenshot

![luci\_admin\_status\_overview](.gitbook/assets/AX6-OP.png)

## Issues
#### Disclaimer: The following known issues are all personal measurements, and there may be unknown issues. I am not responsible for any issues caused by the firmware

~~* As of the editing of this article, since the memory leak problem of ax6's openwrt is still unresolved, my personal suggestion is to restart every once in a while and add the following commands through the system-startup item-local startup script (note: to exit Before 0):~~
   ```bash
   echo "0 4 * * * sleep 5 && touch /etc/banner && reboot" >> /etc/crontabs/root
   echo "0 16 * * * sleep 5 && touch /etc/banner && reboot" >> /etc/crontabs/root
   ```
   ~~Then restart the router once. It will restart at 4 am and 16 pm every day. If you can understand the principle of crontab, you can also customize the restart time.~~

* (update)The problem of luci stuck due to memory seems to be fixed (I haven't seen luci crash for several days after booting), ~~but due to at least 5.15 kernel, it can't open 160Mhz.~~
* (Update again) If you want to open 160Mhz, please find Generic 802.11acaxn in the network-wireless item, click edit, set the channel to 48 (pro-test available, you can also try other channels), and then set the country to US - United States, save and apply the settings, wait a minute

## Credits

* [Microsoft Azure](https://azure.microsoft.com/)
* [GitHub Actions](https://github.com/features/actions)
* [OpenWRT](https://github.com/openwrt/openwrt)
* [tmate](https://github.com/tmate-io/tmate)
* [P3TERX](https://github.com/P3TERX)
* [smith97](https://www.right.com.cn/forum/thread-6054985-1-1.html)
* [robimarko/openwrt](https://github.com/robimarko/openwrt/tree/ipq807x-5.15)
* and all OpenWRT/LEDE related contributors
