%include "mac.inc"

section .data
    prb db ' '
    prv db 0xA

section .bss
    fd resb 4
    buf resb 65535
    size resb 4
    x resb 2

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

        mov [size], eax

    Close:
        mov eax, 6
        mov ebx, [fd]
        int 0x80

    lea esi, [buf]
    mov ecx, [size]

    IntoHex:
        push ecx
        xor eax, eax

        lodsb
        mov bl, 0x10
        div bl

        cmp al, 0x0a
        jl p1
        add al, 0x07

        p1:
            add al, 0x30

        cmp ah, 0x0a
        jl p2
        add ah, 0x07

        p2:
            add ah, 0x30

        mov [x], ax
        print x, 2
        print prb, 1

        pop ecx

    loop IntoHex

    End:
        print prv, 1
        mov eax, 1
        mov ebx, 0
        int 0x80


