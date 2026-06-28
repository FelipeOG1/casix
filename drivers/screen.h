namespace ScreenDriver{
    
    enum Color: unsigned char {
        BLACK = 0,
        BLUE = 1,
        
    };
    int get_cursor_position();
    void write_char(char value, 
                    ScreenDriver::Color background,
                    ScreenDriver::Color foreground);
    

}
