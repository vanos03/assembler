%include "mac.inc"

section .data
    one db "1"

section .bss
	x resb 4
	y resb 4

	ml1 resb 1
	ml2 resb 1
	stt1 resb 1
	stt2 resb 1


	c1 resb 1
	c2 resb 1

section .text:
global _start
Converting:
    mov bl, [c1]
    cmp bl, 3
    je .intwo
        mov ax, [x]
        sub al, 0x30
        mov [ml1], al
        jmp .cont
        .intwo:
            mov ax, [x]
            sub ax, 0x3030
            mov [ml1], ah
            mov [stt1], al

    .cont:
        mov bl, [c2]
        cmp bl, 3
        je .intwo1
            mov ax, [y]
            sub al, 0x30
            mov [ml2], al
            jmp Sum
        .intwo1:
            mov ax, [y]
            sub ax, 0x3030
            mov [ml2], ah
            mov [stt2], al



    Sum:
        mov al, [stt1]
        mov ah, [stt2]
        mov cl, [ml1]
        mov ch, [ml2]

        add al, ah
        daa
        add cl, ch
        cmp cl, 10
        jl .mlLowerTen
            inc al
            sub cl, 10
        .mlLowerTen:
            cmp al, 10
            jl .l100
            jne .ifnot100
                sub al, 10
            jmp .dont16
            .ifnot100:
                sub al, 16
            .dont16:
                add al, 0x30
                mov [c1], al
                add cl, 0x30
                mov [c2], cl

                print one, 1
                print c1, 1
                print c2, 1
                jmp End

            .l100:
                add al, 0x30
                mov [c1], al
                add cl, 0x30
                mov [c2], cl

                print c1, 1
                print c2, 1



ret

global _start

    _start:

        input x, 4
        mov [c1], eax

        input y, 4
        mov [c2], eax

        call Converting

End:
	mov eax, 1
	mov ebx, 0
	int 0x80


