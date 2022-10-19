[![GitHub release (latest by date)](https://img.shields.io/github/v/release/InfinityTL/OpenWrt-Redmi-AX6-Robi?style=for-the-badge&label=下载)](https://github.com/InfinityTL/OpenWrt-Redmi-AX6-Robi/releases/latest)

# 关于这个仓库

> 这个仓库基于[P3TERX/Actions-OpenWrt](https://github.com/P3TERX/Actions-OpenWrt)<br>
> OpenWRT分支来自[robimarko/openwrt](https://github.com/robimarko/openwrt/tree/ipq807x-5.15-pr)<br>

用Github Actions为AX6自动编译固件

## Redmi AX6 参数

![luci\_admin\_status\_overview](.gitbook/assets/redmi-ax6.jpg)

   | 参数 | 值 |
   | :--- | :--- |
   | CPU | [Qualcomm Pro 600 Series IPQ8071A](https://www.qualcomm.com/products/application/networking/qualcomm-networking-pro-600-platform) |
   | CPU频率 | 4xA53 1.4GHz |
   | 闪存 | 128MB |
   | 内存 | 512MB |
   | 无线速率 | 3000Mbps (5GHz:2402Mbps,2.4GHz:572Mbps) |
   | 无线协议 | 802.11ax (WIFI 6) |
   | 网口 | 10/100/1000Mbps x4 |

#### 注意：部分参数可能只有官方固件能用的到

## 特性

* [OpenClash](https://github.com/vernesong/OpenClash)
* 网易云解锁
* 网络唤醒
* DDNS
* Python(主要是因为要挂原神和米游社签到脚本用，所以路由器固件才这么大的😂)
* 更多功能自行刷入查看(可能会不定期变动)...

## 针对AX6的说明

1. 上传自己的`AX6.config`文件
2. 进入Actions页面手动启动编译
3. 当编译完成后，在Releases页面下载含编译出的`xxx-factory.ubi`固件(如果要在op下升级则是下载`xxx-sysupgrade.bin`后缀的固件)
4. 如果你此前给AX6刷入了双系统，请输入`fw_setenv flag_last_success=1`和`fw_setenv flag_boot_rootfs=1`然后重启设备切换系统（没有的话请点击[参考链接](https://www.right.com.cn/forum/thread-6054985-1-1.html) [GitHub镜像](.gitbook/assets/ax6-dualsystm.md)安装双系统）
5. 通过scp上传后缀为.ubi的固件
6. 刷入固件`ubiformat /dev/mtd13 -y -f /tmp/openwrt-xxx-redmi_ax6-squashfs-nand-factory.ubi`PS：文件名只是个例子，刷入时以你下载的ubi文件名为准
7. 输入`fw_setenv flag_last_success=0`和`fw_setenv flag_boot_rootfs=0`然后重启设备，完成

## 针对AX6的说明（刷了uboot之后）

1. 没有刷入的话请先刷入uboot，刷入过的直接第二步 [123网盘(提取码：88g5 压缩包密码：RA69)](https://www.123pan.com/s/o17DVv-hClm) [Google Drive(压缩包密码：RA69)](https://drive.google.com/file/d/1cuJoNP-8yTMXOVPIBPK1KmOOsvPcJbFU/view?usp=sharing)
2. 刷入后请插入电源并同时使用卡针或任何物件按住AX6路由器Reset孔5秒直至红灯亮起，修改ip为192.168.1.10、网关为192.168.1.1以进入uboot
3. 上传.ubi后缀的固件，等待自动重启，完成

## 后台进入方式和密码

   | 项目 | 值 |
   | :--- | :--- |
   | 默认后台地址 | `192.168.2.1` |
   | 默认后台密码 | `password` |

## 其它教程（均来自互联网，此处作备份用） <a id="tutorial"></a>

* [如何更新固件](tutorial/ru-he-geng-xin-gu-jian.md)
* [在刷入uboot后如何刷回官方固件](tutorial/with-uboot-Flashback-to-stock-firmware.md)

## 截图

![luci\_admin\_status\_overview](.gitbook/assets/AX6-OP.png)

## 已知问题
#### 免责声明：以下已知问题均为个人实测，可能还有未知问题，本人不对因固件导致的任何问题承担担任何责任
AX6：<br>
~~* 截止到本文编辑完毕，由于ax6的内存泄露问题依然没解决，所以我的个人建议是每隔一段时间重启，通过系统——启动项——本地启动脚本补充以下命令（注意：要在exit 0之前）：~~
   ```bash
   echo "0 4 * * * sleep 5 && touch /etc/banner && reboot" >> /etc/crontabs/root
   echo "0 16 * * * sleep 5 && touch /etc/banner && reboot" >> /etc/crontabs/root
   ```
   ~~然后重启一次路由器 这样就会在每天凌晨4点和下午16点重启，如果能看懂crontab的原理的话也可以自定义重启时间~~
   
* (更新)因为内存导致的luci卡死问题似乎修复了(至少我开机好几天没见luci崩溃了)，不过由于5.15内核源码的原因，开不了160Mhz

## 感谢

* [Microsoft Azure](https://azure.microsoft.com/)
* [GitHub Actions](https://github.com/features/actions)
* [OpenWRT](https://github.com/openwrt/openwrt)
* [tmate](https://github.com/tmate-io/tmate)
* [P3TERX](https://github.com/P3TERX)
* [smith97](https://www.right.com.cn/forum/thread-6054985-1-1.html)
* [robimarko/openwrt](https://github.com/robimarko/openwrt/tree/ipq807x-5.15)<br>
* 以及所有跟OpenWRT/LEDE相关的贡献者
