#!/bin/bash
#=================================================
# File name: preset-clash-core.sh
# Usage: <preset-clash-core.sh $platform> | example: <preset-clash-core.sh armv8>
# System Required: Linux
# Version: 1.0
# Lisence: MIT
# Author: SuLingGG
# Blog: https://mlapp.cn
#=================================================

mkdir -p files/etc/openclash/core
#mkdir -p files/usr/share/openclash/ui

CORE_VERSION="$(curl -fsSL https://raw.githubusercontent.com/vernesong/OpenClash/core/master/core_version | grep '^[0-9].*')"
CLASH_DEV_URL="https://raw.githubusercontent.com/vernesong/OpenClash/core/master/dev/clash-linux-${1}.tar.gz"
CLASH_TUN_URL="https://raw.githubusercontent.com/vernesong/OpenClash/core/master/premium/clash-linux-${1}-${CORE_VERSION}.gz"
CLASH_META_URL="https://raw.githubusercontent.com/vernesong/OpenClash/core/master/meta/clash-linux-${1}.tar.gz"
GEOIP_URL="https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geoip.dat"
GEOSITE_URL="https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geosite.dat"
#YACD_META_URL="https://raw.githubusercontent.com/DustinWin/clash-tools/main/Yacd-meta/Yacd-meta.tar.gz"

wget -qO- $CLASH_DEV_URL | tar xOvz > files/etc/openclash/core/clash
wget -qO- $CLASH_TUN_URL | gunzip -c > files/etc/openclash/core/clash_tun
wget -qO- $CLASH_META_URL | tar xOvz > files/etc/openclash/core/clash_meta
wget -qO- $GEOIP_URL > files/etc/openclash/GeoIP.dat
wget -qO- $GEOSITE_URL > files/etc/openclash/GeoSite.dat
wget -qO- YACD_META_URL > tar xOvz > files/usr/share/openclash/ui/yacd


chmod +x files/etc/openclash/core/clash*
#chmod +x files/usr/share/openclash/ui/yacd
