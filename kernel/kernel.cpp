#include "../drivers/screen.h"

void main() {
    ScreenDriver::Display display;
    display.write_char('x', ScreenDriver::VgaColor::BLACK, ScreenDriver::VgaColor::BLUE);
    display.write_char('e', ScreenDriver::VgaColor::BLACK, ScreenDriver::VgaColor::BLUE);
}

