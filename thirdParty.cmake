if(DEFINED ThirdPartyRoot)
else()
    set(ThirdPartyRoot "${PROJECT_SOURCE_DIR}/thirdParty")
endif()


include(${ThirdPartyRoot}/thirdParty_include.cmake)
include(${ThirdPartyRoot}/../cmake/util.cmake)



include(${ThirdPartyRoot}/cmake/libevent_include.cmake)


if(CMAKE_HOST_APPLE)
set(PYTHON_EXECUTABLE /usr/bin/python)
elseif(CMAKE_HOST_WIN32)
endif()


if(IOS)

add_library(libcurl STATIC IMPORTED)
add_library(libevent STATIC IMPORTED)
#add_library(glog STATIC IMPORTED)
add_library(nghttp2 STATIC IMPORTED)
add_library(double-conversion STATIC IMPORTED)

link_directories(${ThirdPartyRoot}/boost/xcode/lib)
link_directories(${ThirdPartyRoot}/build/xcode/curl/lib)


add_library(BoostLib STATIC IMPORTED)
set_target_properties(BoostLib PROPERTIES
    IMPORTED_LOCATION ${ThirdPartyRoot}/boost/xcode/lib/libboost.a
)

add_library(Boost::atomic STATIC IMPORTED)
set_target_properties(Boost::atomic PROPERTIES
    IMPORTED_LOCATION ${ThirdPartyRoot}/boost/xcode/lib/libboost.a
)

add_library(Boost::chrono STATIC IMPORTED)
set_target_properties(Boost::chrono PROPERTIES
    IMPORTED_LOCATION ${ThirdPartyRoot}/boost/xcode/lib/libboost.a
)

add_library(Boost::program_options STATIC IMPORTED)
set_target_properties(Boost::program_options PROPERTIES
    IMPORTED_LOCATION ${ThirdPartyRoot}/boost/xcode/lib/libboost.a
)

add_library(Boost::date_time STATIC IMPORTED)
set_target_properties(Boost::date_time PROPERTIES
    IMPORTED_LOCATION ${ThirdPartyRoot}/boost/xcode/lib/libboost.a
)


add_library(Boost::system STATIC IMPORTED)
set_target_properties(Boost::system PROPERTIES
    IMPORTED_LOCATION ${ThirdPartyRoot}/boost/xcode/lib/libboost.a
)

add_library(Boost::filesystem STATIC IMPORTED)
set_target_properties(Boost::filesystem PROPERTIES
    IMPORTED_LOCATION ${ThirdPartyRoot}/boost/xcode/lib/libboost.a
)

add_library(Boost::thread STATIC IMPORTED)
set_property(TARGET Boost::thread APPEND PROPERTY IMPORTED_CONFIGURATIONS Debug)
set_property(TARGET Boost::thread APPEND PROPERTY IMPORTED_CONFIGURATIONS Release)
set_target_properties(Boost::thread PROPERTIES
    IMPORTED_LOCATION_DEBUG ${ThirdPartyRoot}/boost/xcode/lib/libboost.a
    IMPORTED_LOCATION_RELEASE ${ThirdPartyRoot}/boost/xcode/lib/libboost.a
)

add_library(Boost::regex STATIC IMPORTED)
set_target_properties(Boost::regex  PROPERTIES
    IMPORTED_LOCATION ${ThirdPartyRoot}/boost/xcode/lib/libboost.a
)

add_library(Boost::context STATIC IMPORTED)
set_target_properties(Boost::context PROPERTIES
    IMPORTED_LOCATION ${ThirdPartyRoot}/boost/xcode/lib/libboost.a
)

set_target_properties(libcurl PROPERTIES
    IMPORTED_LOCATION ${ThirdPartyRoot}/build/xcode/curl/lib/libcurl.a
)

set_property(TARGET libevent APPEND PROPERTY IMPORTED_CONFIGURATIONS Debug)
set_target_properties(libevent PROPERTIES
    IMPORTED_LOCATION_DEBUG ${ThirdPartyRoot}/build/xcode/libevent/lib/debug/libevent.a
    IMPORTED_LOCATION_RELEASE ${ThirdPartyRoot}/build/xcode/libevent/lib/release/libevent.a
)

#set_property(TARGET glog APPEND PROPERTY IMPORTED_CONFIGURATIONS Debug)
#set_target_properties(glog PROPERTIES
#    IMPORTED_LOCATION_DEBUG ${ThirdPartyRoot}/build/xcode/glog/lib/debug/libglog.a
#    IMPORTED_LOCATION_RELEASE ${ThirdPartyRoot}/build/xcode/glog/lib/release/libglog.a
#)


