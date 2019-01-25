set(XLN_BUILD_gflags_nothreads_static true)
if(MSVC)
xln_add_dependency(gflags_nothreads_static ${ThirdPartyRoot}/gflags/gflags ${ThirdPartyRoot}/build . gflags_nothreads_static gflags_nothreads_staticd)
##target_link_libraries(gflags_nothreads_static PUBLIC "shlwapi.lib")
else()
xln_add_dependency(gflags_nothreads_static ${ThirdPartyRoot}/gflags/gflags ${ThirdPartyRoot}/build . gflags_nothreads gflags_nothreads)
endif()
if(IOS)
set_target_properties(gflags_nothreads_static PROPERTIES
  ARCHIVE_OUTPUT_DIRECTORY_DEBUG "/$(BUILD_DIR)/$(CONFIGURATION)$(EFFECTIVE_PLATFORM_NAME)"
  ARCHIVE_OUTPUT_DIRECTORY_RELEASE "/$(BUILD_DIR)/$(CONFIGURATION)$(EFFECTIVE_PLATFORM_NAME)")
endif()