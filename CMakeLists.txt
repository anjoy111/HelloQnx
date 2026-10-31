cmake_minimum_required(VERSION 3.20)

project(HelloQnx LANGUAGES C)

add_executable(HelloQnx src/HelloQnx.c)
target_compile_options(HelloQnx PRIVATE -Wall -fmessage-length=0)