add_library(OpenSSL::Crypto STATIC IMPORTED)
set_target_properties(OpenSSL::Crypto PROPERTIES
    IMPORTED_LOCATION ${ThirdPartyRoot}/build/xcode/openssl/lib/libcrypto.a
)


add_library(OpenSSL::SSL STATIC IMPORTED)
set_target_properties(OpenSSL::SSL PROPERTIES
    IMPORTED_LOCATION ${ThirdPartyRoot}/build/xcode/openssl/lib/libssl.a
)

set_property(TARGET double-conversion APPEND PROPERTY IMPORTED_CONFIGURATIONS Debug)
set_target_properties(double-conversion PROPERTIES
    IMPORTED_LOCATION_DEBUG ${ThirdPartyRoot}/build/xcode/double-conversion/lib/debug/libdouble-conversion.a
    IMPORTED_LOCATION_RELEASE ${ThirdPartyRoot}/build/xcode/double-conversion/lib/release/libdouble-conversion.a
)

set_property(TARGET nghttp2 APPEND PROPERTY IMPORTED_CONFIGURATIONS Debug)
set_target_properties(nghttp2 PROPERTIES
    IMPORTED_LOCATION_DEBUG ${ThirdPartyRoot}/build/xcode/nghttp2/lib/debug/libnghttp2.a
    IMPORTED_LOCATION_RELEASE ${ThirdPartyRoot}/build/xcode/nghttp2/lib/release/libnghttp2.a
)

set(LIBGLOG_LIBRARY glog)
set(LIBGLOG_INCLUDE_DIR ${ThirdPartyRoot}/glog/src)
#add_subdirectory(${ThirdPartyRoot}/gflags/gflags)

set(LIBGFLAGS_INCLUDE_DIR ${ThirdPartyRoot}/gflags/gflags/src)
set(LIBGFLAGS_LIBRARY gflags_nothreads_static)
set(LIBEVENT_INCLUDE_DIR ${ThirdPartyRoot}/libevent/include)
set(LIBEVENT_LIB libevent)
set(OPENSSL_ROOT_DIR ${ThirdPartyRoot}/build/xcode/openssl)
set(OPENSSL_INCLUDE_DIR ${ThirdPartyRoot}/build/xcode/openssl/include)
set(OPENSSL_CRYPTO_LIBRARY OpenSSL::SSL)
set(OPENSSL_SSL_LIBRARY OpenSSL::Crypto)



elseif(ANDROID)

add_library(libcurl STATIC IMPORTED)
add_library(libevent STATIC IMPORTED)
add_library(nghttp2 STATIC IMPORTED)
add_library(double-conversion STATIC IMPORTED)


add_library(BoostLibAtomic STATIC IMPORTED)
set_target_properties(BoostLibAtomic PROPERTIES
    IMPORTED_LOCATION ${ThirdPartyRoot}/boost/android/${ANDROID_ABI}/lib/libboost_atomic-clang-darwin-mt-1_64.a
)

add_library(Boost::atomic STATIC IMPORTED)
set_target_properties(Boost::atomic PROPERTIES
    IMPORTED_LOCATION ${ThirdPartyRoot}/boost/android/${ANDROID_ABI}/lib/libboost_atomic-clang-darwin-mt-1_64.a
)

add_library(Boost::chrono STATIC IMPORTED)
set_target_properties(Boost::chrono PROPERTIES
    IMPORTED_LOCATION ${ThirdPartyRoot}/boost/android/${ANDROID_ABI}/lib/libboost_chrono-clang-darwin-mt-1_64.a
)

add_library(Boost::program_options STATIC IMPORTED)
set_target_properties(Boost::program_options PROPERTIES
    IMPORTED_LOCATION ${ThirdPartyRoot}/boost/android/${ANDROID_ABI}/lib/libboost_program_options-clang-darwin-mt-1_64.a
)

add_library(Boost::date_time STATIC IMPORTED)
set_target_properties(Boost::date_time PROPERTIES
    IMPORTED_LOCATION ${ThirdPartyRoot}/boost/android/${ANDROID_ABI}/lib/libboost_date_time-clang-darwin-mt-1_64.a
)


