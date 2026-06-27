[org 0x7c00]
KERNEL_OFFSET eq 0x1000 ; same as linker adress;

mov bp, 0x9000
mov sp, bp

mov bx, MSG_REAL_MODE
call print
call switch_to_pm
jmp $

%include "bootloader/boot_sect_print.asm"
%include "32_bit/32bit_switch.asm"
%include "32_bit/32bit_gdt.asm"
%include "32_bit/32bit_print.asm"



[bits 32]
BEGIN_PM:
    mov bx, MSG_PROT_MODE
    call print_string_pm
    jmp $


MSG_REAL_MODE db "STARTED 16-BIT PROTECTED MODE",0
MSG_PROT_MODE db "WELCOME TO CASIX OS",0


;(bootsector)
times 510 -($-$$) db 0
dw 0xaa55

times 512 db 5
times 512 db 10

