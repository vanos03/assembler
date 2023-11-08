%include "mac.inc"

section .data
    prb db 0xA
    symvl db '1'

section .bss
    fd resb 65535

    buf resb 65535
    len resb 4

    x resb 4
    count resb 4


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

    mov ax, [len]
    xor edx, edx
    mov [count], edx
    mov bl, 10

        Converting:
            cmp al, 0
            je Out

            inc edx
            mov [count], edx

            mov bl, 10
            div bl

            push ax
            xor ah, ah

        jmp Converting


    Out:
        mov ecx, [count]
        OutPuts:
            pop ax
            push ecx

            add ah, 0x30
            mov [x], ah

            print x, 1
            pop ecx

    loop OutPuts




    End:
        mov eax, 1
        mov ebx, 0
        int 0x80
