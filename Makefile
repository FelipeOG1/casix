BOOT_DIR = bootloader/
BIN_DIR = bin/
KERNEL_DIR = kernel/
DRIVERS_DIR = drivers/
32BIT_DIR = 32_bit/

BOOT_MAIN = boot_sect_main
QEMU_SYSTEM = qemu-system-x86_64
NASM = nasm
ASFLAGS_BIN = -f bin
ASFLAGS_ELF = -f elf

CXX = i386-elf-g++
CXXFLAGS = -ffreestanding -O2 -m32 -fno-exceptions -fno-rtti
LD = i386-elf-ld

KERNEL_ENTRY = kernel_entry
KERNEL = kernel

BOOT_LOADER_SRC = $(BOOT_DIR)$(BOOT_MAIN).asm
BOOT_LOADER_OUT = $(BIN_DIR)$(BOOT_MAIN).bin

KERNEL_ENTRY_SRC = $(KERNEL_DIR)$(KERNEL_ENTRY).asm
KERNEL_ENTRY_OUT = $(KERNEL_DIR)$(KERNEL_ENTRY).o

CXX_SOURCES = $(wildcard kernel/*.cpp drivers/*.cpp)
CXX_OBJECTS = $(CXX_SOURCES:.cpp=.o)

LINKER_SCRIPT = $(KERNEL_DIR)linker.ld

# Default target
all: os-image.bin

# Assembly entry point (must be ELF for linking)
$(KERNEL_ENTRY_OUT): $(KERNEL_ENTRY_SRC)
	$(NASM) $(ASFLAGS_ELF) $< -o $@

# Generic C++ compilation rule — works for ANY .cpp in kernel/ or drivers/
%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Boot sector binary
$(BOOT_LOADER_OUT): $(BOOT_LOADER_SRC)
	$(NASM) $(ASFLAGS_BIN) $< -o $@

# Kernel binary (linked raw)
$(BIN_DIR)$(KERNEL).bin: $(KERNEL_ENTRY_OUT) $(CXX_OBJECTS) $(LINKER_SCRIPT)
	$(LD) -o $@ -T $(LINKER_SCRIPT) $(KERNEL_ENTRY_OUT) $(CXX_OBJECTS) --oformat binary

# OS image = boot sector + kernel padded to at least 2 sectors
os-image.bin: $(BOOT_LOADER_OUT) $(BIN_DIR)$(KERNEL).bin
	dd if=/dev/zero of=$@ bs=512 count=2 status=none
	dd if=$(BOOT_LOADER_OUT) of=$@ conv=notrunc bs=512 count=1 status=none
	dd if=$(BIN_DIR)$(KERNEL).bin of=$@ conv=notrunc bs=512 seek=1 status=none

# Build everything and run in QEMU
run: os-image.bin
	$(QEMU_SYSTEM) -fda os-image.bin

# Generic C++ compile helper
compile:
	$(CXX) $(CXXFLAGS) -c $(FILE).cpp -o $(FILE).o

# Clean build artifacts
clean:
	rm -f $(KERNEL_ENTRY_OUT) $(CXX_OBJECTS)
	rm -f $(BOOT_LOADER_OUT) $(BIN_DIR)$(KERNEL).bin
	rm -f os-image.bin
