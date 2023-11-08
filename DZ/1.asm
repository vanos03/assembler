section .bss
	x resb 4

section .text
	global _start

_start:
	mov eax, 3
	mov ebx, 0
	mov ecx, x
	mov edx, 4
	int 0x80

	mov al, [x]
	cmp al, 0x5A ; cmp Z
	je End

	cmp al, 0x7A ; cmp z
	je End
	
	add al, 0x01	
	mov byte[x], al

	mov eax, 4
	mov ebx, 1
	mov ecx, x
	mov edx, 4
	int 0x80

	End:
		mov eax, 1
		mov ebx, 0
		int 0x80


