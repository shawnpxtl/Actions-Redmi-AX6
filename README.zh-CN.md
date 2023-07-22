[![GitHub release (latest by date)](https://img.shields.io/github/v/release/shawnpxtl/Actions-Redmi-AX6?style=for-the-badge&label=下载)](https://github.com/shawnpxtl/Actions-Redmi-AX6/releases/latest)

# 基于ImmortalWrt源码的带TurboACC的固件即将提供，具体[点此查看](https://github.com/shawnpxtl/Actions-Redmi-AX6-TurboACC)

### ⚠注意：值守式系统更新千万不要操作，且最好在值守式系统更新的配置中把下载地址去掉，否则真的会影响使用的！！！⚠

# 关于这个仓库

> 这个仓库基于[P3TERX/Actions-OpenWrt](https://github.com/P3TERX/Actions-OpenWrt)<br>
> [OpenWRT](https://github.com/openwrt/openwrt)/[ImmortalWrt](https://github.com/immortalwrt/immortalwrt)分支来自官方源码，[LEDE](https://github.com/slippersheepig/ax6)分支来自slippersheepig<br>

用Github Actions为AX6自动编译固件  
本项目的固件原则上每周自动编译一次，您也可以fork自行修改~  
如果您觉得本项目不错的话，可以Star一下，我会感激不尽的！就酱~  

## 特性

* ADGuard Home
* [OpenClash](https://github.com/vernesong/OpenClash)
* 网络唤醒
* DDNS
* 更多功能自行刷入查看(可能会不定期变动)...

## 刷入教程

您是要刷[ImmortalWrt](tutorial/ImmortalWrt.md)还是刷[OpenWrt](tutorial/OpenWrt.md)呢？

## 后台进入方式和密码

   | 项目 | 值 |
   | :--- | :--- |
   | 默认后台地址 | `192.168.2.1` |
   | 默认后台密码 | `无密码` |

## 其它教程（大多数教程均来自互联网，此处作备份用） <a id="tutorial"></a>

* [如何更新固件](tutorial/ru-he-geng-xin-gu-jian.md)
* [在刷入uboot后如何刷回官方固件](tutorial/with-uboot-Flashback-to-stock-firmware.md)
* [让AdGuard Home和OpenClash共存(自己做的设置，测试适用于本固件)](tutorial/adguard-openclash.md)
* [AX6双系统](tutorial/ax6-dualsystm.md)

## 截图

![luci\_admin\_status\_overview](.gitbook/assets/AX6-OP.png)

## 已知问题
#### 免责声明：以下已知问题均为个人实测，可能还有未知问题，本人不对因固件导致的任何问题承担任何责任
AX6(仅LEDE系固件会出现这种情况，目前已经放弃)：<br>
~~* 截止到本文编辑完毕，由于ax6的内存泄露问题依然没解决，所以我的个人建议是每隔一段时间重启，通过系统——启动项——本地启动脚本补充以下命令（注意：要在exit 0之前）：~~
   ```bash
   echo "0 4 * * * sleep 5 && touch /etc/banner && reboot" >> /etc/crontabs/root
   echo "0 16 * * * sleep 5 && touch /etc/banner && reboot" >> /etc/crontabs/root
   ```
   ~~然后重启一次路由器 这样就会在每天凌晨4点和下午16点重启，如果能看懂crontab的原理的话也可以自定义重启时间~~
   
* (更新)因为内存导致的luci卡死问题似乎修复了(至少我开机好几天没见luci崩溃了)，~~不过由于5.15内核源码的原因，开不了160Mhz~~
* (再次更新)若要开160Mhz请在网络-无线项目找到Generic 802.11acaxn，点击编辑，将信道设置成48(亲测可用，也可以尝试其它信道)，然后在高级设置下把国家设置为US - United States，保存并应用设置，等待一分钟左右即可


## 感谢

* [Microsoft Azure](https://azure.microsoft.com/)
* [GitHub Actions](https://github.com/features/actions)
* [OpenWRT](https://github.com/openwrt/openwrt)
* [ImmortalWrt](https://github.com/immortalwrt/immortalwrt)
* [tmate](https://github.com/tmate-io/tmate)
* [P3TERX](https://github.com/P3TERX)
* [smith97](https://www.right.com.cn/forum/thread-6054985-1-1.html)
* [robimarko/openwrt](https://github.com/robimarko/openwrt/tree/ipq807x-5.15)<br>
* 以及所有跟OpenWRT/ImmortalWrt等相关的贡献者
