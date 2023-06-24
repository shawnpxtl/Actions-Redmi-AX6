> 感谢[恩山论坛fite520的教程](https://www.right.com.cn/forum/thread-8236039-1-1.html "恩山论坛fite520的教程")，相关文件可在原帖找到或者最后我的备份，本文只为备份，如有侵权可联系我删除

**⚠⚠⚠注意：此操作有概率成砖风险，原帖已有人刷成砖！不过你既然都通过uboot刷入第三方固件了那么问题应该不大吧？总之本人不负责因为任何操作导致刷成砖的情况~⚠⚠⚠**

# 那么，教程正式开始！
1. 首先通过网线让电脑与路由器连接
2. 然后使用WinSCP工具进入小米后台，将解压后的两个ubi格式文件（mibib.bin、appsbl.bin）上传至tmp根目录下。
3. 随后使用Putty软件，SSH连接路由器，输入以下命令查看分区确认 mtd1 和 mtd7 的分区是否存在：
```
cat /proc/mtd
```
4. 不出意外的话输出理论上是这个样子的（你们显示的如果和这个大差不差的话那么问题不大）：
```
root@lede:~# cat /proc/mtd
dev: size erasesize name
mtd0: 00100000 00020000 “0:sbl1”
mtd1: 00100000 00020000 “0:mibib”
mtd2: 00300000 00020000 “0:qsee”
mtd3: 00080000 00020000 “0:devcfg”
mtd4: 00080000 00020000 “0:rpm”
mtd5: 00080000 00020000 “0:cdt”
mtd6: 00080000 00020000 “0:appsblenv”
mtd7: 00100000 00020000 “0:appsbl”
mtd8: 00080000 00020000 “0:art”
mtd9: 00080000 00020000 “bdata”
mtd10: 00080000 00020000 “crash”
mtd11: 00080000 00020000 “crash_syslog”
mtd12: 023c0000 00020000 “rootfs”
mtd13: 023c0000 00020000 “rootfs_1”
mtd14: 01ec0000 00020000 “overlay”
mtd15: 00080000 00020000 “rsvd0”
root@lede:~#
```
5. 确认存在无误即可后开始刷写，SSH连接路由器依次输入以下命令（OpenWrt官方源码无效，如果介意建议使用ImmortalWrt）：
```
mtd erase /dev/mtd1
mtd write /tmp/mibib.bin /dev/mtd1
mtd erase /dev/mtd7
mtd write /tmp/appsbl.bin /dev/mtd7
```
6. 输入完命令一分钟后，路由器断电并设置电脑ip为192.168.31.100
7. **此步骤特别注意：确保通过网线电脑与路由器连接，在使用小米修复工具之前请先退出任何杀毒/安全软件，还有win10/win11的自带windows Defender（实在不行换台带网线口的电脑吧...），修复工具才会传包给路由器修复。**
8. 打开小米路由修复工具，按住路由器reset开机后选择显示为192.168.31.100的网卡，随后进入救砖待机界面，再次断电，重新按住reset键插电橙灯闪烁后松手。
9. 然后我们看到救砖软件里面开始上传固件后机器开始蓝灯闪烁，此时需等待至少1分钟，然后先断电再重新插电即可恢复到官方系统。

PS：（此为原作者遇到的情况，如果你们也遇到可以试试）如果最后一步重新插电后没能刷进官方系统，那再次使用小米修复工具按照流程修复一遍即可。

### 最后附上我的备份(此处只有AX6，ax3600可以去原帖下载)：[Google Drive](https://drive.google.com/file/d/1G3XfI3kBoj7iHb1pOFV6NweGGzXRZSJe/view?usp=sharing "Google Drive")  [123网盘(提取码:Gi1Z)](https://www.123pan.com/s/o17DVv-dClm "123网盘(提取码:Gi1Z)")
