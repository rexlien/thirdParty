#set(XLN_BUILD_gtest true)

set(gtest_force_shared_crt ON)
set(gtest_disable_pthreads ON)
xln_add_dependency(gtest ${ThirdPartyRoot}/gtest ${ThirdPartyRoot}/build googlemock/gtest gtest gtestd)
if(NOT XLN_BUILD_SOURCE AND NOT XLN_BUILD_gtest)
    xln_add_binary_dependency(gtest gmock ${ThirdPartyRoot}/build googlemock gmock gmockd)
endif()

