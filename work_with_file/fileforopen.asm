	
section .bss
	fd resb 4
	buffer resb 10
	
	
section .text
	global _start
	
_start:
	pop ebx
	pop ebx
	pop ebx
	mov eax, 5
	mov ecx, 0
	mov edx, 0
	int 0x80
	
	mov [fd], eax
	
	mov eax, 19
	mov ebx, [fd]
	mov ecx, -3
	mov edx, 2
	int 0x80
	
	mov eax, 3
	mov ebx, [fd]
	mov ecx, buffer
	mov edx, 10
	int 0x80
	 
	mov edx, eax
	mov eax, 4
	mov ebx, 1
	mov ecx, buffer
	int 0x80

	mov eax, 1
	mov ebx, 0
	int 0x80
