[org 0x7c00]
KERNEL_OFFSET equ 0x1000

mov bp, 0x9000
mov sp, bp

mov bx, MSG_REAL_MODE
call print
call println

call load_kernel
call switch_to_pm
jmp $

%include "bootloader/boot_sect_print.asm"
%include "bootloader/boot_sect_disk.asm"
%include "32_bit/32bit_switch.asm"
%include "32_bit/32bit_gdt.asm"
%include "32_bit/32bit_print.asm"


[bits 16]
load_kernel:
    mov bx, MSG_KERNEL
    call print
    call println
    
    mov bx, KERNEL_OFFSET
    mov dh, 5
    mov dl, [BOOT_DRIVE]
    call read_disk
    ret

[bits 32]
BEGIN_PM:
    mov bx, MSG_PROT_MODE
    call print_string_pm
    call KERNEL_OFFSET 
    jmp $

BOOT_DRIVE db 0;
MSG_REAL_MODE db "STARTED 16-BIT PROTECTED MODE",0
MSG_PROT_MODE db "WELCOME TO CASIX OS",0
MSG_KERNEL db "Loading kernel into memory", 0

;(bootsector)
times 510 -($-$$) db 0
dw 0xaa55

