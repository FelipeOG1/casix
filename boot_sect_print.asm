print:
    pusha

start:
    mov al, [bx]
    cmp al, 0
    je done




done:
    popa
    ret
