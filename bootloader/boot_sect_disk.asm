; bx = buffer address
; dh = number of sectors to read
; dl = drive number
read_disk:
    pusha
    ; es:bx is the buffer
    xor ax, ax
    mov es, ax

    mov ah, 0x02    ; Read mode
    mov al, dh      ; Number of sectors
    mov ch, 0       ; Cylinder 0
    mov cl, 2       ; Start at sector 2 (right after boot sector)
    mov dh, 0     ; Head 0
    ; dl already has drive number
    int 0x13        ; disk interrupt

    jc disk_error   ; if carry flag is set, there was an error

    popa
    ret

disk_error:
    mov bx, DISK_ERROR_MSG
    call print
    call println
    jmp $           ; hang

DISK_ERROR_MSG db "Disk read error!", 0
