1. First flash into the official partition table and uboot of ZhiPing [partition table](https://www.right.com.cn/forum/thread-8253493-1-1.html) [ZhiPing uboot](https://www.right.com.cn/FORUM/thread-8253375-1-1.html) 
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
