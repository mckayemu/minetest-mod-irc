
# :mode=cmake:

set(CMAKE_SYSTEM_NAME Windows)

set(PLATFORM i586-mingw32msvc)

set(MGW_TOOLCHAIN_PATH
    /usr/${PLATFORM}
)

set(WIN32 1)

set(CMAKE_C_COMPILER /usr/bin/${PLATFORM}-gcc)
set(CMAKE_RC_COMPILER /usr/bin/${PLATFORM}-windres)

set(CMAKE_FIND_ROOT_PATH ${MGW_TOOLCHAIN_PATH})

set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)

set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)