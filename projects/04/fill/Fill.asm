// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

	@8192
	D=A
	@endloop
	M=D
(BEGINNING)
	@row
	M=0
(RENDER)
	@KBD
	D=M
	@WHITE
	D;JEQ
(BLACK)
	@row
	D=M
	@SCREEN
	A=A+D
	M=-1
	@END
	0;JMP
(WHITE)
	@row
	D=M
	@SCREEN
	A=A+D
	M=0
(END)
	@row
	MD=M+1
	@endloop
	D=D-M
	@BEGINNING
	D;JEQ
	@RENDER
	0;JMP

