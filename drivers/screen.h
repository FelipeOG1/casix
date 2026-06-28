namespace ScreenDriver{
    enum VgaColor: unsigned char {
        BLACK = 0,
        BLUE = 1,
        
    };
    class Cursor {
    private:
        int _position;
        
    public:
        int get_position();
        void update_position(int new_position);
        Cursor() : _position(get_position()) {}

        int position() const { return _position; }
    }; 
       
    class Display {
        Cursor _cursor;
        
    public:
        void write_char(char value, 
                    ScreenDriver::VgaColor background,
                    ScreenDriver::VgaColor foreground);
        void clean_screen();

        Display() : _cursor(Cursor()) {}
    
    };
   

}
