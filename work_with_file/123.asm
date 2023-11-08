
section .bss
	x resb 4
	y resb 4
	z resb 4
	
section .text
	global _start
	
_start:
		mov eax, 3
		mov ebx, 0
		mov ecx, x ; 0x31 \n
		mov edx, 4
		int 0x80
		
		mov eax, 3
		mov ebx, 0
		mov ecx, y
		mov edx, 4
		int 0x80
		
		mov eax, 3
		mov ebx, 0
		mov ecx, z
		mov edx, 4
		int 0x80
		
		f1:
		cmp byte[x], "5"
		jg funcx
		
		f2:
		cmp byte[y], "5"
		jg funcy
		
		f3:
		cmp byte[z], "5"
		jg funcz
		jmp fout
		
		funcx:
			mov eax, 4
			mov ebx, 1
			mov ecx, x
			mov edx, 4
			int 0x80
			jmp f2
		
		funcy:
			mov eax, 4
			mov ebx, 1
			mov ecx, y
			mov edx, 4
			int 0x80
			jmp f3
		
		funcz:
			mov eax, 4
			mov ebx, 1
			mov ecx, z
			mov edx, 4
			int 0x80
			jmp fout
			
		fout:	
		mov eax, 1
		mov ebx, 0
		int 0x80
		
		
