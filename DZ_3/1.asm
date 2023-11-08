%include "mac.inc"

section .data
    prb db 0xA
section .bss
    fd resb 65535

    buf resb 65535
    len resb 4

    x resb 2

section .text

    formating:
        stosw
        ;mov ax, [x]
        mov bl, 7
        mul bl
        add ax, 17
        ;xchg al, bl
        mov bx, 256
        div bx

        mov ax, dx

        add esi, 2

; ;         mov [x], dx
; ;
; ;         mov eax, 4
; ;         mov ebx, [fd]
; ;         mov ecx, x
; ;         mov edx, 2
; ;         int 0x80

    ret


    global _start

_start:

    Open:
        mov eax, 5
        pop ebx
        pop ebx
        pop ebx
        mov ecx, 2
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

        .setCursor:
                mov eax, 19
                mov ebx, [fd]
                mov ecx, 0
                mov edx, 0
                int 0x80

        ;mov ecx, eax
        ;lea esi, [buf]

    mov ax, 195
    lea edi, [buf]
    ;mov [x], ax
    xor dx, dx

    mov ecx, [len]
    Converting:
        push ecx
        call formating
        pop ecx
    loop Converting

   ; mov [buf], esi


     Writing:

         mov eax, 19
         mov ebx, [fd]
         mov ecx, 0
         mov edx, 0
         int 0x80

         mov eax, 4
         mov ebx, [fd]
         mov ecx, buf
         mov edx, [len]
         int 0x80


    Close:
        mov eax, 6
        mov ebx, [fd]
        int 0x80



    End:
        mov eax, 1
        mov ebx, 0
        int 0x80

