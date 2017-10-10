##
## CC13xx target specific CMake file
##

if(NOT DEFINED LINKER_SCRIPT)
message(FATAL_ERROR "No linker script defined")
endif(NOT DEFINED LINKER_SCRIPT)
message("Linker script: ${LINKER_SCRIPT}")

#
## Set compiler/build flags
# 

# Object build Options
set(OBJECT_GEN_FLAGS "-O0 -mcpu=cortex-m3 -gdwarf-2 -mthumb -fomit-frame-pointer -Wall -Wstrict-prototypes")

set(CMAKE_C_FLAGS "${OBJECT_GEN_FLAGS}")
set(CMAKE_CXX_FLAGS "${OBJECT_GEN_FLAGS}")
set(CMAKE_ASM_FLAGS "${OBJECT_GEN_FLAGS} -x assembler-with-cpp ")

# Linker flags
set(OUTPUT_GEN_FLAGS "-mcpu=cortex-m3 -nostartfiles -static -Wl,--gc-sections  -ffunction-sections -fdata-sections -T${LINKER_SCRIPT} -Wl,-Map=${CMAKE_PROJECT_NAME}.map -Wl,--cref")

set(CMAKE_EXE_LINKER_FLAGS "${OUTPUT_GEN_FLAGS}")
