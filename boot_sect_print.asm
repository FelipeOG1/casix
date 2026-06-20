; int 0x10 trigers video interrupt
; mov ah, 0x0e enters tty mode 


print:
    pusha
    
start: ; increment bx contents by 1 pointer until null char is found (0)
    mov al, [bx]
    cmp al, 0
    je done

    mov ah, 0x0e 
    int 0x10 
    
    add bx, 1
    jmp start

done:
    popa
    ret


println:
    pusha
    
    mov ah, 0x0e
    mov al, 0x0a; newline char
    int 0x10
    mov al, 0x0d ; move cursor to start line
    int 0x10
    popa
    ret
