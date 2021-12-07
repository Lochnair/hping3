#
# Copyright (C) 2006-2021 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=hping3
PKG_SOURCE_DATE:=2021-12-07
PKG_RELEASE:=1

PKG_SOURCE_URL:=https://github.com/antirez/hping
PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=3547c7691742c6eaa31f8402e0ccbb81387c1b99
PKG_MIRROR_HASH:=9bce78b644f4909772387486f72237b8fd3b8c883245a7153722b41e3cfce1ec

PKG_LICENSE:=GPL-2.0

include $(INCLUDE_DIR)/package.mk

define Package/hping3
  SECTION:=net
  CATEGORY:=Network
  TITLE:=hping network tool
  URL:=https://github.com/antirez/hping
endef

TARGET_CFLAGS += \
    -I$(STAGING_DIR)/usr/include -ffunction-sections -fdata-sections

TARGET_LDFLAGS += -Wl,--gc-sections

CMAKE_OPTIONS += \
    -DDEBUG=1

define Build/Configure
    $(call Build/Configure/Default,--with-linux-headers=$(LINUX_DIR))
endef

define Build/Compile
    $(TARGET_CC) $(TARGET_CFLAGS) \
        -o $(PKG_BUILD_DIR)/$(PKG_NAME)
endef

define Package/hping3/install
    $(INSTALL_DIR) $(1)/usr/sbin
    $(CP) $(PKG_BUILD_DIR)/$(PKG_NAME) $(1)/usr/sbin/
endef

define Package/hping3/description
  The hping3 tool is a highly precise ICMP tool.
endef

$(eval $(call BuildPackage,hping3))
