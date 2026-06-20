[org 0x7c00] ;bootloader offset


mov bx, HELLO
call print
call println
mov bx, BYE
call print

jmp $




%include "boot_sect_print.asm"

HELLO:
    db 'Hello', 0

BYE:
    db 'Bye', 0


times 510-($-$$) db 0
dw 0xaa55
