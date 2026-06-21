;(bx=buffer, cl=sector_to_rea)
read_disk: 
    pusha
    ;-------------------
    ;READ FROM 0X0000
    ;-------------------
    xor ax, ax 
    mov ds, ax
    mov es, ax
    

    mov ah, 0x02 ; Read mode
    mov al, 0x01 ; Number of sectors
    mov ch, 0 ; cylinder
    mov dh, 0 ; head 
    int 0x13 ; disk interrupt

    popa
    ret
