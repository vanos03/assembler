section .data
    prb db ' '
section .bss
    fd1 resb 4

    buf resb 65535
    len resb 4

    x resb 4
    name resb 4

section .text
    global _start

_start:

    Open1:
        mov eax, 5
        pop ebx
        pop ebx
        pop ebx
        mov [name], ebx
        mov ecx, 2
        mov edx, 0
        int 0x80

    mov [fd1], eax


    Read:
        mov eax, 3
        mov ebx, [fd1]
        mov ecx, buf
        mov edx, 65535
        int 0x80

        sub eax, 1
        mov [len], eax

    Close1:
        mov eax, 6
        mov ebx, [fd1]
        int 0x80



    Open:
        mov eax, 5
        mov ebx, [name]
        mov ecx, 2
        mov edx, 0
        int 0x80

    mov [fd1], eax

    lea esi, [buf]
    lea edi, [buf]
    mov ecx, [len]

    Converting:
        push ecx
        lodsb

        mov ah, 0x61
        cmp al, ah
        jl Continue

        mov ah, 0x7b
        cmp al, ah
        jg Continue

        sub al, 0x20
        stosb


        Continue:
            pop ecx
    loop Converting

    Write:
        mov eax, 4
        mov ebx, [fd1]
        mov ecx, buf
        mov edx, [len]
        int 0x80

    Close:
        mov eax, 6
        mov ebx, [fd1]
        int 0x80


End:
    mov eax, 1
    mov ebx, 0
    int 0x80
