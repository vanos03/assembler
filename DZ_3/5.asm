%include "mac.inc"

section .data
    prb db 0xA

section .bss
    fd resb 65535

    buf resb 65535
    len resb 4

    x resb 4
    y resb 4

		
section .text
	global _start                 

_start:     

	Open:
        mov eax, 5
        pop ebx
        pop ebx
        pop ebx
        mov ecx, 0
        mov edx, 0
        int 0x80

    mov [fd], eax

	Read:
        mov eax, 3
        mov ebx, [fd]
        mov ecx, buf
        mov edx, 65535
        int 0x80

	mov [len], eax
	
	Close:
        mov eax, 6
        mov ebx, [fd]
        int 0x80

	Finding1:
		mov ecx, [len]
		mov edi, buf
		add edi, [x]
		mov dword[x], buf
		mov eax, 0xA

		cld
		repne scasb
		jne End
	
		IfExist1:
			sub edi, [x]
			mov [x], edi
		
	Finding2:
		mov ecx, [len]
		mov edi, buf
		add edi, [x]
		inc edi

		mov [x], edi
		mov eax, 0xA

		cld
		repne scasb
		jne End
	
		IfExist2:
			sub edi, [x]
			mov [y], edi

			mov ecx, [x]
			dec ecx

			mov eax, 4
			mov ebx, 1
			mov edx, [y]
			int 0x80
	
	
	
	
	End:
		mov eax, 1
        mov ebx, 0
        int 0x80
