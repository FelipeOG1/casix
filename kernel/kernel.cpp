#include "../drivers/screen.h"

void main() {
    ScreenDriver::write_char('x', 
                             ScreenDriver::Color::BLUE,
                             ScreenDriver::Color::BLACK);

    ScreenDriver::write_char('x', 
                             ScreenDriver::Color::BLUE,
                             ScreenDriver::Color::BLACK);

    

}

