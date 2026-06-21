[org 0x7c00]


mov bx, HELLO
call print

jmp $
HELLO:
    db 'Hello from bios', 0



%include "bootloader/boot_sect_print.asm"

times 510 -($-$$) db 0
dw 0xaa55
