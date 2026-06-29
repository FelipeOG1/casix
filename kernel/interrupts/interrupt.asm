[bits 32]
extern exception_handler


global isr0


isr0:
    pusha
    push 0
    call exception_handler
    add esp, 4
    popa
    iretd
