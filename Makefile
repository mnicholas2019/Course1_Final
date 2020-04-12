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

#------------------------------------------------------------------------------
# Makefile that supports host and cross platform builds (cortex-m4)
#
# Use: make [TARGET] [PLATFORM-OVERRIDES]
#
# Build Targets:
#	<FILE>.i - builds <FILE>.i preprocessed file
#	<FILE>.asm - builds <FILE>.asm assembly file from source code or executable
#	<FILE.d> - builds <FILE>.d dependency file
#	<FILE>.o - builds <FILE>.o object file
#	compile-all - compiles all object files, but does not link
#	build - compiles all object files and links into executable. Also
#	generates target.map, *.d files, *.o files.
#	clean - remove all compiled objects, preprocessed outputs, assembly outputs,
#	executable files and build output files.
#
#
# Platform Overrides:
#      PLATFORM - host or target embedded device (HOST or MSP432)
#
#------------------------------------------------------------------------------
include sources.mk

# Platform Overrides
PLATFORM = NONE
COURSE = COURSE1
VERBOSE = ENABLE

GENFLAGS = -Wall \
			-Werror \
			-g \
			-O0 \
			-std=c99
TARGET = c1m2

ifeq ($(PLATFORM), MSP432)
	# Architecture Specific Flags
	LINKER_FILE = msp432p401r.lds
	CPU = cortex-m4
	ARCH = thumb
	SPECS = nosys.specs
	ARMONLY = -mcpu=$(CPU) -m$(ARCH) -march=armv7e-m \
				-mfloat-abi=hard -mfpu=fpv4-sp-d16 \
				--specs=$(SPECS)

	# Compiler Flags and Defines
	CC = arm-none-eabi-gcc
	LD = arm-none-eabi-ld
	SIZE = arm-none-eabi-size
	LDFLAGS = -Wl,-Map=src/$(TARGET).map -T $(LINKER_FILE)
	CFLAGS = $(GENFLAGS) $(ARMONLY)
	CPPFLAGS = -DMSP432 $(INCLUDES)
	OBJDUMP = arm-none-eabi-objdump

else
	# Compiler Flags and Defines
	CC = gcc
	CFLAGS = $(GENFLAGS)
	CPPFLAGS = -DHOST -D$(COURSE) $(INCLUDES)
	LDFLAGS = -Wl,-Map=src/$(TARGET).map
	SIZE = size 
	OBJDUMP = objdump

endif

ifeq ($(VERBOSE), ENABLE)
	CPPFLAGS += -DVERBOSE
endif

PREP = $(SOURCES:.c=.i)
ASMS = $(SOURCES:.c=.asm)
OBJS = $(SOURCES:.c=.o)
DEPS = $(SOURCES:.c=.d)

%.i : %.c
	$(CC) -E $(CPPFLAGS) -o $@ $<

%.asm : %.c
	$(CC) -S $(CFLAGS) $(CPPFLAGS) -o $@ $<

%.o : %.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS) -o $@ $<

%.d : %.c
	$(CC) -M $(CFLAGS) $(CPPFLAGS) -o $@ $<

.PHONY: build
build: all

.PHONY: all
all: $(TARGET).out

$(TARGET).out : $(OBJS) #$(DEPS)
	$(CC) $(CFLAGS) $(CPPFLAGS) $(LDFLAGS) -o $@ $(OBJS)
	./$(TARGET).out
#	(SIZE) $(TARGET).out

.PHONY: assembly
assembly: $(ASMS) $(TARGET).asm
$(TARGET).asm : $(TARGET).out
	$(OBJDUMP) -d $< >> $@

.PHONY: compile-all
compile-all: $(OBJS) #change to objs	

.PHONY: clean
clean:
	rm -f src/*.o src/*.i src/*.asm src/*.d *.out src/*.map


#=======================================================#
# # Platform Overrides
# PLATFORM = HOST 

# # Architectures Specific Flags
# LINKER_FILE = 
# CPU = 
# ARCH = 
# SPECS = 

# # Compiler Flags and Defines
# CC = 
# LD = 
# LDFLAGS = 
# CFLAGS = 
# CPPFLAGs = 

