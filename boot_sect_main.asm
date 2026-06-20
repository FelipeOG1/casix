[org 0x7c00] ;bootloader offset

mov dx, 0x12fe
call print_hex


%include "boot_sect_print.asm"
%include "boot_sect_printhex.asm"
times 510-($-$$) db 0
dw 0xaa55
