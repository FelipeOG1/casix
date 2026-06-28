namespace Ports {
    enum VgaPorts{
        PORT_VGA = 0x3d4
    };   



    unsigned char read_port_byte(unsigned short port); 
    void write_port_byte(unsigned short port, unsigned char data);
    unsigned short read_port_word(unsigned short port);
    void write_port_word(unsigned short port, unsigned short data);

}

