set(QNXNTO 1)

# The QNX GCC does not seem to have -isystem so remove the flag.
set(CMAKE_INCLUDE_SYSTEM_FLAG_C)
set(CMAKE_INCLUDE_SYSTEM_FLAG_CXX)
# ... Nor does the driver support appropriate flags to create depfiles.
set(CMAKE_DEPFILE_FLAGS_C)
set(CMAKE_DEPFILE_FLAGS_CXX)

set(CMAKE_DL_LIBS "")
set(CMAKE_SHARED_LIBRARY_C_FLAGS "")
set(CMAKE_SHARED_LIBRARY_CXX_FLAGS "")
set(CMAKE_SHARED_LIBRARY_CREATE_C_FLAGS "-shared")
set(CMAKE_SHARED_LIBRARY_RUNTIME_C_FLAG "-Wl,-rpath,")
set(CMAKE_SHARED_LIBRARY_RUNTIME_C_FLAG_SEP ":")
set(CMAKE_SHARED_LIBRARY_RPATH_LINK_C_FLAG "-Wl,-rpath-link,")
set(CMAKE_SHARED_LIBRARY_SONAME_C_FLAG "-Wl,-soname,")
set(CMAKE_EXE_EXPORTS_C_FLAG "-Wl,--export-dynamic")
# http://www.qnx.com/developers/docs/6.4.0/neutrino/utilities/q/qcc.html#examples
set(CMAKE_C_COMPILE_OPTIONS_TARGET "-V")
set(CMAKE_CXX_COMPILE_OPTIONS_TARGET "-V")

# Shared libraries with no builtin soname may not be linked safely by
# specifying the file path.
set(CMAKE_PLATFORM_USES_PATH_WHEN_NO_SONAME 1)

# Initialize C link type selection flags.  These flags are used when
# building a shared library, shared module, or executable that links
# to other libraries to select whether to use the static or shared
# versions of the libraries.
foreach(type SHARED_LIBRARY SHARED_MODULE EXE)
  set(CMAKE_${type}_LINK_STATIC_C_FLAGS "-Wl,-Bstatic")
  set(CMAKE_${type}_LINK_DYNAMIC_C_FLAGS "-Wl,-Bdynamic")
endforeach()
# force the language to be c++ since qnx only has gcc and not g++ and c++?
set(CMAKE_CXX_COMPILE_OBJECT
  "<CMAKE_CXX_COMPILER> -x c++ <DEFINES> <FLAGS> -o <OBJECT> -c <SOURCE>")

include(Platform/UnixPaths)
