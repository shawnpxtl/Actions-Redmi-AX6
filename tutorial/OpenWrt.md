1. 先刷入官方分区表和志平的uboot[分区表](https://www.right.com.cn/forum/thread-8253493-1-1.html) [志平uboot](https://www.right.com.cn/FORUM/thread-8253375-1-1.html)
2. 用[winscp](https://winscp.net/eng/download.php)等一切方法将uboot和分区表传输至ax6路由器
3. 进入ax6的ssh，依次输入以下命令：
```
mtd erase /dev/mtd1
mtd write /tmp/(您下载的mibib分区表).bin /dev/mtd1
mtd erase /dev/mtd7
mtd write /tmp/(您下载的uboot).bin /dev/mtd7
```
4. 拔电重启机器，同时拿针等细物按住reset孔，等蓝灯亮后将电脑IP地址设置为192.168.1.10，网关设置为192.168.1.1
5. 浏览器进入192.168.1.1，刷入***-initramfs-factory.ubi
6. 改回DHCP，进入路由器后台，按照[如何更新固件](tutorial/ru-he-geng-xin-gu-jian.md)刷入***-squashfs-sysupgrade.bin
7. 完事
