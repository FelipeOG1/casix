void entry_point(){ };

void main() {
	char* vga_entry = (char*) 0xb8000;
	*vga_entry = 'X';
}

