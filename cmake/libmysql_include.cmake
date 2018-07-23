

##function(xln_libmysql_include)


##xln_libmysql_include()
include(ExternalProject)
if(MSVC)
ExternalProject_Add(
  webscalesqlclient
  SOURCE_DIR ${ThirdPartyRoot}/myrocks
  BINARY_DIR ${ThirdPartyRoot}/build/msvc/libmysql
  CMAKE_ARGS
  -DWITHOUT_SERVER=TRUE
  -DDISABLE_SHARED=TRUE
  -DCMAKE_C_FLAGS=${CMAKE_C_FLAGS}
  -DCMAKE_CXX_FLAGS=${CMAKE_CXX_FLAGS}
  -DCMAKE_C_COMPILER=${CMAKE_C_COMPILER}
  -DCMAKE_CXX_COMPILER=${CMAKE_CXX_COMPILER}
  -DOPENSSL_INCLUDE_DIR=${OPENSSL_INCLUDE_DIR}
  -DOPENSSL_LIBRARY=${OPENSSL_SSL_LIBRARY}
  -DCRYPTO_LIBRARY=${OPENSSL_CRYPTO_LIBRARY}
  -DWITH_ZSTD=${ThirdPartyRoot}/build/msvc/zstd
  -DZSTD_LIBRARY=${ThirdPartyRoot}/build/msvc/zstd/static/zstd.lib
  -DFOLLY_INCLUDE_DIR=${ThirdPartyRoot}/folly
  -DPTHREAD_LIB=${ThirdPartyRoot}/build/msvc/pthread/lib/x64/pthreadVC2.lib
  #BUILD_COMMAND $(MAKE) -C libmysql
  CMAKE_GENERATOR ${CMAKE_GENERATOR}
  PREFIX build
  #BUILD_IN_SOURCE true
  INSTALL_COMMAND ""
)
add_library(libmysql STATIC IMPORTED)
set_target_properties(libmysql PROPERTIES
    IMPORTED_LOCATION ${ThirdPartyRoot}/build/msvc/libmysql/libmysql/Debug/clientlib.lib
)

add_library(fbmysqlclient STATIC IMPORTED)
set_target_properties(fbmysqlclient PROPERTIES
    IMPORTED_LOCATION ${ThirdPartyRoot}/build/msvc/libmysql/libmysql/Debug/fbmysqlclient.lib
)

add_library(mysql_auth_win STATIC IMPORTED)
set_target_properties(mysql_auth_win PROPERTIES
    IMPORTED_LOCATION ${ThirdPartyRoot}/build/msvc/libmysql/libmysql/authentication_win/Debug/auth_win_client.lib
)

elseif(LINUX_PC)
ExternalProject_Add(
  webscalesqlclient
  SOURCE_DIR ${ThirdPartyRoot}/myrocks
  BINARY_DIR ${ThirdPartyRoot}/build/linux/x64/libmysql
  BUILD_BYPRODUCTS ${ThirdPartyRoot}/build/linux/x64/libmysql/libmysql/libclientlib.a ${ThirdPartyRoot}/build/linux/x64/libmysql/libmysql/libfbmysqlclient.a
  CMAKE_ARGS
  -DCMAKE_BUILD_TYPE=Release
  #-DCMAKE_TOOLCHAIN_FILE=/usr/lib/XLN/Toolchain.cmake
  -DWITHOUT_SERVER=TRUE
  -DDISABLE_SHARED=TRUE
  -DCMAKE_C_FLAGS=${CMAKE_C_FLAGS}
  -DCMAKE_CXX_FLAGS=${CMAKE_CXX_FLAGS}
  -DCMAKE_C_COMPILER=${CMAKE_C_COMPILER}
  -DCMAKE_CXX_COMPILER=${CMAKE_CXX_COMPILER}
  -DOPENSSL_INCLUDE_DIR=${OPENSSL_INCLUDE_DIR}
  -DOPENSSL_LIBRARY=${OPENSSL_SSL_LIBRARY}
  -DCRYPTO_LIBRARY=${OPENSSL_CRYPTO_LIBRARY}
  -DWITH_ZSTD=/usr/local
  -DFOLLY_INCLUDE_DIR=${ThirdPartyRoot}/folly
  
  CMAKE_GENERATOR ${CMAKE_GENERATOR}
  PREFIX build
  ##BUILD_IN_SOURCE true
  #INSTALL_COMMAND ""
)

add_library(libmysql STATIC IMPORTED)
set_target_properties(libmysql PROPERTIES
    IMPORTED_LOCATION ${ThirdPartyRoot}/build/linux/x64/libmysql/libmysql/libclientlib.a
)

add_library(fbmysqlclient STATIC IMPORTED)
set_target_properties(fbmysqlclient PROPERTIES
    IMPORTED_LOCATION ${ThirdPartyRoot}/build/linux/x64/libmysql/libmysql/libfbmysqlclient.a
)


endif()