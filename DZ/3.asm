section .bss
	x resb 2
	y resb 2

section .text
	global _start

_start:
	mov eax, 3
	mov ebx, 0
	mov ecx, x
	mov edx, 2
	int 0x80

	mov eax, 3
	mov ebx, 0
	mov ecx, y
	mov edx, 2
	int 0x80

	mov al, [x]
	mov bl, [y]
	sub al, 0x30
	sub bl, 0x30
	mul bl

	;add ax, 0x3030

	;cmp ax, 10
	;jl End

    mov bl, 10
    div bl

    add al, 0x30
    add ah, 0x30

    mov [x], al
    mov [y], ah

    mov eax, 4
    mov ebx, 1
    mov ecx, x
    mov edx, 1
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, y
    mov edx, 1
    int 0x80

	End:
		mov eax, 1
		mov ebx, 0
		int 0x80










