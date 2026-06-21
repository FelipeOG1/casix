[org 0x7c00]

mov bx, 0x9000
mov cl, 0x03
call read_disk
mov dx, [bx]
call print_hex

jmp $





%include "boot_sect_print.asm"
%include "boot_sect_printhex.asm"
%include "boot_sect_disk.asm"
times 510 - ($ - $$) db 0
dw 0xaa55

times 256 dw 0xdada   ; sector 2 (512 bytes)
times 256 dw 0xface   ; sector 3 (512 bytes)
times 256 dw 0xface   ; sector 3 (512 bytes)

