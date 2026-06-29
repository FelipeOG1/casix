#include "idt.h"
#include "../../drivers/screen.h"

namespace Interrupts {
    extern "C" void isr0();
    extern "C" void exception_handler(int interrupt_n) {
        if (interrupt_n == 0) {
            Screen::main_display.show_panic_display();
        }
    }
    
    IdtPointer idt_ptr;
    
    IdtEntry idt[256];
    void set_idt_gate(int n, uint32_t handler, uint16_t selector, uint8_t flags) {
        idt[n].low_offset = handler & 0xFFFF;
        idt[n].selector = selector;
        idt[n].always0 = 0;
        idt[n].flags = flags;
        idt[n].high_offset = (handler >> 16) & 0XFFFF;
           
    }
    void init_idt() {
        idt_ptr.limit = (sizeof(IdtEntry) * 256) - 1;
        idt_ptr.base = (uint32_t)&idt;
        for (int i=0; i < 256; i++) set_idt_gate(i, 0, 0, 0);
        set_idt_gate(0, (uint32_t)isr0, 0x08, 0x8E);
        __asm__ volatile("lidt (%0)" : : "r"(&idt_ptr));
    }


 
}
