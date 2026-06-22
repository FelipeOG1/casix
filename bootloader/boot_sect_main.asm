[org 0x7c00]





mov bx, 0x9000
mov cl, 0x03
call read_disk

mov dx, [bx]
call print_hex

jmp $
HELLO:
    db 'Hello from bios', 0



%include "bootloader/boot_sect_print.asm"
%include "bootloader/boot_sect_disk.asm"
%include "bootloader/boot_sect_printhex.asm"


times 510 -($-$$) db 0
dw 0xaa55

times 512 db 5
times 512 db 10

