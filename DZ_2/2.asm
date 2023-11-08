section .data
    prb db ' '
section .bss
    fd1 resb 4
    fd2 resb 4
    fd3 resb 4

    buf resb 65535
    len resb 4

section .text
    global _start

_start:

    Open1:
        mov eax, 5
        pop ebx
        pop ebx
        pop ebx
        mov ecx, 0
        mov edx, 0
        int 0x80

    mov [fd1], eax

    Open2:
        mov eax, 5
        pop ebx
        mov ecx, 0
        mov edx, 0
        int 0x80

    mov [fd2], eax

    CreateOutF:
        mov eax, 8
        pop ebx
        mov ecx, 420
        int 0x80

        mov [fd3], eax

    Write:
        mov eax, 3
        mov ebx, [fd1]
        mov ecx, buf
        mov edx, 65535
        int 0x80

        sub eax, 1
        mov [len], eax

        mov eax, 4
        mov ebx, [fd3]
        mov ecx, buf
        mov edx, [len]
        int 0x80

        mov eax, 3
        mov ebx, [fd2]
        mov ecx, buf
        mov edx, 65535
        int 0x80

        sub eax, 1
        mov [len], eax

        mov eax, 4
        mov ebx, [fd3]
        mov ecx, buf
        mov edx, [len]
        int 0x80

    Close:
        mov eax, 6
        mov ebx, [fd1]
        int 0x80

        mov eax, 6
        mov ebx, [fd2]
        int 0x80

        mov eax, 6
        mov ebx, [fd3]
        int 0x80

End:
    mov eax, 1
    mov ebx, 0
    int 0x80
