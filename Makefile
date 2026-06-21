BOOT_LOADER = boot_sect_main
QEMU_SYSTEM = qemu-system-x86_64
NASM = nasm
ASFLAGS = -f bin
BIN_DIR = bin/

BOOT_LOADER_SRC = $(BOOT_LOADER).asm
BOOT_LOADER_OUT = $(BIN_DIR)$(BOOT_LOADER).bin

iso:
	$(NASM) $(ASFLAGS) $(BOOT_LOADER_SRC) -o $(BOOT_LOADER_OUT)

run: iso
	$(QEMU_SYSTEM) $(BOOT_LOADER_OUT) -boot c