add_library(BoostLibSystem STATIC IMPORTED)
set_target_properties(BoostLibSystem PROPERTIES
    IMPORTED_LOCATION ${ThirdPartyRoot}/boost/android/${ANDROID_ABI}/lib/libboost_system-clang-darwin-mt-1_64.a
)
add_library(Boost::system STATIC IMPORTED)
set_target_properties(Boost::system PROPERTIES
    IMPORTED_LOCATION ${ThirdPartyRoot}/boost/android/${ANDROID_ABI}/lib/libboost_system-clang-darwin-mt-1_64.a
)


add_library(BoostLibFileSystem STATIC IMPORTED)
set_property(TARGET BoostLibFileSystem APPEND PROPERTY IMPORTED_CONFIGURATIONS Debug)
set_property(TARGET BoostLibFileSystem APPEND PROPERTY IMPORTED_CONFIGURATIONS Release)
set_target_properties(BoostLibFileSystem PROPERTIES
    IMPORTED_LOCATION_DEBUG ${ThirdPartyRoot}/boost/android/${ANDROID_ABI}/lib/libboost_filesystem-clang-darwin-mt-1_64.a
    IMPORTED_LOCATION_RELEASE ${ThirdPartyRoot}/boost/android/${ANDROID_ABI}/lib/libboost_filesystem-clang-darwin-mt-1_64.a
)

add_library(Boost::filesystem STATIC IMPORTED)
set_target_properties(Boost::filesystem PROPERTIES
    IMPORTED_LOCATION ${ThirdPartyRoot}/boost/android/${ANDROID_ABI}/lib/libboost_filesystem-clang-darwin-mt-1_64.a
)


add_library(BoostLibThread STATIC IMPORTED)
set_property(TARGET BoostLibThread APPEND PROPERTY IMPORTED_CONFIGURATIONS Debug)
set_property(TARGET BoostLibThread APPEND PROPERTY IMPORTED_CONFIGURATIONS Release)
set_target_properties(BoostLibThread PROPERTIES
    IMPORTED_LOCATION_DEBUG ${ThirdPartyRoot}/boost/android/${ANDROID_ABI}/lib/libboost_thread-clang-darwin-mt-1_64.a
    IMPORTED_LOCATION_RELEASE ${ThirdPartyRoot}/boost/android/${ANDROID_ABI}/lib/libboost_thread-clang-darwin-mt-1_64.a
)

add_library(Boost::thread STATIC IMPORTED)
set_property(TARGET Boost::thread APPEND PROPERTY IMPORTED_CONFIGURATIONS Debug)
set_property(TARGET Boost::thread APPEND PROPERTY IMPORTED_CONFIGURATIONS Release)
set_target_properties(Boost::thread PROPERTIES
    IMPORTED_LOCATION_DEBUG ${ThirdPartyRoot}/boost/android/${ANDROID_ABI}/lib/libboost_thread-clang-darwin-mt-1_64.a
    IMPORTED_LOCATION_RELEASE ${ThirdPartyRoot}/boost/android/${ANDROID_ABI}/lib/libboost_thread-clang-darwin-mt-1_64.a
)

add_library(BoostLibRegex STATIC IMPORTED)
set_property(TARGET BoostLibRegex APPEND PROPERTY IMPORTED_CONFIGURATIONS Debug)
set_target_properties(BoostLibRegex PROPERTIES
    IMPORTED_LOCATION_DEBUG ${ThirdPartyRoot}/boost/android/${ANDROID_ABI}/lib/libboost_regex-clang-darwin-mt-1_64.a
)
add_library(Boost::regex STATIC IMPORTED)
set_property(TARGET Boost::regex  APPEND PROPERTY IMPORTED_CONFIGURATIONS Debug)
set_target_properties(Boost::regex  PROPERTIES
    IMPORTED_LOCATION_DEBUG ${ThirdPartyRoot}/boost/android/${ANDROID_ABI}/lib/libboost_regex-clang-darwin-mt-1_64.a
)

add_library(BoostLibContext STATIC IMPORTED)
set_target_properties(BoostLibContext PROPERTIES
    IMPORTED_LOCATION ${ThirdPartyRoot}/boost/android/${ANDROID_ABI}/lib/libboost_context-clang-darwin-mt-1_64.a
)
add_library(Boost::context STATIC IMPORTED)
set_target_properties(Boost::context PROPERTIES
    IMPORTED_LOCATION ${ThirdPartyRoot}/boost/android/${ANDROID_ABI}/lib/libboost_context-clang-darwin-mt-1_64.a
)


