if(DEFINED ThirdPartyRoot)
else()
    set(ThirdPartyRoot ${PROJECT_SOURCE_DIR}/thirdParty)
endif()

set(THRIFT1 ${CMAKE_BINARY_DIR}/bin/thrift1)
set(THRIFT_TEMPLATES ${ThirdPartyRoot}/fbthrift/thrift/compiler/generate/templates)