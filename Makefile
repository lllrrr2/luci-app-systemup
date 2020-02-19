include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-systemup
PKG_VERSION:=3.3
PKG_RELEASE:=36

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/host-build.mk

define Package/luci-app-systemup
	SECTION:=luci
	CATEGORY:=LuCI
	SUBMENU:=3. Applications
	TITLE:=AutoUpdateSystem
	PKGARCH:=all
	DEPENDS:= +curl +wget
endef

define Package/luci-app-systemup/description
	auto get pub ip,systemup ddns,must include curl with ssl
endef

define Build/Prepare
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/luci-app-systemup/install
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/model/cbi
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/controller

	$(INSTALL_CONF) ./files/root/etc/config/systemup $(1)/etc/config/systemup
	$(INSTALL_BIN) ./files/root/etc/init.d/systemup $(1)/etc/init.d/systemup
	$(INSTALL_DATA) ./files/root/usr/lib/lua/luci/model/cbi/systemup.lua $(1)/usr/lib/lua/luci/model/cbi/systemup.lua
	$(INSTALL_DATA) ./files/root/usr/lib/lua/luci/controller/systemup.lua $(1)/usr/lib/lua/luci/controller/systemup.lua
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) ./files/systemup.sh $(1)/usr/sbin
endef

$(eval $(call BuildPackage,luci-app-systemup))


