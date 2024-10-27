#!/bin/bash

CURRENT_PATH=$(pwd)

clone_or_update_git_repo() {
  # 参数检查
  if [ "$#" -lt 2 ]; then
    echo "Usage: clone_or_update_git_repo <git_url> <target_directory> [branch] [subdirectory]"
    return 1
  fi

  local git_url="$1"
  local source_target_directory="$2"
  local target_directory="$2"
  local branch="$3"
  local subdirectory="$4"

  if [ -n "$subdirectory" ]; then
    target_directory=$CURRENT_PATH/repos/$(echo "$git_url" | awk -F'/' '{print $(NF-1)"-"$NF}')
  fi

  # 检查目标目录是否存在
  if [ -d "$target_directory" ]; then
    pushd "$target_directory" || return 1
    git pull
    popd
  else
    if [ -n "$branch" ]; then
      git clone --depth=1 -b "$branch" "$git_url" "$target_directory"
    else
      git clone --depth=1 "$git_url" "$target_directory"
    fi
  fi

  if [ -n "$subdirectory" ]; then
    cp -a $target_directory/$subdirectory $source_target_directory
  fi
}

# theme
git clone --depth=1 -b master https://github.com/jerrykuku/luci-theme-argon package/waynesg/luci-theme-argon
# argon-theme-config
git clone --depth=1 -b master https://github.com/jerrykuku/luci-app-argon-config package/waynesg/luci-app-argon-config
#mosdns
git clone --depth=1 -b v5 https://github.com/sbwml/luci-app-mosdns package/waynesg/luci-app-mosdns
#ssr-plus
#clone_or_update_git_repo https://github.com/fw876/helloworld package/waynesg/luci-app-ssr-plus master luci-app-ssr-plus
#passwall
#clone_or_update_git_repo https://github.com/xiaorouji/openwrt-passwall package/waynesg/luci-app-passwall luci-smartdns-dev luci-app-passwall
git clone --depth=1 https://github.com/xiaorouji/openwrt-passwall2 package/waynesg/luci-app-passwall2
#git clone --depth=1 https://github.com/xiaorouji/openwrt-passwall-packages package/waynesg/luci-app-dependence
#git clone --depth=1 https://github.com/jerrykuku/node-request package/waynesg/luci-app-dependence/node-request
#git clone --depth=1 https://github.com/jerrykuku/lua-maxminddb package/waynesg/luci-app-dependence/lua-maxminddb
#clone_or_update_git_repo https://github.com/fw876/helloworld package/waynesg/luci-app-dependence/lua-neturl master lua-neturl
#clone_or_update_git_repo https://github.com/fw876/helloworld package/waynesg/luci-app-dependence/shadow-tls master shadow-tls    
#clone_or_update_git_repo https://github.com/kenzok8/small package/waynesg/luci-app-dependence/redsocks2 "" redsocks2
#clone_or_update_git_repo https://github.com/kiddin9/kwrt-packages package/waynesg/luci-app-dependence/wrtbwmon "" wrtbwmon
#clone_or_update_git_repo https://github.com/xiaorouji/openwrt-passwall-packages package/waynesg/ main 
#smartdns
git clone --depth=1 -b master https://github.com/pymumu/luci-app-smartdns package/waynesg/luci-app-smartdns
git clone --depth=1 https://github.com/pymumu/openwrt-smartdns package/waynesg//luci-app-smartdns/smartdns
#openclash
git clone --depth=1 -b dev https://github.com/vernesong/OpenClash package/waynesg/luci-app-openclash
#serverchan
#git clone --depth=1 -b master https://github.com/tty228/luci-app-wechatpush package/waynesg/luci-app-wechatpush
#openappfilter
git clone --depth=1 https://github.com/destan19/OpenAppFilter package/waynesg/luci-app-oaf
#fileassistant
#clone_or_update_git_repo https://github.com/sirpdboy/sirpdboy-package package/waynesg/luci-app-fileassistant "" luci-app-fileassistant
#unblockneteasemusic
git clone --depth=1 -b js https://github.com/UnblockNeteaseMusic/luci-app-unblockneteasemusic package/waynesg/luci-app-unblockneteasemusic
#onliner
clone_or_update_git_repo https://github.com/Hyy2001X/AutoBuild-Packages package/waynesg/luci-app-onliner "" luci-app-onliner
#alist
#git clone --depth=1 -b lua https://github.com/sbwml/luci-app-alist package/waynesg/luci-app-alist
#clone_or_update_git_repo https://github.com/sbwml/luci-app-alist package/waynesg/luci-app-alist master alist
#parents-control
git clone --depth=1 https://github.com/sirpdboy/luci-app-parentcontrol package/waynesg/luci-app-parentcontrol
#airconnect
git clone --depth=1 -b main https://github.com/sbwml/luci-app-airconnect package/waynesg/luci-app-airconnect
clone_or_update_git_repo https://github.com/sbwml/luci-app-airconnect package/waynesg/luci-app-airconnect main airconnect
#homeproxy
#git clone --depth=1 https://github.com/immortalwrt/homeproxy package/waynesg/luci-app-homeproxy
#mihomo proxy
#git clone --depth=1 https://github.com/morytyann/OpenWrt-mihomo.git package/waynesg/luci-app-mihomo
#subconverter
git clone --depth=1 https://github.com/tindy2013/openwrt-subconverter package/waynesg/luci-app-subconverter
#cpu status
git clone --depth=1 https://github.com/gSpotx2f/luci-app-cpu-status package/waynesg/luci-app-cpu-status
#tn-netports
git clone --depth=1 https://github.com/muink/luci-app-tn-netports package/waynesg/luci-app-tn-netports
#socat
clone_or_update_git_repo https://github.com/Lienol/openwrt-package package/waynesg/luci-app-socat main luci-app-socat


