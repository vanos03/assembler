section .data
    prb db ' '
    one db '1'
    zero db '0'

section .bss
    fd1 resb 65535

    buf resb 65535
    len resb 4

    x resb 4
    ost resb 1
    l1 resb 4

section .text
    global _start

_start:

WorkWithFile:

    Open:
        mov eax, 5
        pop ebx
        pop ebx
        pop ebx
        mov ecx, 0
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
        mov [l1], eax
    Close:
        mov eax, 6
        mov ebx, [fd1]
        int 0x80

    lea esi, [buf]
    mov ax, [len]
    mov bl, 4
    div bl
    ;mov [ost], ah
    mov [len], al
    mov [ost], ah

Arfmetic:
    cmp ah, 0
    jg ADD
    jmp p1

    ADD:
        mov ecx, [len]
        inc ecx

    p1:
        lea esi, [buf]
        mov ecx, [len]
        Converting:
            push ecx
            lodsd
            xor [x], eax
            pop ecx

        loop Converting

    mov ah, [ost]
    cmp ah, 0
    je Skip

     lodsd
     xor [x], eax


    Skip:
    mov eax, [x]
    mov ecx, 32
    ToBit:
            push ecx
            rol eax, 1
            push eax

            jc PrintOne

            PrintZero:
                mov eax, 4
                mov ebx, 1
                mov ecx, zero
                mov edx, 1
                int 0x80

                jmp Continue

            PrintOne:
                mov eax, 4
                mov ebx, 1
                mov ecx, one
                mov edx, 1
                int 0x80

            Continue:
                pop eax
                pop ecx

    loop ToBit


End:
    mov eax, 1
    mov ebx, 0
    int 0x80
