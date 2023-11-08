section .data
	zero db '0'
	one db '1'
	str1 db 0xA
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
	
	ror dword[x], 1
	pushfd
	clc
	
	jc One1	

	Zero1:
		mov eax, 4
		mov ebx, 1
		mov ecx, zero
		mov edx, 1
		int 0x80

		mov eax, 4
		mov ebx, 1
		mov ecx, str1
		mov edx, 1
		int 0x80
 
		jmp Countain

	One1:
		mov eax, 4
		mov ebx, 1
		mov ecx, one
		mov edx, 1
		int 0x80
		
		mov eax, 4
		mov ebx, 1
		mov ecx, str1
		mov edx, 1
		int 0x80

	Countain:	
		popfd
		jc One

	Zero:
		mov eax, 4
		mov ebx, 1
		mov ecx, zero
		mov edx, 1
		int 0x80

		mov eax, 4
		mov ebx, 1
		mov ecx, str1
		mov edx, 1
		int 0x80
 
		jmp end

	One:
		mov eax, 4
		mov ebx, 1
		mov ecx, one
		mov edx, 1
		int 0x80
		
		mov eax, 4
		mov ebx, 1
		mov ecx, str1
		mov edx, 1
		int 0x80
		
	
	end:
		mov eax, 1
		mov ebx, 0
		int 0x80
	
