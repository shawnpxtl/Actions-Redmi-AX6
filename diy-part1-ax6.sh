# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Add a feed source
echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
# echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default

# edit getver
sed -i 's/ee53a240ac902dc83209008a2671e7fdcf55957a/84b5e3bc5c9b04712a01c3f91552fd74778feb1f/g' scripts/getver.sh