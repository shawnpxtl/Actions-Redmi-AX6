[简体中文](./README.zh-CN.md) | English

[![GitHub release (latest by date)](https://img.shields.io/github/v/release/shawnpxtl/Actions-Redmi-AX6?style=for-the-badge&label=Download)](https://github.com/shawnpxtl/Actions-Redmi-AX6/releases/latest)

# About this repository

> This repository is based on [P3TERX/Actions-OpenWrt](https://github.com/P3TERX/Actions-OpenWrt)<br>
> [OpenWRT](https://github.com/openwrt/openwrt)/[ImmortalWrt](https://github.com/immortalwrt/immortalwrt) branch from official source<br>

Use Github Actions Automatically compile firmware for Redmi AX6  
In principle, the firmware of this project is automatically compiled once a week, and you can also fork to modify it by yourself.  
If you think this project is good, you can star it, I will be very grateful!  

## Features

* ADGuard Home
* Chinadns-NG
* Homeproxy
* Wake-On-LAN
* DDNS
* More functions by themselves (may be refreshed from time to time to check)...

## Instructions

Do you want to flashing [ImmortalWrt](tutorial/ImmortalWrt.en_US.md) or [OpenWrt](tutorial/OpenWrt.en_US.md)?

## Default IP address and password
   | project | value |
   | :--- | :--- |
   | Default IP address | `192.168.2.1` |
   | Default password | `none` |

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
* [ImmortalWrt](https://github.com/immortalwrt/immortalwrt)
* [tmate](https://github.com/tmate-io/tmate)
* [P3TERX](https://github.com/P3TERX)
* [smith97](https://www.right.com.cn/forum/thread-6054985-1-1.html)
* [robimarko/openwrt](https://github.com/robimarko/openwrt/tree/ipq807x-5.15)
* and all OpenWRT/ImmortalWrt related contributors
