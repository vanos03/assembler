section .bss
    str1 resb 20

section .text
	global _start

_start:

	mov eax, 3
	mov ebx, 0
	mov ecx, str1
	mov edx, 20
	int 0x80

	mov eax, 4
	mov ebx, 1
	mov ecx, str1

	mov bl, byte[ecx]
	mov bh, byte[ecx + 3]
	mov byte[ecx + 3], bl
	mov byte[ecx], bh

	mov bl, byte[ecx + 2]
	mov bh, byte[ecx + 7]
	mov byte[ecx + 7], bl
	mov byte[ecx + 2], bh

	mov ebx, 1
	mov edx, 20
	int 0x80

	End:
		mov eax, 1
		mov ebx, 0
		int 0x80










