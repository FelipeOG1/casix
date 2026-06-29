#include "../drivers/screen.h"
#include "interrupts/idt.h"
void main() {
    Interrupts::init_idt();
    
    __asm__ volatile("int $0");
}
