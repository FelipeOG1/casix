[org 0x7c00] ;bootloader offset

mov bx, HELLO
call print




HELLO:
    db 'SAUL CONTEMPORANEO', 0

GOODBYE:
    db 'Goodbye', 0



%include "boot_sect_print.asm"
%include "boot_sect_printhex.asm"
times 510-($-$$) db 0
dw 0xaa55
