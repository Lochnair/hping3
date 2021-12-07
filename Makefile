#
# Copyright (C) 2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=hping3
PKG_SOURCE_DATE:=2021-12-07
PKG_RELEASE:=1

PKG_SOURCE_URL:=https://github.com/Lochnair/hping
PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=863e77635da6fcc4e8e55eefad8758337095cfa1

include $(INCLUDE_DIR)/package.mk

define Package/hping3
  SECTION:=net
  CATEGORY:=Network
  TITLE:=TCP/IP packet assembler/analyzer
  URL:=http://www.hping.org/
  DEPENDS:=+libpcap +libpthread
endef

define Package/hping3/description
        hping is a command-line oriented TCP/IP packet assembler/analyzer. The interface is
        inspired to the ping(8) unix command, but hping isn't only able to send ICMP echo
        requests. It supports TCP, UDP, ICMP and RAW-IP protocols, has a traceroute mode, the
        ability to send files between a covered channel, and many other features.
endef

define Build/Configure
	$(call Build/Configure/Default,'--no-tcl')
endef

define Package/hping3/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/hping3 $(1)/usr/sbin/hping3
endef

$(eval $(call BuildPackage,hping3))
