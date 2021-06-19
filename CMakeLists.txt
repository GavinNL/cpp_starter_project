cmake_minimum_required(VERSION 3.8)

#########################################################
project(ABC  VERSION 1.0.0)
#########################################################


get_directory_property( _is_sub_project PARENT_DIRECTORY)

if(_is_sub_project)
else()
    #########################################################
    include(cmake/StandardProjectSettings.cmake)
    include(cmake/CompilerWarnings.cmake)
    include(cmake/Coverage.cmake)
    #########################################################

    #########################################################
    # Other targets
    #########################################################
    add_custom_target( ${PROJECT_NAME}_other_files
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
                               cmake/StandardProjectSettings.cmake
                    )
    #########################################################

endif()



#########################################################
# Create a top
#
#  target_link_libraries(myexe ABC::ABC)
#
#########################################################
set(lib_name   ${PROJECT_NAME})
set(lib_alias  ${PROJECT_NAME}::${PROJECT_NAME})

add_library( ${lib_name} INTERFACE)
add_library( ${lib_alias} ALIAS ${lib_name} )

target_compile_features( ${lib_name}
                            INTERFACE
                                cxx_std_17
                                )
        target_include_directories( ${lib_name}
                                        INTERFACE
                                    "$<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>"
                                    "$<BUILD_INTERFACE:${CMAKE_CURRENT_BINARY_DIR}/generated_headers>"
                           )

if( ${PROJECT_NAME}_ENABLE_COVERAGE )
   set_coverage_flags(${lib_name})
endif()
if( ${PROJECT_NAME}_ENABLE_WARNINGS )
   set_project_warnings(${lib_name})
endif()

#########################################################



#########################################################
enable_testing()
add_subdirectory(test)
#########################################################

add_subdirectory(lib/libA)
add_subdirectory(lib/libB)
add_subdirectory(lib/libC)
add_subdirectory(lib/libD)

add_subdirectory(bin/binA)



