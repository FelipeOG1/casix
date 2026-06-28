//"in instruction reads from a I/O port"
//"%% use for access registers ex => %%dx, %%eax"

// AT&T syntax source: destination
unsigned char read_port_byte(unsigned short port) {
    unsigned char res;
    
    __asm__("in %%dx, %%al" : "=a" (res) : "d"(port));
    return res;
}


void write_port_byte(unsigned short port, unsigned char data) {
       
    __asm__("out %%al, %%dx" :  :"a" (data), "d"(port));
}

unsigned short read_port_word(unsigned short port) {
    unsigned short result;
    
    __asm__("in %%dx, %%al" : "=a"(result) : "d"(port));
    
    return result;
    
}

void write_port_word(unsigned short port, unsigned short data){
       
    __asm__("out %%al, %%dx" :  :"a" (data), "d"(port));
    
}
    




    
