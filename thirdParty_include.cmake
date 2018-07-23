if(DEFINED ThirdPartyRoot)
else()
    set(ThirdPartyRoot ${PROJECT_SOURCE_DIR}/thirdParty)
endif()

include_directories(${ThirdPartyRoot}/curl/include)
include_directories(${ThirdPartyRoot}/glog/src)
include_directories(${ThirdPartyRoot}/double-conversion)
include_directories(${ThirdPartyRoot}/spdlog/include)
include_directories(${ThirdPartyRoot}/rapidjson/include)
include_directories(${ThirdPartyRoot}/libevent/include)
include_directories(${ThirdPartyRoot}/folly)
include_directories(${ThirdPartyRoot}/wangle)
include_directories(${ThirdPartyRoot}/nlohmann/include)


set(Protobuf_INCLUDE_DIR ${ThirdPartyRoot}/protobuf-3.4.x/src)
include_directories(${Protobuf_INCLUDE_DIR})

if(IOS)

include_directories(${ThirdPartyRoot}/boost/xcode/include)
include_directories(${ThirdPartyRoot}/build/xcode/curl/include/curl)
include_directories(${ThirdPartyRoot}/build/xcode/curl/lib)
include_directories(${ThirdPartyRoot}/build/xcode/libevent/include)
include_directories(${ThirdPartyRoot}/build/xcode/glog)
include_directories(${ThirdPartyRoot}/build/xcode/openssl/include)
include_directories(${CMAKE_CURRENT_BINARY_DIR}/thirdParty/gflags/gflags/include)

elseif(ANDROID)

include_directories(${ThirdPartyRoot}/boost/android)
include_directories(${ThirdPartyRoot}/build/android/curl/${ANDROID_ABI}/include/curl)
include_directories(${ThirdPartyRoot}/build/android/glog/${ANDROID_ABI})
include_directories(${ThirdPartyRoot}/build/android/libevent/${ANDROID_ABI}/include)
include_directories(${ThirdPartyRoot}/build/android/openssl/${ANDROID_ABI}/include)
include_directories(${ThirdPartyRoot}/build/android/libffcall/${ANDROID_ABI}/include)
include_directories(${ThirdPartyRoot}/build/android/gflags_nothreads_static/${ANDROID_ABI}/include)
include_directories(${ThirdPartyRoot}/build/android/folly/${ANDROID_ABI})

elseif(LINUX_PC)
##include_directories(${ThirdPartyRoot}/build/linux/x64${ANDROID_ABI}/include)
include_directories(${ThirdPartyRoot}/build/linux/x64/libevent/include)
include_directories(${ThirdPartyRoot}/build/linux/x64/curl/include/curl)
include_directories(${ThirdPartyRoot}/build/linux/x64/glog)
include_directories(${ThirdPartyRoot}/build/linux/x64/folly)
include_directories(${ThirdPartyRoot}/build/linux/x64/gflags_nothreads_static/include)

elseif(MSVC)
include_directories(${ThirdPartyRoot}/boost/msvc/boost_1_64_0)
set(BOOST_ROOT ${ThirdPartyRoot}/boost/msvc/boost_1_64_0)
include_directories(${ThirdPartyRoot}/glog/src)
include_directories(${ThirdPartyRoot}/build/msvc/openssl/include)
include_directories(${ThirdPartyRoot}/nghttp2/lib/includes)
include_directories(${ThirdPartyRoot}/libevent/WIN32-Code/nmake)
include_directories(${CMAKE_CURRENT_BINARY_DIR}/thirdParty/libevent/include)
include_directories(${CMAKE_CURRENT_BINARY_DIR}/thirdParty/curl/include/curl)
include_directories(${ThirdPartyRoot}/build/msvc/gflags_nothreads_static/include)
include_directories(${CMAKE_CURRENT_BINARY_DIR}/thirdParty/nghttp2)
include_directories(${CMAKE_CURRENT_BINARY_DIR}/thirdParty/nghttp2/lib/includes)
include_directories(${ThirdPartyRoot}/build/msvc/glog)
include_directories(${ThirdPartyRoot}/build/msvc/pthread/include)
include_directories(${ThirdPartyRoot}/build/msvc/folly)

if(XLN_BUILD_SERVER)
include_directories(${ThirdPartyRoot}/build/msvc/kfw/include)
endif()
endif()

if(XLN_BUILD_SERVER)
include_directories(${ThirdPartyRoot}/fbthrift)
endif()