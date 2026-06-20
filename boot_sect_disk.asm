load_from_disk:
    pusha
    push dx
    
    mov ah, 0x02   ;ah-> mode(0x02 read mode)
    mov al, dh     ;al->number of sectors
    mov cl, 0x02   ;cl->sector number
    
    mov ch, 0x00   ;ch->cylinder number
    
    mov dh, 0x00   ;dh-> head number
    
    int 0x13;      ;BIOS DISK INTERRUPT
    
    
