#pragma once
#include "../../common/types.h"

namespace Interrupts{
    struct IdtEntry {
        uint8_t low_offset;
        uint16_t selector;
        uint8_t always0;
        uint8_t flags;
        uint16_t high_offset;
    } __attribute__((packed));
    
    struct IdtPointer {
        uint16_t limit;
        uint16_t base;
    } __attribute__((packed));
    
    void init_idt();
    void set_idt_gate(int n, uint32_t handler, uint16_t selector, uint8_t flags);
 
}
