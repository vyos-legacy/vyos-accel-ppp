SET(CPACK_PACKAGING_INSTALL_PREFIX "/usr")
SET(CPACK_PACKAGE_FILE_NAME ${CPACK_PACKAGE_NAME})

if (BUILD_DRIVER_ONLY)
	if (BUILD_PPTP_DRIVER)
		SET(CPACK_PACKAGE_VERSION_MAJOR "0")
		SET(CPACK_PACKAGE_VERSION_MINOR "8")
		SET(CPACK_PACKAGE_VERSION_PATCH "5")
		SET(CPACK_PACKAGING_INSTALL_PREFIX "/")
		SET(CPACK_PACKAGE_NAME "accel-pptp-kmod")
		SET(CPACK_PACKAGE_DESCRIPTION_SUMMARY "accel-pptp kernel module")
		SET(CPACK_DEBIAN_PACKAGE_DEPENDS "")
		SET(CPACK_DEBIAN_PACKAGE_CONTROL_EXTRA "${CMAKE_CURRENT_SOURCE_DIR}/cmake/debian-kmod/postinst")
		#INSTALL(DIRECTORY lib/modules/${DEBIAN_KDIR}/extra)
		INSTALL(FILES ${CMAKE_CURRENT_BINARY_DIR}/driver/driver/pptp.ko DESTINATION lib/modules/${DEBIAN_KDIR}/extra)
		#SET(CPACK_DEBIAN_PACKAGE_DEPENDS "linux-image (= ${LINUX_IMAGE})")
	endif (BUILD_PPTP_DRIVER)
	
	if (BUILD_IPOE_DRIVER)
		SET(CPACK_PACKAGING_INSTALL_PREFIX "/")
		SET(CPACK_PACKAGE_NAME "accel-ppp-ipoe-kmod")
		SET(CPACK_PACKAGE_DESCRIPTION_SUMMARY "accel-ppp IPoE kernel module")
		SET(CPACK_DEBIAN_PACKAGE_DEPENDS "")
		SET(CPACK_DEBIAN_PACKAGE_CONTROL_EXTRA "${CMAKE_CURRENT_SOURCE_DIR}/cmake/debian-kmod/postinst")
		INSTALL(FILES ${CMAKE_CURRENT_BINARY_DIR}/drivers/ipoe/driver/ipoe.ko DESTINATION lib/modules/${DEBIAN_KDIR}/extra)
	endif (BUILD_IPOE_DRIVER)

	if (BUILD_VLAN_MON_DRIVER)
		SET(CPACK_PACKAGING_INSTALL_PREFIX "/")
		SET(CPACK_PACKAGE_NAME "accel-ppp-vlan_mon-kmod")
		SET(CPACK_PACKAGE_DESCRIPTION_SUMMARY "accel-ppp vlan monitoring kernel module")
		SET(CPACK_DEBIAN_PACKAGE_DEPENDS "")
		SET(CPACK_DEBIAN_PACKAGE_CONTROL_EXTRA "${CMAKE_CURRENT_SOURCE_DIR}/cmake/debian-kmod/postinst")
		INSTALL(FILES ${CMAKE_CURRENT_BINARY_DIR}/drivers/vlan_mon/driver/vlan_mon.ko DESTINATION lib/modules/${DEBIAN_KDIR}/extra)
	endif (BUILD_VLAN_MON_DRIVER)
else (BUILD_DRIVER_ONLY)
	SET(CPACK_DEBIAN_PACKAGE_CONTROL_EXTRA "${CMAKE_CURRENT_SOURCE_DIR}/cmake/debian/postinst;${CMAKE_CURRENT_SOURCE_DIR}/cmake/debian/conffiles")

	if (CPACK_TYPE STREQUAL Debian6)
		INSTALL(FILES ${CMAKE_HOME_DIRECTORY}/accel-pppd/accel-ppp.conf DESTINATION ${CMAKE_BINARY_DIR}/_CPack_Packages/Linux/DEB/${CPACK_PACKAGE_FILE_NAME}/etc RENAME accel-ppp.conf.dist)
		INSTALL(FILES ${CMAKE_HOME_DIRECTORY}/contrib/debian/accel-ppp-init DESTINATION ${CMAKE_BINARY_DIR}/_CPack_Packages/Linux/DEB/${CPACK_PACKAGE_FILE_NAME}/etc/init.d RENAME accel-ppp)
		INSTALL(FILES ${CMAKE_HOME_DIRECTORY}/contrib/debian/accel-ppp-default DESTINATION ${CMAKE_BINARY_DIR}/_CPack_Packages/Linux/DEB/${CPACK_PACKAGE_FILE_NAME}/etc/default RENAME accel-ppp)
	else (CPACK_TYPE STREQUAL Debian6)
		INSTALL(FILES ${CMAKE_HOME_DIRECTORY}/accel-pppd/accel-ppp.conf DESTINATION /etc RENAME accel-ppp.conf.dist)
		INSTALL(FILES ${CMAKE_HOME_DIRECTORY}/contrib/debian/accel-ppp-init DESTINATION /etc/init.d RENAME accel-ppp)
		INSTALL(FILES ${CMAKE_HOME_DIRECTORY}/contrib/debian/accel-ppp-default DESTINATION /etc/default RENAME accel-ppp)
	endif (CPACK_TYPE STREQUAL Debian6)
endif (BUILD_DRIVER_ONLY)
