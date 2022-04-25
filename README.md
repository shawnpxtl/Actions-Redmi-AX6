[简体中文](./README.zh-CN.md) | English

# About this repository

> This repository is based on [P3TERX/Actions-OpenWrt](https://github.com/P3TERX/Actions-OpenWrt)<br>
> LEDE branch from [coolsnowwolf/lede](https://github.com/coolsnowwolf/lede)<br>
> OpenWRT branch from [robimarko/openwrt](https://github.com/robimarko/openwrt/tree/ipq807x-5.15)<br>

Use Github Actions Automatically compile firmware for Phicomm K2P and Redmi AX6

## Features

* OpenClash(AX6 Only)
* Passwall(K2P Only)
* Turbo ACC
* UnblockMusic
* Wake-On-LAN
* ZeroTier
* DDNS
* More functions by themselves (may be refreshed from time to time to check)...

## Instructions for AX6

1. Upload your own `AX6-LEDE.config` file (depending on which branch you want to be on)
2. Enter the Actions page to manually start the compilation
3. When the compilation is complete, download the compiled `xxx-factory.ubi` firmware on the Releases page.
4. If you have previously flashed dual systems to AX6, please enter `fw_setenv flag_last_success=1` and `fw_setenv flag_boot_rootfs=1` and then restart the device to switch the system (if not, please click the [reference link(Please solve the translation problem yourself)](https://www.right.com.cn/forum/thread-6054985-1-1.html) to install the dual system)
5. Upload the firmware with the suffix of .ubi via scp
6. Flashing in the firmware `ubiformat /dev/mtd13 -y -f /tmp/openwrt-xxx-redmi_ax6-squashfs-nand-factory.ubi` PS: The file name is just an example. When flashing in, the ubi file name you downloaded will prevail
7. Enter `fw_setenv flag_last_success=0` and `fw_setenv flag_boot_rootfs=0` and then restart the device

## Instructions for K2P

1. Upload your own `K2P.config` file 
2. Enter the Actions page to manually start the compilation
3. When the compilation is complete, in the upper right corner of the Actions page, click the Artifacts button or the WeTransfer link in Annotations to download the compressed package containing the compiled firmware
4. Enter breed and select ⚠️Phicomm layout⚠️ to brush into the file containing the word `xxx-sysupgrade.bin` in the compressed package 

## Default IP address and password
   | project | value |
   | :--- | :--- |
   | Default IP address | `192.168.2.1` |
   | Default password | `password` |

## Screenshot

K2P：
![luci\_admin\_status\_overview](.gitbook/assets/K2P-OP.png)
AX6：
![luci\_admin\_status\_overview](.gitbook/assets/AX6-OP.png)

## Issues
#### Disclaimer: The following known issues are all personal measurements, and there may be unknown issues. I am not responsible for any issues caused by the firmware

AX6：
* As of the editing of this article, since the memory leak problem of ax6's openwrt is still unresolved, my personal suggestion is to restart every once in a while and add the following commands through the system-startup item-local startup script (note: to exit Before 0):
   ```bash
   echo "0 4 * * * sleep 5 && touch /etc/banner && reboot" >> /etc/crontabs/root
   echo "0 16 * * * sleep 5 && touch /etc/banner && reboot" >> /etc/crontabs/root
   ```
   Then restart the router once. It will restart at 4 am and 16 pm every day. If you can understand the principle of crontab, you can also customize the restart time.

* (update)The restart problem is alleviated, but there will be occasional outages.

K2P：
* (LEDE branch)Redmi K30 Ultra and other MTK Dimensity 1000+ devices (I don’t know if other Dimensity devices are affected) may only have 433Mbps (at least my mobile phone is like this). The reason has not been found yet. If you know the reason, please submit an issue. 

![K30U\_Issues](https://i.loli.net/2021/03/18/TsXa75gWvLr3wOI.jpg)

## Credits

* [Microsoft Azure](https://azure.microsoft.com/)
* [GitHub Actions](https://github.com/features/actions)
* [OpenWRT](https://github.com/openwrt/openwrt)
* [tmate](https://github.com/tmate-io/tmate)
* [Boos4721](https://github.com/Boos4721)
* [Lean's OpenWrt](https://github.com/coolsnowwolf)
* [P3TERX](https://github.com/P3TERX)
* [smith97](https://www.right.com.cn/forum/thread-6054985-1-1.html)
* and all OpenWRT/LEDE related contributors
