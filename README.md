简体中文 | [English](./README.en-US.md)

# 关于这个仓库

> 这个仓库基于[P3TERX/Actions-OpenWrt](https://github.com/P3TERX/Actions-OpenWrt)

用Github Actions为K2P和AX6自动编译固件

## 特性

* PassWall(K2P Only)
* OpenClash(AX6 Only，因为K2P那16M存储塞不下)
* Turbo ACC
* 更多功能自行刷入查看...

## 针对AX6的说明

1. 上传自己的`AX6.config`文件
2. 进入Actions页面手动启动编译
3. 当编译完成后，在Releases页面下载含编译出的xxx-factory.ubi固件(如果要在op下升级则是下载xxx-sysupgrade.bin后缀的固件)
4. 如果你此前给AX6刷入了双系统，请输入`nvram set flag_last_success=1`和`nvram set flag_boot_rootfs=1`然后重启设备切换系统（没有的话请点击[参考链接](https://www.right.com.cn/forum/thread-6054985-1-1.html) [GitHub镜像](.gitbook/assets/ax6-dualsystm.md)安装双系统）
5. 通过scp上传后缀为.ubi的固件
6. 刷入固件`ubiformat /dev/mtd13 -y -f /tmp/openwrt-xxx-redmi_ax6-squashfs-nand-factory.ubi`PS：文件名只是个例子，刷入时以你下载的ubi文件名为准
7. 输入`nvram set flag_last_success=0`和`nvram set flag_boot_rootfs=0`然后重启设备，完成

## 针对K2P的说明

1. 上传自己的`K2P.config`文件
2. 进入Actions页面手动启动编译
3. 当编译完成后，在Releases页面下载含编译出的xxx-sysupgrade.bin固件
4. 进入breed，选择⚠️斐讯布局⚠️刷入压缩包中含sysupgrade字样的文件

## 后台进入方式和密码

   | 项目 | 值 |
   | :--- | :--- |
   | 默认后台地址 | `192.168.2.1` |
   | 默认后台密码 | `password` |

## 教程 <a id="tutorial"></a>

* [如何更新固件](tutorial/ru-he-geng-xin-gu-jian.md)

## 截图

K2P：
![luci\_admin\_status\_overview](.gitbook/assets/K2P-OP.png)
AX6：
![luci\_admin\_status\_overview](.gitbook/assets/AX6-OP.png)


## 注意
K2P目前问题：
* Redmi K30 Ultra等MTK天玑1000+设备(不知道其它天玑设备有没有被波及)可能只有433Mbps(至少本人手机是这样)，目前尚未查明原因，如果知道原因，欢迎提issue。

![K30U\_Issues](https://i.loli.net/2021/03/18/TsXa75gWvLr3wOI.jpg)

AX6目前问题：
* As of the editing of this article, since the memory leak problem of ax6's openwrt is still unresolved, my personal suggestion is to restart every once in a while and add the following commands through the system-startup item-local startup script (note: to exit Before 0):
   ```bash
   echo "0 4 * * * sleep 5 && touch /etc/banner && reboot" >> /etc/crontabs/root
   echo "0 16 * * * sleep 5 && touch /etc/banner && reboot" >> /etc/crontabs/root
   ```
   Then restart the router once. It will restart at 4 am and 16 pm every day. If you can understand the principle of crontab, you can also customize the restart time.
