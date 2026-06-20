print_hex:
    pusha
    mov cx, 0




done:
    popa
    ret

hex_loop:
    cmp cx, 4
    je done
    add cx, 1 
