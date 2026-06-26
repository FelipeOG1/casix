[org 0x7c00]
mov bp, 0x9000
mov sp, bp


mov bx, HELLO_FROM_STACK
call print
call println


HELLO_FROM_STACK:
    db "Hello from stack", 0



%include "bootloader/boot_sect_print.asm"
%include "bootloader/boot_sect_disk.asm"
%include "bootloader/boot_sect_printhex.asm"


times 510 -($-$$) db 0
dw 0xaa55

times 512 db 5
times 512 db 10

