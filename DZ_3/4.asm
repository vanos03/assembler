%include "mac.inc"

section .bss
    len resb 4
    gamma resb 4
    buf resb 100

section .text
    global _start

_start:

    input buf, 100
    mov [len], eax

    input gamma, 4
    sub dword[gamma], 0x30303030

    lea esi, [buf]
    lea edi, [buf]
    mov edx, [gamma]

    mov ecx, [len]
    dec ecx
    Converting:
        lodsd
        xor eax, edx
        stosd
        sub esi, 3
        sub edi, 3
    loop Converting

    print buf, [len]




    End:
        mov eax, 1
        mov ebx, 0
        int 0x80
