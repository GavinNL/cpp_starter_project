# from here:
#
# https://github.com/lefticus/cppbestpractices/blob/master/02-Use_the_Tools_Available.md
#
option(${PROJECT_NAME}_ENABLE_COVERAGE "Enable Code Coverage. Only enabled on non-Release mode" TRUE)

function(set_coverage_flags project_name)

  if(NOT CMAKE_BUILD_TYPE MATCHES Release)

      if( ${PROJECT_NAME}_ENABLE_COVERAGE )

        if(CMAKE_COMPILER_IS_GNUCC)


            get_target_property(type ${project_name} TYPE)
            if (${type} STREQUAL "INTERFACE_LIBRARY")
                target_compile_options(${project_name}  INTERFACE --coverage -g -O0 -fprofile-arcs -ftest-coverage)
                target_link_libraries( ${project_name}  INTERFACE --coverage -g -O0 -fprofile-arcs -ftest-coverage)
            else()
                target_compile_options(${project_name}  PRIVATE --coverage -g -O0 -fprofile-arcs -ftest-coverage)
                target_link_libraries( ${project_name}  PRIVATE --coverage -g -O0 -fprofile-arcs -ftest-coverage)
            endif()


            message("Coverage Flags added to target : ${project_name}: --coverage -g -O0 -fprofile-arcs -ftest-coverage")

        endif()

      endif()

  endif()

endfunction()

message("=========================================")
message("COVERAGE")
message("=========================================")

if(NOT CMAKE_BUILD_TYPE MATCHES Release)

    message("- CMAKE_BUILD_TYPE is NOT Release. Enabling Coverage")

    if( ${PROJECT_NAME}_ENABLE_COVERAGE )

      message("- ${PROJECT_NAME}_ENABLE_COVERAGE is set.")

      if(CMAKE_COMPILER_IS_GNUCC)

          message("- Compiler is GCC")

          message("- WILL BUILD WITH COVERAGE.")

      endif()

    endif()

endif()


add_custom_target(coverage
    COMMAND rm -rf coverage
    COMMAND mkdir -p coverage
    COMMAND gcovr . -e "build/*" -r ${CMAKE_SOURCE_DIR} --html-details --html -o coverage/index.html -e ${CMAKE_SOURCE_DIR}/build;
    COMMAND gcovr . -e "build/*" -r ${CMAKE_SOURCE_DIR} --xml -o coverage/report.xml                 -e ${CMAKE_SOURCE_DIR}/build;
    COMMAND gcovr . -e "build/*" -r ${CMAKE_SOURCE_DIR} -o coverage/report.txt                       -e ${CMAKE_SOURCE_DIR}/build;
    COMMAND cat coverage/report.txt
    WORKING_DIRECTORY ${CMAKE_BINARY_DIR}  # Need separate command for this line
)
message("- adding new target: coverage")
message("=========================================")
