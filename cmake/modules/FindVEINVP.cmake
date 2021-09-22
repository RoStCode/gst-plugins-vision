# - Try to find WinInvpbobDriver lib
# Once done this will define
#
#  VEINVP_FOUND - system has VEINVP
#  VEINVP_INCLUDE_DIR - the VEINVP include directory
#  VEINVP_LIBRARIES, VEINVP_LIBRARIES2 - the libraries needed to use VEINVP
#
# Redistribution and use is allowed according to the terms of the BSD license.
# For details see the accompanying COPYING-CMAKE-SCRIPTS file.

# TODO: properly handle Linux

if (NOT VEINVP_DIR)
    string(FIND ${CMAKE_CURRENT_BINARY_DIR} "AutoVision" _STR_INDEX)
    string(SUBSTRING ${CMAKE_CURRENT_BINARY_DIR} 0 ${_STR_INDEX} _BASE_DIR)
    cmake_path(APPEND _BASE_DIR "AutoVision" "WinInvpbobDriverX64Lib")
    set(VEINVP_DIR "${_BASE_DIR}")
endif (NOT VEINVP_DIR)

find_path(VEINVP_INCLUDE_DIR WinInvpbobDriver_lib.h
    PATHS
    "${VEINVP_DIR}/WinInvpbobDriver/include_lib"
    DOC "VEINVP include lib.")

find_library(VEINVP_LIBRARIES NAMES WinInvpbobDriver_lib.lib
    PATHS
    "${VEINVP_DIR}/x64/Release"
    DOC "VEINVP Library.")

find_library(VEINVP_LIBRARIES2 NAMES Nv4AuthKeyLib.lib
    PATHS
    "${VEINVP_DIR}/x64/Release"
    DOC "VEINVP NV4 key Library.")


if (VEINVP_INCLUDE_DIR)
   message(STATUS "DEBUG: Found VEINVP include dir: ${VEINVP_INCLUDE_DIR}")
else (VEINVP_INCLUDE_DIR)
   message(STATUS "VEINVP: WARNING: include dir not found")
endif (VEINVP_INCLUDE_DIR)

if (VEINVP_LIBRARIES)
   message(STATUS "DEBUG: Found VEINVP library: ${VEINVP_LIBRARIES}")
else (VEINVP_LIBRARIES)
   message(STATUS "VEINVP: WARNING: library not found")
endif (VEINVP_LIBRARIES)

if (VEINVP_LIBRARIES2)
   message(STATUS "DEBUG: Found VEINVP library: ${VEINVP_LIBRARIES2}")
else (VEINVP_LIBRARIES2)
   message(STATUS "VEINVP: WARNING: library not found")
endif (VEINVP_LIBRARIES2)

include (FindPackageHandleStandardArgs)
find_package_handle_standard_args (VEINVP  DEFAULT_MSG  VEINVP_INCLUDE_DIR VEINVP_LIBRARIES)

mark_as_advanced(VEINVP_INCLUDE_DIR VEINVP_LIBRARIES VEINVP_LIBRARIES2)
