namespace Screen{
    enum VgaColor: unsigned char {
        BLACK = 0,
        BLUE = 1,
        
    };
    constexpr unsigned char WIDTH = 80;
    constexpr unsigned char HEIGHT = 25;
    constexpr int  TOTAL_CELLS = WIDTH * HEIGHT;
    

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
        Screen::VgaColor _background_color;
        Screen::VgaColor _foreground_color;
    public:
        void write_char(char value);
    
        void clean_screen();

        Display(Screen::VgaColor background, Screen::VgaColor foreground) :
        _cursor(Cursor()), _background_color(background), _foreground_color(foreground) {}
    
    };
   

}
