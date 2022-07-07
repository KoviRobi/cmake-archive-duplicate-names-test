cmake_minimum_required(VERSION 3.13)

project(cmake_clang_libraries_with_common_functions)

add_library(A a.c)
add_library(B b.c)

add_executable(test_a_first test.c)
target_link_libraries(test_a_first A B)

add_executable(test_b_first test.c)
target_link_libraries(test_b_first B A)

add_executable(test_should_error test.c)
target_link_libraries(test_should_error
  -Wl,--whole-archive
  A
  B
  -Wl,--no-whole-archive)

add_library(obj_A OBJECT a.c)
add_library(obj_B OBJECT b.c)

add_executable(test_should_error_obj test.c)
target_link_libraries(test_should_error_obj obj_A obj_B)