set_property(TARGET libcurl APPEND PROPERTY IMPORTED_CONFIGURATIONS Debug)
set_target_properties(libcurl PROPERTIES
    IMPORTED_LOCATION_DEBUG ${ThirdPartyRoot}/build/android/curl/${ANDROID_ABI}/lib/libcurl.a
)

set_property(TARGET libevent APPEND PROPERTY IMPORTED_CONFIGURATIONS Debug)
set_target_properties(libevent PROPERTIES
    IMPORTED_LOCATION_DEBUG ${ThirdPartyRoot}/build/android/libevent/${ANDROID_ABI}/lib/libevent.a
    IMPORTED_LOCATION_RELEASE ${ThirdPartyRoot}/build/android/libevent/${ANDROID_ABI}/lib/libevent.a
)
add_library(CryptoLib STATIC IMPORTED)
set_property(TARGET CryptoLib APPEND PROPERTY IMPORTED_CONFIGURATIONS Debug)
set_target_properties(CryptoLib PROPERTIES
    IMPORTED_LOCATION_DEBUG ${ThirdPartyRoot}/build/android/openssl/${ANDROID_ABI}/lib/libcrypto.a
    IMPORTED_LOCATION_RELEASE ${ThirdPartyRoot}/build/android/openssl/${ANDROID_ABI}/lib/libcrypto.a
)

add_library(OpenSSL::Crypto STATIC IMPORTED)
set_property(TARGET OpenSSL::Crypto APPEND PROPERTY IMPORTED_CONFIGURATIONS Debug)
set_target_properties(OpenSSL::Crypto PROPERTIES
    IMPORTED_LOCATION_DEBUG ${ThirdPartyRoot}/build/android/openssl/${ANDROID_ABI}/lib/libcrypto.a
    IMPORTED_LOCATION_RELEASE ${ThirdPartyRoot}/build/android/openssl/${ANDROID_ABI}/lib/libcrypto.a
)

add_library(OpenSSL STATIC IMPORTED)
set_property(TARGET OpenSSL APPEND PROPERTY IMPORTED_CONFIGURATIONS Debug)
set_target_properties(OpenSSL PROPERTIES
    IMPORTED_LOCATION_DEBUG ${ThirdPartyRoot}/build/android/openssl/${ANDROID_ABI}/lib/libssl.a
    IMPORTED_LOCATION_RELEASE ${ThirdPartyRoot}/build/android/openssl/${ANDROID_ABI}/lib/libssl.a
)
add_library(OpenSSL::SSL STATIC IMPORTED)
set_property(TARGET OpenSSL::SSL APPEND PROPERTY IMPORTED_CONFIGURATIONS Debug)
set_target_properties(OpenSSL::SSL PROPERTIES
    IMPORTED_LOCATION_DEBUG ${ThirdPartyRoot}/build/android/openssl/${ANDROID_ABI}/lib/libssl.a
    IMPORTED_LOCATION_RELEASE ${ThirdPartyRoot}/build/android/openssl/${ANDROID_ABI}/lib/libssl.a
)

set_property(TARGET nghttp2 APPEND PROPERTY IMPORTED_CONFIGURATIONS Debug)
set_target_properties(nghttp2 PROPERTIES
    IMPORTED_LOCATION_DEBUG ${ThirdPartyRoot}/build/android/nghttp2/${ANDROID_ABI}/lib/libnghttp2.a
    IMPORTED_LOCATION_RELEASE ${ThirdPartyRoot}/build/android/nghttp2/${ANDROID_ABI}/lib/libnghttp2.a
)

add_library(FFCallLib STATIC IMPORTED)
set_target_properties(FFCallLib PROPERTIES
    IMPORTED_LOCATION ${ThirdPartyRoot}/build/android/libffcall/${ANDROID_ABI}/lib/libavcall.a
)

set_target_properties(double-conversion PROPERTIES
    IMPORTED_LOCATION ${ThirdPartyRoot}/build/android/double-conversion/${ANDROID_ABI}/double-conversion/libdouble-conversion.a
)


set(Boost_NO_SYSTEM_PATHS ON) 
set(Boost_USE_STATIC_LIBS ON) 
set(Boost_USE_MULTITHREADED ON)  
set(Boost_DEBUG TRUE)
set(Boost_NAMESPACE libboost)
set(Boost_USE_STATIC_RUNTIME OFF) 
set(Boost_COMPILER "-clang-darwin")
set(BOOST_ROOT ${ThirdPartyRoot}/boost/android)

