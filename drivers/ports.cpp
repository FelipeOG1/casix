//"in instruction reads from a I/O port"
//"%% use for access registers ex => %%dx, %%eax"

// AT&T syntax source: destination

namespace Ports{
    unsigned char read_port_byte(unsigned short port) {
        unsigned char out;
        
        __asm__("in %%dx, %%al" : "=a" (out) : "d"(port));
        return out;
    }


    void write_port_byte(unsigned short port, unsigned char data) {
           
        __asm__("out %%al, %%dx" :  :"a" (data), "d"(port));
    }

    unsigned short read_port_word(unsigned short port) {
        unsigned short out;

        __asm__("in %%dx, %%ax" : "=a"(out) : "d"(port));

        return out;

    }

    void write_port_word(unsigned short port, unsigned short data){

        __asm__("out %%ax, %%dx" :  :"a" (data), "d"(port));

    }

}
