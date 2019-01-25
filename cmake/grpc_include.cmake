include(ExternalProject)


set(XLN_BUILD_grpc true)
set(gRPC_INSTALL OFF)
set(gRPC_BUILD_TESTS OFF)
set(gRPC_PROTOBUF_PROVIDER "package")
set(gRPC_GFLAGS_PROVIDER "package")
set(gRPC_SSL_PROVIDER "package")

xln_add_dependency(grpc ${ThirdPartyRoot}/grpc ${ThirdPartyRoot}/build . grpc grpc)

# if(MSVC)
# 	set(XLN_GRPC_BUILDDIR ${ThirdPartyRoot}/build/msvc/grpc)
# elseif(LINUX_PC)
# 	set(XLN_GRPC_BUILDDIR ${ThirdPartyRoot}/build/linux/x64/grpc)
# endif()
	
#     ExternalProject_Add(grpc
# 	PREFIX grpc
# 	SOURCE_DIR ${ThirdPartyRoot}/grpc
# 	BINARY_DIR ${XLN_GRPC_BUILDDIR}
# 	CMAKE_ARGS
# 		-DgRPC_INSTALL:BOOL=ON
# 		-DgRPC_BUILD_TESTS:BOOL=OFF
# 		-DgRPC_PROTOBUF_PROVIDER:STRING=package
# 		-DgRPC_PROTOBUF_PACKAGE_TYPE:STRING=CONFIG
# 		-DProtobuf_DIR:PATH=${Protobuf_DIR}
# 		##-DgRPC_ZLIB_PROVIDER:STRING=package
# 		##-DZLIB_ROOT:STRING=${CMAKE_CURRENT_BINARY_DIR}/zlib
# 		##-DgRPC_CARES_PROVIDER:STRING=package
# 		##-Dc-ares_DIR:PATH=${CMAKE_CURRENT_BINARY_DIR}/c-ares/lib/cmake/c-ares
# 		##-DgRPC_SSL_PROVIDER:STRING=package
# 		##${_CMAKE_ARGS_OPENSSL_ROOT_DIR}
# 		-DCMAKE_INSTALL_PREFIX:PATH=${XLN_GRPC_BUILDDIR}
# 		##
#     DEPENDS libprotobuf)
# ExternalProject_Get_Property(grpc install_dir)

#endfunction()

#xln_grpc_include()
##set(gRPC_DIR ${ThirdPartyRoot}/build/msvc/grpc)
##find_package(gRPC CONFIG REQUIRED)


