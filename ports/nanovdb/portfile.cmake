vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO AcademySoftwareFoundation/openvdb
    REF f7b8bca1d62de568cde8360e54571a2879071173
    SHA512 94b73360bf111a19e09cd47b65f1a2612aaa7683ac3b87559743966d876417e57461dcb6d535d441fb2b32a754a1dc2ee0448e2ecf25e3aa0c2237c73032e08b
    PATCHES
      001-fix-cmake-install.patch
    )

# add_library(libnanovdb INTERFACE)

# set(NANOVDB_INCLUDE_DIR ${SOURCE_PATH}/nanovdb/)

# target_include_directories(libnanovdb INTERFACE ${NANOVDB_INCLUDE_DIR}
#                                                 ${NANOVDB_INCLUDE_DIR}/nanovdb)

# target_compile_definitions(libnanovdb INTERFACE "-DNOMINMAX" "-D${NANOVDB_USE_INTRINSICS_FLAG}")

# option(NANOVDB_BUILD_UNITTESTS "Build Unit tests" ON)
# option(NANOVDB_BUILD_EXAMPLES "Build examples" ON)
# option(NANOVDB_BUILD_BENCHMARK "Build benchmark" ON)
# option(NANOVDB_BUILD_DOCS "Build docs" OFF)
# option(NANOVDB_BUILD_TOOLS "Build command-line tools" ON)

# option(NANOVDB_USE_INTRINSICS "Build with hardware intrinsics support" ON)
# option(NANOVDB_USE_OPENVDB "Build with OpenVDB support" ON)
# option(NANOVDB_USE_OPENGL "Build with OpenGL support" ON)
# option(NANOVDB_USE_OPENCL "Build with OpenCL support" ON)
# option(NANOVDB_USE_CUDA "Build with CUDA support" ON)
# option(NANOVDB_USE_TBB "Build with TBB support" ON)
# option(NANOVDB_USE_BLOSC "Build with BLOSC support" ON)
# option(NANOVDB_USE_ZLIB "Build with ZLIB support" ON)
# option(NANOVDB_USE_OPTIX "Build with OptiX support" ON)
# option(NANOVDB_USE_MAGICAVOXEL "Build with MagicaVoxel support" ON)

#option(NANOVDB_ALLOW_FETCHCONTENT
#       "Allow FetchContent to download missing dependencies" ON)

vcpkg_cmake_configure(
    SOURCE_PATH ${SOURCE_PATH}/nanovdb
    OPTIONS
        -DNANOVDB_BUILD_UNITTESTS=OFF
        -DNANOVDB_BUILD_EXAMPLES=OFF
        -DNANOVDB_BUILD_BENCHMARK=OFF
        -DNANOVDB_BUILD_DOCS=OFF
        -DNANOVDB_BUILD_TOOLS=OFF
        -DNANOVDB_USE_INTRINSICS=OFF
        -DNANOVDB_USE_OPENVDB=ON
        -DNANOVDB_USE_OPENGL=OFF
        -DNANOVDB_USE_OPENCL=OFF
        -DNANOVDB_USE_CUDA=OFF
        -DNANOVDB_USE_TBB=ON
        -DNANOVDB_USE_BLOSC=ON
        -DNANOVDB_USE_ZLIB=ON
        -DNANOVDB_USE_OPTIX=OFF
        -DNANOVDB_USE_MAGICAVOXEL=OFF
        -DNANOVDB_ALLOW_FETCHCONTENT=OFF
)

file(REMOVE ${SOURCE_PATH}/nanovdb/cmake/FindBlosc.cmake)
file(REMOVE ${SOURCE_PATH}/nanovdb/cmake/FindEGL.cmake)
file(REMOVE ${SOURCE_PATH}/nanovdb/cmake/FindIlmBase.cmake)
file(REMOVE ${SOURCE_PATH}/nanovdb/cmake/FindOpenGL.cmake)
file(REMOVE ${SOURCE_PATH}/nanovdb/cmake/FindOpenVDB.cmake)
file(REMOVE ${SOURCE_PATH}/nanovdb/cmake/FindOptiX.cmake)
file(REMOVE ${SOURCE_PATH}/nanovdb/cmake/FindTBB.cmake)
file(REMOVE ${SOURCE_PATH}/nanovdb/cmake/OpenVDBGLFW3Setup.cmake)
file(REMOVE ${SOURCE_PATH}/nanovdb/cmake/OpenVDBUtils.cmake)

vcpkg_cmake_install()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug")

#configure_file("${CMAKE_CURRENT_LIST_DIR}/vcpkg-cmake-wrapper.cmake.in" "${CURRENT_PACKAGES_DIR}/share/${PORT}/vcpkg-cmake-wrapper.cmake" @ONLY)
file(INSTALL "${CMAKE_CURRENT_LIST_DIR}/usage" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}")
file(INSTALL "${SOURCE_PATH}/openvdb/openvdb/COPYRIGHT" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)


#vcpkg_cmake_config_fixup(CONFIG_PATH nanovdb)

# file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include" "${CURRENT_PACKAGES_DIR}/debug/share")

# if (OPENVDB_BUILD_TOOLS)
#     vcpkg_copy_tools(TOOL_NAMES vdb_print vdb_render vdb_view vdb_lod AUTO_CLEAN)
# endif()

# configure_file("${CMAKE_CURRENT_LIST_DIR}/vcpkg-cmake-wrapper.cmake.in" "${CURRENT_PACKAGES_DIR}/share/${PORT}/vcpkg-cmake-wrapper.cmake" @ONLY)
# file(INSTALL "${CMAKE_CURRENT_LIST_DIR}/usage" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}")
# file(INSTALL "${SOURCE_PATH}/openvdb/openvdb/COPYRIGHT" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)
