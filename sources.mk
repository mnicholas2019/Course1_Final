#******************************************************************************
# Copyright (C) 2017 by Alex Fosdick - University of Colorado
#
# Redistribution, modification or use of this software in source or binary
# forms is permitted as long as the files maintain this copyright. Users are 
# permitted to modify this and use it to learn about the field of embedded
# software. Alex Fosdick and the University of Colorado are not liable for any
# misuse of this material. 
#
#*****************************************************************************
PLATFORM = NONE
# Add your Source files to this variable
ifeq ($(PLATFORM), MSP432)
	SOURCES = src/main.c \
			src/memory.c \
			src/interrupts_msp432p401r_gcc.c \
			src/startup_msp432p401r_gcc.c \
			src/system_msp432p401r.c
else ifeq ($(PLATFORM), HOST)
	SOURCES = src/main.c \
			src/memory.c
else
$(error specify PLATFORM from command line)
endif

# Add your include paths to this variable
ifeq ($(PLATFORM), MSP432)
	INCLUDES = -I include/CMSIS \
				-I include/common \
				-I include/msp432 
else ifeq ($(PLATFORM), HOST)
	INCLUDES = -I include/common
endif

