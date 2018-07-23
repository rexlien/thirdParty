#set(XLN_BUILD_libprotobuf true)

if(MSVC)
    set(protobuf_MSVC_STATIC_RUNTIME OFF)
endif()

if(MSVC)
    xln_add_dependency(libprotobuf ${ThirdPartyRoot}/protobuf-3.4.x/cmake ${ThirdPartyRoot}/build . libprotobuf libprotobufd)
elseif(ANDROID OR LINUX_PC)
    xln_add_dependency(libprotobuf ${ThirdPartyRoot}/protobuf-3.4.x/cmake ${ThirdPartyRoot}/build . protobuf protobuf)
else()
    xln_add_dependency(libprotobuf ${ThirdPartyRoot}/protobuf-3.4.x/cmake ${ThirdPartyRoot}/build . protobuf protobufd)
endif()

set(Protobuf_LIBRARIES libprotobuf)

if(CMAKE_HOST_APPLE)
    set(Protobuf_PROTOC_EXECUTABLE ${ThirdPartyRoot}/build/bin/protoc-3.4.0-osx-x86_64.exe)
elseif(CMAKE_HOST_WIN32)
    set(Protobuf_PROTOC_EXECUTABLE ${ThirdPartyRoot}/build/bin/protoc-3.4.0-windows-x86_64.exe)
else()
    set(Protobuf_PROTOC_EXECUTABLE ${ThirdPartyRoot}/build/bin/protoc-3.4.0-linux-x86_64.exe)
endif()
