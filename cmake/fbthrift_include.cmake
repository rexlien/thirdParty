list(APPEND CMAKE_INCLUDE_PATH ${ThirdPartyRoot}/wangle)

##add_subdirectory(${ThirdPartyRoot}/mstch)
if(CMAKE_HOST_WIN32)
    set(BISON_EXECUTABLE ${ThirdPartyRoot}/build/bin/bison/win/win_bison.exe)
    set(FLEX_EXECUTABLE ${ThirdPartyRoot}/build/bin/bison/win/win_flex.exe)
elseif(CMAKE_HOST_LINUX)
    set(BISON_EXECUTABLE /usr/bin/bison)
    set(FLEX_EXECUTABLE /usr/bin/flex)
endif()

set(MSTCH_INCLUDE_DIRS ${ThirdPartyRoot}/mstch/include)
set(GFLAGS_INCLUDE_DIR ${ThirdPartyRoot}/gflags/gflags/src)
if(MSVC)
    #zlib & zstd
    list(APPEND CMAKE_INCLUDE_PATH ${ThirdPartyRoot}/build/msvc/zlib/include)
    list(APPEND CMAKE_LIBRARY_PATH ${ThirdPartyRoot}/build/msvc/zlib/lib)
    list(APPEND CMAKE_INCLUDE_PATH ${ThirdPartyRoot}/build/msvc/zstd/include)
    list(APPEND CMAKE_LIBRARY_PATH ${ThirdPartyRoot}/build/msvc/zstd/static)
    ##mustache
    set(MSTCH_LIBRARIES optimized ${ThirdPartyRoot}/build/msvc/mstch/lib/Release/mstch.lib debug ${ThirdPartyRoot}/build/msvc/mstch/lib/Debug/mstch.lib)
    ##pthread
    include_directories(${ThirdPartyRoot}/build/msvc/pthread/include)

    ##kerberoes
    set(KRB5_INCLUDE_DIRS ${ThirdPartyRoot}/build/msvc/kfw/include)
    set(KRB5_LIBRARIES ${ThirdPartyRoot}/build/msvc/kfw/lib/amd64/krb5_64.lib)    
endif()

set(FOLLY_INCLUDE_DIR ${ThirdPartyRoot}/folly ${CMAKE_CURRENT_BINARY_DIR}/thirdParty/folly)
set(GLOG_INCLUDE_DIRS ${ThirdPartyRoot}/glog/src)
set(FOLLY_LIBRARY "")
set(GLOG_LIBRARIES "")
set(WANGLE_LIBRARIES "")
#if(CMAKE_BUILD_TYPE MATCHES DEBUG)
    #set(THRIFT1 ${CMAKE_BINARY_DIR}/build/linux/x64/fbthrift/bin/thrift1)
#    set(THRIFT1 ${CMAKE_BINARY_DIR}/bin/thrift1)
#else()
#    set(THRIFT1 ${CMAKE_BINARY_DIR}/bin/thrift1)
#endif()
#set(THRIFT_TEMPLATES ${ThirdPartyRoot}/fbthrift/thrift/compiler/generate/templates)

add_subdirectory(${ThirdPartyRoot}/fbthrift ${ThirdPartyRoot}/build/linux/x64/fbthrift)
##xln_add_dependency(fbthrift ${ThirdPartyRoot}/wangle/wangle ${ThirdPartyRoot}/build . wangle wangle)

set_target_properties( thrift1 PROPERTIES RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin/ )
set_target_properties( thrift1 PROPERTIES RUNTIME_OUTPUT_DIRECTORY_DEBUG ${CMAKE_BINARY_DIR}/bin/)
set_target_properties( thrift1 PROPERTIES RUNTIME_OUTPUT_DIRECTORY_RELEASE ${CMAKE_BINARY_DIR}/bin/ )

if(MSVC)
target_compile_definitions(security PRIVATE GLOG_NO_ABBREVIATED_SEVERITIES NOMINMAX)
target_compile_definitions(thriftcpp2 PRIVATE GLOG_NO_ABBREVIATED_SEVERITIES NOMINMAX)
endif()

