cmake_minimum_required(VERSION 3.22)

project(rock LANGUAGES CXX)

find_package(Vulkan REQUIRED)

# for including vulkan project wide
# include_directories("${Vulkan_INCLUDE__DIRS}")

add_executable(test)
target_compile_options(test PRIVATE -Wall)
target_link_options(test PRIVATE -lglfw -lvulkan -ldl -lpthread -lX11 -lXxf86vm -lXrandr -lXi)
target_include_directories(test PRIVATE "${Vulkan_INCLUDE_DIRS}")
target_link_libraries(test PRIVATE "${Vulkan_LIBRARIES}")
target_sources(test PRIVATE main.cc)
