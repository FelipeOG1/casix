void main() {
	char* vga_entry = (char*) 0xb8000;
    for (int i=0 ; i<20; i++) {
        *vga_entry = 'z';
        vga_entry += 1;
            
    }
    
}

