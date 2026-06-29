namespace Screen{
     enum VgaColor : unsigned char {
        BLACK          = 0,
        BLUE           = 1,
        GREEN          = 2,
        CYAN           = 3,
        RED            = 4,
        MAGENTA        = 5,
        BROWN          = 6,
        LIGHT_GRAY     = 7,
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
        int get_row(int row) {  return 80*row; }
        void write_char(char value);
        void clean_screen();
        void show_panic_display();

        Display(Screen::VgaColor background, Screen::VgaColor foreground) :
        _cursor(Cursor()), _background_color(background), _foreground_color(foreground) {}
    
    };


    extern Display main_display;

}
