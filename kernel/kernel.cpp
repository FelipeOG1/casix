#include "../drivers/screen.h"

void main() {
    Screen::VgaColor background = Screen::VgaColor::BLACK;
    Screen::VgaColor foreground = Screen::VgaColor::BLACK;
    Screen::Display display(background, foreground);
    display.clean_screen();
}