set(BOOST_INCLUDEDIR ${ThirdPartyRoot}/boost/android)
set(Boost_INCLUDE_DIR ${ThirdPartyRoot}/boost/android)
set(BOOST_LIBRARYDIR ${ThirdPartyRoot}/boost/android/${ANDROID_ABI}/lib)
set(Boost_LIBRARY_DIR ${ThirdPartyRoot}/boost/android/${ANDROID_ABI}/lib)
link_directories(${ThirdPartyRoot}/boost/android/${ANDROID_ABI}/lib)

set(LIBGLOG_LIBRARY glog)
set(LIBGLOG_INCLUDE_DIR ${ThirdPartyRoot}/glog/src)
#add_subdirectory(${ThirdPartyRoot}/gflags/gflags)
set(LIBGFLAGS_INCLUDE_DIR ${ThirdPartyRoot}/gflags/gflags/src)
set(LIBGFLAGS_LIBRARY gflags_nothreads_static)
set(LIBEVENT_INCLUDE_DIR ${ThirdPartyRoot}/libevent/include)
set(LIBEVENT_LIB libevent)
set(OPENSSL_ROOT_DIR ${ThirdPartyRoot}/build/android/openssl/${ANDROID_ABI})
set(OPENSSL_INCLUDE_DIR ${ThirdPartyRoot}/build/android/openssl/${ANDROID_ABI}/include)
set(OPENSSL_CRYPTO_LIBRARY OpenSSL)
set(OPENSSL_SSL_LIBRARY "")

elseif(LINUX_PC)

add_library(libcurl STATIC IMPORTED)
add_library(libevent STATIC IMPORTED)
add_library(nghttp2 STATIC IMPORTED)
add_library(double-conversion STATIC IMPORTED)

set_target_properties(libcurl PROPERTIES
    IMPORTED_LOCATION ${ThirdPartyRoot}/build/linux/x64/curl/lib/libcurl.a
)

set_property(TARGET nghttp2 APPEND PROPERTY IMPORTED_CONFIGURATIONS Debug)
set_target_properties(nghttp2 PROPERTIES
    IMPORTED_LOCATION_DEBUG ${ThirdPartyRoot}/build/linux/x64/nghttp2/lib/libnghttp2.a
    IMPORTED_LOCATION_RELEASE ${ThirdPartyRoot}/build/linux/x64/nghttp2/lib/libnghttp2.a
)

set_property(TARGET libevent APPEND PROPERTY IMPORTED_CONFIGURATIONS Debug)
set_target_properties(libevent PROPERTIES
    IMPORTED_LOCATION_DEBUG ${ThirdPartyRoot}/build/linux/x64/libevent/lib/libevent.a
    IMPORTED_LOCATION_RELEASE ${ThirdPartyRoot}/build/linux/x64/libevent/lib/libevent.a
)

set_property(TARGET double-conversion APPEND PROPERTY IMPORTED_CONFIGURATIONS Debug)
set_target_properties(double-conversion PROPERTIES
    IMPORTED_LOCATION_DEBUG ${ThirdPartyRoot}/build/linux/x64/double-conversion/double-conversion/libdouble-conversion.a
    IMPORTED_LOCATION_RELEASE ${ThirdPartyRoot}/build/linux/x64/double-conversion/double-conversion/libdouble-conversion.a
)

set(LIBGLOG_LIBRARY glog)
set(LIBGLOG_INCLUDE_DIR ${ThirdPartyRoot}/glog/src)
set(BOOST_LIBRARYDIR /usr/lib/x86_64-linux-gnu)
set(LIBGFLAGS_INCLUDE_DIR ${ThirdPartyRoot}/gflags/gflags/src)
set(LIBGFLAGS_LIBRARY gflags_nothreads_static)

elseif(MSVC)

add_library(shlwapi STATIC IMPORTED)
set_target_properties(shlwapi PROPERTIES
    IMPORTED_LOCATION shlwapi.lib
)

add_library(gss STATIC IMPORTED)
set_target_properties(gss PROPERTIES
    IMPORTED_LOCATION ${ThirdPartyRoot}/build/msvc/kfw/lib/amd64/gssapi64.lib
)

add_library(pthread SHARED IMPORTED GLOBAL)
set_property(TARGET pthread APPEND PROPERTY IMPORTED_CONFIGURATIONS Debug)
set_target_properties(pthread PROPERTIES
    IMPORTED_LOCATION ${ThirdPartyRoot}/build/msvc/pthread/dll/x64/pthreadVC2.dll
    IMPORTED_IMPLIB ${ThirdPartyRoot}/build/msvc/pthread/lib/x64/pthreadVC2.lib
)

