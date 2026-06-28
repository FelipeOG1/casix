#include "ports.h"
#include "screen.h"
namespace ScreenDriver{
    
    volatile char* vga = (volatile char*)0xb8000;

    int Cursor::get_position() {
        Ports::write_port_byte(Ports::VgaPorts::PORT_VGA, 14); // request HIGH BYTE
        int position = Ports::read_port_byte(Ports::VgaPorts::PORT_VGA + 1) << 8; // read and store high byte
        Ports::write_port_byte(Ports::VgaPorts::PORT_VGA, 15); // request LOW BYTE
        position  |= Ports::read_port_byte(Ports::VgaPorts::PORT_VGA + 1); // combine with low byte
        return position;
    }
    
    void Cursor::update_position() {
        Cursor::_position += 1;
        Ports::write_port_byte(Ports::VgaPorts::PORT_VGA, 14);
        Ports::write_port_byte(Ports::VgaPorts::PORT_VGA + 1,
                               (Cursor::_position >> 8) & 0xFF);

        Ports::write_port_byte(Ports::VgaPorts::PORT_VGA, 15);
        Ports::write_port_byte(Ports::VgaPorts::PORT_VGA + 1, 
                               Cursor::_position & 0xFF);
    }
    
    void Display::write_char(char value, 
                    ScreenDriver::VgaColor background,
                    ScreenDriver::VgaColor foreground) {
    
        int offset_vga = Display::_cursor.position() * 2;
        unsigned char color_attr = (background << 4) | foreground; 
        vga[offset_vga] = value;
        vga[offset_vga+1] = color_attr;
        Display::_cursor.update_position();
    }


}

