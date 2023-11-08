section .data
	filename db "test.txt", 0
	;msg db "dfasfs", 0
	;len equ $ - msg
	
section .bss
	fd resb 4
	msg resb 10
	
	
section .text
	global _start
	
_start:
	mov eax, 8
	mov ebx, filename
	mov ecx, 420
	int 0x80
	
	mov eax, 3
	mov ebx, 0
	mov ecx, msg
	mov edx, 10
	int 0x80
	
	mov [fd], eax
	
	mov eax, 4
	mov ebx, [fd]
	mov ecx, msg
	mov edx, 10
	int 0x80
	 
	mov eax, 6
	mov ebx, [fd]
	int 0x80

	mov eax, 1
	mov ebx, 0
	int 0x80
