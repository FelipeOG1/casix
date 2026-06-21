read_disk:
    pusha
    
    xor ax, ax
    mov ds, ax
    mov es, ax
    
    
    mov ah, 0x02
    mov al, 0x01
    
    
    mov ch, 0
    mov dh, 0
    mov dl, 0x80 
    int 0x13

    popa
    ret
