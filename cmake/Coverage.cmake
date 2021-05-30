# from here:
#
# https://github.com/lefticus/cppbestpractices/blob/master/02-Use_the_Tools_Avai
# lable.md

function(set_coverage_flags project_name)

  option(${PROJECT_NAME}_ENABLE_COVERAGE "Enable Code Coverage" TRUE)

  if( ${PROJECT_NAME}_ENABLE_COVERAGE )

    if(CMAKE_COMPILER_IS_GNUCC)

        target_compile_options(${project_name}  INTERFACE --coverage -g -O0 -fprofile-arcs -ftest-coverage)
        target_link_libraries( ${project_name}  INTERFACE --coverage -g -O0 -fprofile-arcs -ftest-coverage)

        add_custom_target(coverage
            COMMAND rm -rf coverage
            COMMAND mkdir -p coverage
            COMMAND gcovr . -e "build/*" -r ${CMAKE_SOURCE_DIR} --html-details --html -o coverage/index.html -e ${CMAKE_SOURCE_DIR}/src/lib/nd2UISystem -e ${CMAKE_SOURCE_DIR}/build -e ${CMAKE_SOURCE_DIR}/test/third_party;
            COMMAND gcovr . -e "build/*" -r ${CMAKE_SOURCE_DIR} --xml -o coverage/report.xml                 -e ${CMAKE_SOURCE_DIR}/src/lib/nd2UISystem -e ${CMAKE_SOURCE_DIR}/build -e ${CMAKE_SOURCE_DIR}/test/third_party;
            COMMAND gcovr . -e "build/*" -r ${CMAKE_SOURCE_DIR} -o coverage/report.txt                       -e ${CMAKE_SOURCE_DIR}/src/lib/nd2UISystem -e ${CMAKE_SOURCE_DIR}/build -e ${CMAKE_SOURCE_DIR}/test/third_party;
            COMMAND cat coverage/report.txt
            WORKING_DIRECTORY ${CMAKE_BINARY_DIR}  # Need separate command for this line
        )

    endif()

  endif()

endfunction()
