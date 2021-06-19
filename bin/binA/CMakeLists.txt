cmake_minimum_required(VERSION 3.8)

get_filename_component(MODULE_NAME ${CMAKE_CURRENT_SOURCE_DIR} NAME)
string(REPLACE " " "_" MODULE_NAME ${MODULE_NAME})



file(GLOB files "src/*.cpp" "include/*")

#########################################################
# Create an interface library so that we can link to
# The proper configurations.
#
# Any target that wants to use gnl should link to
# ABC::ABC.  eg:
#
#  target_link_libraries(myexe ABC::ABC)
#
#########################################################
set(lib_name   ${MODULE_NAME})
set(lib_alias  ${PROJECT_NAME}::${MODULE_NAME})

add_executable( ${lib_name} ${files})

target_compile_features( ${lib_name}
                            INTERFACE
                                cxx_std_17
                        )
target_include_directories( ${lib_name}
                                INTERFACE
                                    "$<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>"
                                    "$<BUILD_INTERFACE:${CMAKE_CURRENT_BINARY_DIR}/generated_headers>"
                           )

target_link_libraries( ${lib_name}
                            PRIVATE
                            ${PROJECT_NAME}::${PROJECT_NAME}
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
