BOOT_DIR = bootloader/
BOOT_MAIN = boot_sect_main
QEMU_SYSTEM = qemu-system-x86_64
NASM = nasm
ASFLAGS = -f bin
BIN_DIR = bin/

CXX = i386-elf-g++

CXXFLAGS = -ffreestanding -O2 -m32 -fno-exceptions -fno-rtti

BOOT_LOADER_SRC = $(BOOT_DIR)$(BOOT_MAIN).asm
BOOT_LOADER_OUT = $(BIN_DIR)$(BOOT_MAIN).bin

iso:
	$(NASM) $(ASFLAGS) $(BOOT_LOADER_SRC) -o $(BOOT_LOADER_OUT)

run: iso
	$(QEMU_SYSTEM) $(BOOT_LOADER_OUT) -boot c

compile:
	$(CXX) $(CXXFLAGS) $(FILE).cpp -o $(FILE).o
