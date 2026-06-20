[org 0x7c00] ;bootloader offset
mov bx, HELLO
call print
jmp $


HELLO:
    db 'Hello', 0

%include "boot_sect_print.asm"

times 510-($-$$) db 0
dw 0xaa55
