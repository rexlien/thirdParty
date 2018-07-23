function(xln_wangle_include)
    set(FOLLY_INCLUDE_DIR ${ThirdPartyRoot}/folly ${ThirdPartyRoot}/folly)
    set(FOLLY_LIBRARY "")
    set(LIBDL_LIBRARY "")
    set(LIBRT_LIBRARY "")
    ##wangle##
    set(GLOG_LIBRARY glog)
    set(GLOG_INCLUDE_DIR ${ThirdPartyRoot}/glog/src)
    set(GFLAGS_INCLUDE_DIR ${ThirdPartyRoot}/gflags/gflags/src)
    set(GFLAGS_LIBRARY gflags_nothreads_static)
    set(LIBEVENT_INCLUDE_DIR ${ThirdPartyRoot}/libevent/include)
    set(LIBEVENT_LIB libevent)
    set(LIBEVENT_LIBRARY libevent)
    set(LIBPTHREAD_LIBRARIES "")
    set(LIBPTHREAD_INCLUDE_DIRS "")
    set(DOUBLE_CONVERSION_INCLUDE_DIR ${ThirdPartyRoot}/double-conversion/double-conversion)
    set(DOUBLE_CONVERSION_LIBRARY double-conversion)
    
    set(XLN_BUILD_wangle true)
    xln_add_dependency(wangle ${ThirdPartyRoot}/wangle/wangle ${ThirdPartyRoot}/build . wangle wangle)
   
endfunction()

xln_wangle_include()