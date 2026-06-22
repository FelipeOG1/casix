[bits 32]
VIDEO_MEMORY equ 0xb8000
WHITE_ON_BLACK 0x0f

print_string_pm:
    pusha
    move edx, VIDEO_MEMORY


print_string_loop:
    mov al, [ebx]
    mov ah, WHITE_ON_BLACK
    
    cmp al, 0
    je print_string_pm_done

    mov [edx], ax
    add edx, 1
    add edx, 2

    jmp print_string_loop

print_string_pm_done:
    popa
    ret
    
