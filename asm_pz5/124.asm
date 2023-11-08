section .bss
	x resb 4
section .text
	global _start

_start:
	;stc
	clc
	mov ax, 0x30
	mov bx, 0x31

	cmovc cx, ax
	cmovae cx, bx
	mov [x], cx
		
	mov eax, 4
	mov ebx, 1
	mov ecx, x
	mov edx, 1
	int 0x80

	End:
		mov eax, 1
		mov ebx, 0
		int 0x80
