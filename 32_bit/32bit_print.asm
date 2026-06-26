[bits 32]

VIDEO_MEMORY equ 0xb8000
WHITE_ON_BLACK equ 0xB2

print_string_pm:
    pusha
    mov edx, VIDEO_MEMORY


print_string_loop:
    mov al, [ebx]
    mov ah, WHITE_ON_BLACK
    
    cmp al, 0
    je print_string_pm_done

    mov [edx], ax
    add ebx, 1 ;next char on ebxd
    add edx, 2 ;next video memory on edx

    jmp print_string_loop

print_string_pm_done:
    popa
    ret
    
