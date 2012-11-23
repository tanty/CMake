
add_library(foo SHARED "libfoo.cpp")

add_library(bar SHARED "libbar.cpp")
target_link_libraries(bar LINK_INTERFACE_LIBRARIES foo)
set_property(TARGET bar APPEND PROPERTY LINK_INTERFACE_LIBRARIES blub)
set_property(TARGET bar APPEND PROPERTY INTERFACE_LINK_LIBRARIES $<0:blub>)

add_executable(testexe "main.cpp")
target_link_libraries(testexe bar)