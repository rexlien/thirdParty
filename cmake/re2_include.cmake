function(xln_re2_include)
    set(XLN_BUILD_re2 true)
    set(RE2_BUILD_TESTING OFF)
    xln_add_dependency(re2 ${ThirdPartyRoot}/re2 ${ThirdPartyRoot}/build . re2 re2)
endfunction()

xln_re2_include()