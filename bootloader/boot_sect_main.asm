[org 0x7c00]
mov bp, 0x9000
mov sp, bp


mov bx, MSG_REAL_MODE
call print

jmp $


%include "bootloader/boot_sect_print.asm"
%include "bootloader/boot_sect_disk.asm"
%include "bootloader/boot_sect_printhex.asm"






MSG_REAL_MODE db "STARTED 16-BIT PROTECTED MODE", 0
MSG_PROT_MODE db "LOADED 32-BIT PROTECTED MODE", 0


;(bootsector)
times 510 -($-$$) db 0
dw 0xaa55

times 512 db 5
times 512 db 10

