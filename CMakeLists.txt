cmake_minimum_required(VERSION 3.8)

#########################################################
project(gul  VERSION 1.0.0)
#########################################################


#########################################################
include(cmake/StandardProjectSettings.cmake)
include(cmake/CompilerWarnings.cmake)
include(cmake/Coverage.cmake)
#########################################################


#########################################################
# Create an interface library so that we can link to
# The proper configurations.
#
# Any target that wants to use gnl should link to
# gnl::gnl.  eg:
#
#  target_link_libraries(myexe gnl::gnl)
#
#########################################################
set(lib_name   gul)
set(lib_alias  gul::gul)

add_library( ${lib_name} INTERFACE)
add_library( ${lib_alias} ALIAS ${lib_name} )

target_compile_features( ${lib_name}
                            INTERFACE
                                cxx_std_17
                        )
target_include_directories( ${lib_name}
                                INTERFACE
                                    "$<BUILD_INTERFACE:${CMAKE_SOURCE_DIR}/include>"
                                    "$<BUILD_INTERFACE:${CMAKE_CURRENT_BINARY_DIR}/generated_headers>"
                           )

set_coverage_flags(${lib_name})
set_project_warnings(${lib_name})
#########################################################



#########################################################
# Other targets
#########################################################
add_custom_target( other_files
                        SOURCES
                          # .travis/install.sh
                          # .travis/build.sh
                           README.md
                          # LICENSE
                           .gitlab-ci.yml
                          # .travis.yml
                           appveyor.yml
                           cmake/CompilerWarnings.cmake
                           cmake/Coverage.cmake
                )
#########################################################




#########################################################
enable_testing()
add_subdirectory(test)
#########################################################
