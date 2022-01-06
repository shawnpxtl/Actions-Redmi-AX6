> 原帖：https://www.right.com.cn/forum/thread-6054985-1-1.html 此处仅做镜像

# 一些提示：
说明：按照我之前不扩容教程刷机的小伙伴，可以直接用小米救砖工具恢复小米原厂系统，再进行以下操作<br>
已扩容并刷入OpenWrt，且在12分区刷过xiaomimtd12.bin的小伙伴，可以先打以下命令
```bash
fw_setenv flag_last_success 0
fw_setenv flag_boot_rootfs 0
reboot
```
然后从[2.4](#24-刷入qsdk固件)开始继续刷

# 准备工具：
软件：Winscp、Putty、AX6 1.0.18固件、openwrt固件、QSDK固件<br>
硬件：Redmi AX6、另外一个已经刷了OpenWRT的任意路由器(PS:软路由能使用你的无线网卡并且发送信号理论上也可以)<br>
链接：https://pan.baidu.com/s/1qmfOPbM_XpW62SqU0V77AQ<br>
提取码：jtow

> OpenWrt固件为lean源码编译（后期可自行升级，固件最好在29MB以下），QSDK固件为志平大佬2021.10.07版本

# 正式刷机：
## 1. 解锁ssh

### 1.1 不保留配置降级小米AX6固件至1.0.18
进入路由后台，然后找到系统状态，点击手动升级，找到固件，不保存降级即可

### 1.2 准备另一台已刷openwrt的路由器B
打开winscp，文件协议选择scp，登录到路由器B，并把wireless.sh文件上传到root目录下，然后打开Putty，ssh登录，输入以下命令：`sh /root/wireless.sh`

### 1.3 解锁AX6 ssh
用网线连接AX6路由器，获取AX6后台STOK且登陆小米路由器后台后，复制浏览器地址栏 stok= 后面的一段内容，准备好备用。<br>

第一次请求：将stok替换为刚刚复制的，并填写路由器B的无线ssid和密码，地址：`http://192.168.31.1/cgi-bin/luci/;stok=<STOK>/api/misystem/extendwifi_connect?ssid=路由器B的无线名称(最好是2.4G)&password=路由器B的无线密码` 出现code=0，即为成功<br>

第二次请求：只替换stok既可，其他不需要改，地址：`http://192.168.31.1/cgi-bin/luci/;stok=<STOK>/api/xqsystem/oneclick_get_remote_token?username=xxx&password=xxx&nonce=xxx`显示code 0，即为成功

## 2. 刷入QSDK固件

### 2.1 用putty登录AX6
用户名：root，密码：AX6的无线密码（此时密码已改变，需要进后台查看），登录ssh后逐一拷贝以下命令：
```bash
nvram set flag_last_success=0
nvram set flag_boot_rootfs=0
nvram set flag_boot_success=1
nvram set flag_try_sys1_failed=0
nvram set flag_try_sys2_failed=0
nvram set boot_wait=on
nvram set uart_en=1
nvram set telnet_en=1
nvram set ssh_en=1
nvram commit
```

### 2.2 写入QSDK过度固件
用winscp把固件xiaomimtd12.bin传到路由器tmp目录，ssh命令打以下：`mtd write /tmp/xiaomimtd12.bin rootfs` 命令执行完成后，拨电源重新启动路由器

### 2.3 扩容分区
QSDK后台地址：`192.168.1.1`，用户名：`root`，无密码，用winscp把固件`a6minbib.bin`传到路由器tmp目录，ssh打以下命令刷分区表
```bash
. /lib/upgrade/platform.sh
switch_layout boot; do_flash_failsafe_partition a6minbib "0:MIBIB"
```
命令执行完成后，拔电源重启路由器

### 2.4 刷入QSDK固件
用putty和winscp重新登录192.168.1.1，然后用scp把固件openwrt-ipq-ipq807x_64-xiaomi_ax6-squashfs-nand-factory.bin传到路由器tmp目录，ssh打以下命令
```bash
ubiformat /dev/mtd13 -y -f /tmp/openwrt-ipq-ipq807x_64-xiaomi_ax6-squashfs-nand-factory.bin
fw_setenv flag_last_success 1
fw_setenv flag_boot_rootfs 1
reboot
```
## 3. 刷入openwrt固件
等待系统重启后，进入QSDK后台（192.168.1.1，高级，继续前往），添加密码，用putty和winscp重新登录192.168.1.1，然后用winscp把固件openwrt-5.10.63-redmi_ax6-squashfs-nand-factory.ubi传到路由器tmp目录，ssh打以下命令
```bash
ubiformat /dev/mtd12 -y -f /tmp/openwrt-5.10.63-redmi_ax6-squashfs-nand-factory.ubi
fw_setenv flag_last_success 0
fw_setenv flag_boot_rootfs 0
reboot
```
等待系统重启后，进入openwrt固件，在网页端不保留配置刷入openwrt-5.10.70-redmi_ax6-squashfs-nand-sysupgrade.bin，刷机结束

## OpenWrt和QSDK互相切换命令
OpenWrt切换QSDK：
```bash
fw_setenv flag_last_success 1
fw_setenv flag_boot_rootfs 1
reboot
```

QSDK切换OpenWrt：
```bash
fw_setenv flag_last_success 0
fw_setenv flag_boot_rootfs 0
reboot
```

## 后台进入方式和密码
   | --- | --- | --- |
   | 固件名 | `QSDK` | `OpenWRT` |
   | 默认后台地址 | `192.168.1.1` | `192.168.1.1` |
   | 默认用户名 | `root` | `root` |
   | 默认后台密码 | `无` | `password` |

友情提示：QSDK有一些小问题，进入后台时，选择“高级——继续前往"即可

## 参考
https://qust.me/post/hong-mi-ax6-jie-suo-ssh-an-zhuang-shi-yong-shellclash-jiao-cheng/（ax6解锁ssh）<br>
https://www.right.com.cn/forum/thread-4111331-1-1.html（ax6扩容刷QSDK）
