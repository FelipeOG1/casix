; int 0x10 trigers video interrupt
; mov ah, 0x0e enters tty mode 
print:
    pusha
    mov ah, 0x0e

start:
    mov al, [bx]
    cmp al, 0
    je done

    int 0x10
    add bx, 1
    jmp start

done:
    popa
    ret
