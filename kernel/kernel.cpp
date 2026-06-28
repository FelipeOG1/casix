#include "../drivers/screen.h"
#include "interrupts/idt.h"
void main() {
    Screen::VgaColor background = Screen::VgaColor::BLACK;
    Screen::VgaColor foreground = Screen::VgaColor::GREEN;
    Screen::Display main_display(background, foreground);
    
    main_display.clean_screen();
    main_display.write_char('$');
}