set(GLOG_ROOT_DIR ${ThirdPartyRoot}/glog)
set(LIBGLOG_LIBRARY glog)
set(LIBGLOG_INCLUDE_DIR ${ThirdPartyRoot}/glog/src)

if(XLN_BUILD_SERVER)
else()
    add_subdirectory(${ThirdPartyRoot}/nghttp2)
    set(NGHTTP2_INCLUDE_DIR ${ThirdPartyRoot}/nghttp2/src/include)
    set(NGHTTP2_LIBRARY nghttp2)
    set(ENABLE_LIB_ONLY TRUE)
    add_subdirectory(${ThirdPartyRoot}/curl)
endif()

set(Boost_USE_STATIC_LIBS ON) 
set(Boost_USE_MULTITHREADED ON)  
set(Boost_DEBUG TRUE)
set(BOOST_LIBRARYDIR ${ThirdPartyRoot}/boost/msvc/boost_1_67_0/x64/lib)
set(BOOST_ROOT ${ThirdPartyRoot}/boost/msvc/boost_1_67_0)
set(BOOST_INCLUDEDIR ${ThirdPartyRoot}/boost/boost_1_67_0)

add_subdirectory(${ThirdPartyRoot}/double-conversion)
set(DOUBLE_CONVERSION_INCLUDE_DIR ${ThirdPartyRoot}/double-conversion/double-conversion)
set(DOUBLE_CONVERSION_LIBRARY double-conversion)


#add_subdirectory(${ThirdPartyRoot}/libevent)
set(LIBEVENT_INCLUDE_DIR ${ThirdPartyRoot}/libevent/include)
set(LIBEVENT_LIB libevent)

set(OPENSSL_ROOT_DIR ${ThirdPartyRoot}/build/msvc/openssl)
set(OPENSSL_INCLUDE_DIR ${ThirdPartyRoot}/build/msvc/openssl/include)
set(OPENSSL_CRYPTO_LIBRARY ${ThirdPartyRoot}/build/msvc/openssl/lib/libeay32.lib)
set(OPENSSL_SSL_LIBRARY ${ThirdPartyRoot}/build/msvc/openssl/lib/ssleay32.lib)

add_library(CryptoLib STATIC IMPORTED)
set_property(TARGET CryptoLib APPEND PROPERTY IMPORTED_CONFIGURATIONS Debug)
set_target_properties(CryptoLib PROPERTIES
    IMPORTED_LOCATION_DEBUG ${ThirdPartyRoot}/build/msvc/openssl/lib/libeay32.lib
    IMPORTED_LOCATION_RELEASE ${ThirdPartyRoot}/build/msvc/openssl/lib/libeay32.lib
)

add_library(OpenSSL STATIC IMPORTED)
set_property(TARGET OpenSSL APPEND PROPERTY IMPORTED_CONFIGURATIONS Debug)
set_target_properties(OpenSSL PROPERTIES
    IMPORTED_LOCATION_DEBUG ${ThirdPartyRoot}/build/msvc/openssl/lib/ssleay32.lib
    IMPORTED_LOCATION_RELEASE ${ThirdPartyRoot}/build/msvc/openssl/lib/ssleay32.lib
)

#add_subdirectory(${ThirdPartyRoot}/gflags/gflags)
set(LIBGFLAGS_INCLUDE_DIR ${ThirdPartyRoot}/gflags/gflags/src)
set(LIBGFLAGS_LIBRARY gflags_nothreads_static)

link_directories(${ThirdPartyRoot}/boost/msvc/boost_1_67_0/lib/x64)




endif()

include(${ThirdPartyRoot}/cmake/gtest_include.cmake)
include(${ThirdPartyRoot}/cmake/protobuf_include.cmake)
include(${ThirdPartyRoot}/cmake/grpc_include.cmake)

include(${ThirdPartyRoot}/cmake/glog_include.cmake)
include(${ThirdPartyRoot}/cmake/gflags_include.cmake)

include(${ThirdPartyRoot}/cmake/folly_include.cmake)
include(${ThirdPartyRoot}/cmake/wangle_include.cmake)
include(${ThirdPartyRoot}/cmake/re2_include.cmake)



if(XLN_BUILD_SERVER)
include(${ThirdPartyRoot}/cmake/fbthrift_include.cmake)
include(${ThirdPartyRoot}/cmake/libmysql_include.cmake)
endif()




