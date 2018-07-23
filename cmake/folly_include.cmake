function(xln_folly_include)


set(DOUBLE_CONVERSION_INCLUDE_DIR ${PROJECT_BINARY_DIR}/thirdParty/double-conversion/double-conversion)
set(DOUBLE_CONVERSION_LIBRARY double-conversion)
set(DOUBLE_CONVERSION double-conversion)
set(FOLLY_HAVE_PTHREAD ON)
set(pthreadLibName pthread)
if(ANDROID)
  ##WORKAROUND: android has pthread implementation already in it's default libs, but folly will add 
  ##-lphtread, and during link phase it causes link error, so use atomic as a replacement
  ##to make linker calm...
  set(pthreadLibName atomic)
endif()
set(LIBPTHREAD_INCLUDE_DIRS "")
set(LIBPTHREAD_LIBRARIES ${pthreadLibName})

set(LIBEVENT_LIB libevent)
set(LibEvent_LIB_PATHS ${ThirdPartyRoot}/build/android/libevent/${ANDROID_ABI}/lib)
set(LibEvent_INCLUDE_PATHS ${ThirdPartyRoot}/libevent/include)

if(ANDROID OR IOS)
  set(FOLLY_USE_LIBCPP ON)
  set(FOLLY_MOBILE ON)
  set(FOLLY_HAVE_VLA 1)
  set(FOLLY_HAVE_CLOCK_GETTIME ON)  
  if(ANDROID)
    set(FOLLY_HAVE_FEATURES_H 1)
    set(FOLLY_HAVE_MEMRCHR 1)
    set(FOLLY_HAVE_MALLOC_H 1)
    set(FOLLY_HAVE_PREADV 0)
    set(FOLLY_HAVE_WEAK_SYMBOLS 1)
  elseif(IOS)
    set(FOLLY_HAVE_WEAK_SYMBOLS 0)
    set(FOLLY_HAVE_MALLOC_H 0)
  endif()
elseif(MSVC)
  set(FOLLY_HAVE_WEAK_SYMBOLS 0)
  set(FOLLY_HAVE_MALLOC_H 1)
  set(FOLLY_HAVE_VLA 0)
elseif(LINUX_PC)
  set(FOLLY_HAVE_FEATURES_H 1)
  set(FOLLY_HAVE_MEMRCHR 1)
  set(FOLLY_HAVE_MALLOC_H 1)
  set(FOLLY_HAVE_PREADV 1)
  set(FOLLY_HAVE_WEAK_SYMBOLS 1)
  set(FOLLY_HAVE_VLA 1)
  set(FOLLY_HAVE_CLOCK_GETTIME ON)
  set(FOLLY_HAVE_PTHREAD_ATFORK ON)
  set(FOLLY_HAVE_LINUX_MEMBARRIER_H ON)
  set(FOLLY_USE_LIBCPP ON)
endif()

set(XLN_BUILD_folly true)
xln_add_dependency(folly ${ThirdPartyRoot}/folly ${ThirdPartyRoot}/build . folly_base folly_base)


if(IOS)
  set_target_properties(folly PROPERTIES
                      ARCHIVE_OUTPUT_DIRECTORY_DEBUG "/$(BUILD_DIR)/$(CONFIGURATION)$(EFFECTIVE_PLATFORM_NAME)"
                      ARCHIVE_OUTPUT_DIRECTORY_RELEASE "/$(BUILD_DIR)/$(CONFIGURATION)$(EFFECTIVE_PLATFORM_NAME)")
  set_target_properties(folly_base PROPERTIES
                      ARCHIVE_OUTPUT_DIRECTORY_DEBUG "/$(BUILD_DIR)/$(CONFIGURATION)$(EFFECTIVE_PLATFORM_NAME)"
                      ARCHIVE_OUTPUT_DIRECTORY_RELEASE "/$(BUILD_DIR)/$(CONFIGURATION)$(EFFECTIVE_PLATFORM_NAME)")
endif()
if(MSVC)
  target_compile_definitions(folly_base PUBLIC GOOGLE_GLOG_DLL_DECL=)
endif()

endfunction()

xln_folly_include()