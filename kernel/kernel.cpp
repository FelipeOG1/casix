#include "../drivers/screen.h"
#include "interrupts/idt.h"
void main() {
    Screen::main_display = Screen::Display(Screen::VgaColor::BLACK, Screen::VgaColor::GREEN);
    Screen::main_display.clean_screen();
    
    Interrupts::init_idt();
}

