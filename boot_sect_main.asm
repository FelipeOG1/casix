[org 0x7c00] ;bootloader offset

mov al, [HELLO]
call print
jmp $

print:
    mov ah, 0x0e
    int 0x10
    ret

HELLO:
    db 'Hello', 0

BYE:
    db 'Bye', 0


times 510-($-$$) db 0
dw 0xaa55
