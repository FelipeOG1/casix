;EACH SEGMENT IS  8 BYTES LONG
gdt_start:
    dd 0x00
    dd 0x00

gdt_code:
    dw 0xffff
    dw 0x00
    db 0x00
    db 10011010b ; flags (8 bits)
    db 11001111b ; flags (4 bits) + segment length, bits 16-19
    db 0x0       ; segment base, bits 24-31



gdt_data:
    dw dw 0xffff
    dw 0x0
    db 0x0
    db 10010010b
    db 11001111b
    db 0x0

gdt_end:
    

gdt_descriptor:
    dw gdt_end - gdt_start -1
    dd gdt_start
    

CODE_SEG equ gdt_code - gdt_start
DATA_SEG equ gdt_data - gdt_start
