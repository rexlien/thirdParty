set(XLN_BUILD_libprotobuf true)

set(protobuf_BUILD_TESTS OFF)

#
if(MSVC)
    set(protobuf_MSVC_STATIC_RUNTIME OFF)
    xln_add_dependency(libprotobuf ${ThirdPartyRoot}/protobuf/cmake ${ThirdPartyRoot}/build . libprotobuf libprotobufd)
    set(Protobuf_DIR ${ThirdPartyRoot}/build/msvc/libprotobuf/cmake) ##
elseif(ANDROID OR LINUX_PC)
    xln_add_dependency(libprotobuf ${ThirdPartyRoot}/protobuf/cmake ${ThirdPartyRoot}/build . protobuf protobuf)
else()
    xln_add_dependency(libprotobuf ${ThirdPartyRoot}/protobuf/cmake ${ThirdPartyRoot}/build . protobuf protobufd)
endif()

set(Protobuf_LIBRARIES libprotobuf)


if(CMAKE_HOST_APPLE)
    set(Protobuf_PROTOC_EXECUTABLE ${ThirdPartyRoot}/build/bin/protoc-3.4.0-osx-x86_64.exe)
elseif(CMAKE_HOST_WIN32)
    ##set(Protobuf_PROTOC_EXECUTABLE prtoc)##${ThirdPartyRoot}/build/bin/protoc-3.4.0-windows-x86_64.exe)
    set(Protobuf_PROTOC_EXECUTABLE $<TARGET_FILE:protobuf::protoc>)
else()
    set(Protobuf_PROTOC_EXECUTABLE ${ThirdPartyRoot}/build/bin/protoc-3.4.0-linux-x86_64.exe)
endif()
