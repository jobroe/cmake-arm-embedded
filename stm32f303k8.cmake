#
# * Author:   Kentaro Sugimoto
# * License:  See LICENSE.TXT file included in the project
#
# STM32F303K8 target specific CMake file
#

if(NOT DEFINED LINKER_SCRIPT)
  message(FATAL_ERROR "No linker script defined")
endif(NOT DEFINED LINKER_SCRIPT)
message("Linker script: ${LINKER_SCRIPT}")

# ------------------------------------------------------------------------------
# Set target specific compiler/linker flags
# ------------------------------------------------------------------------------

# Compiler options
set(OBJECT_GEN_FLAGS "-mcpu=cortex-m4 -mfpu=fpv4-sp-d16 -mfloat-abi=hard")

set(CMAKE_C_FLAGS
    "${CMAKE_C_FLAGS} ${OBJECT_GEN_FLAGS}"
    CACHE INTERNAL "C Compiler options")
set(CMAKE_CXX_FLAGS
    "${CMAKE_CXX_FLAGS} ${OBJECT_GEN_FLAGS}"
    CACHE INTERNAL "C++ Compiler options")
set(CMAKE_ASM_FLAGS
    "${CMAKE_ASM_FLAGS} ${OBJECT_GEN_FLAGS}"
    CACHE INTERNAL "ASM Compiler options")

# Linker flags
set(CMAKE_EXE_LINKER_FLAGS
    "${CMAKE_EXE_LINKER_FLAGS} -mfpu=fpv4-sp-d16 -mfloat-abi=hard -T${LINKER_SCRIPT}"
    CACHE INTERNAL "Linker options")
