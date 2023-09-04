#
# (с) 2023 gSpot (https://github.com/gSpotx2f/ss_checker)
#

include $(TOPDIR)/rules.mk

PKG_NAME:=ss_checker
PKG_VERSION:=1.1
PKG_RELEASE:=1
PKG_MAINTAINER:=gSpot <https://github.com/gSpotx2f/ss_checker>

include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)
  SECTION:=net
  CATEGORY:=Network
  TITLE:=Shadowsocks checker
  URL:=https://github.com/gSpotx2f/ss_checker
  PKGARCH:=all
  DEPENDS:=+lua +luci-lib-nixio
endef

define Package/$(PKG_NAME)/description
  Checking the availability of the Shadowsocks server.
endef

define Package/$(PKG_NAME)/conffiles
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) ./files/usr/bin/ss_checker $(1)/usr/bin/ss_checker
	$(INSTALL_BIN) ./files/usr/bin/ss_set_server.sh $(1)/usr/bin/ss_set_server.sh
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
