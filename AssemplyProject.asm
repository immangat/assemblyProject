section .data
    prompt db "Enter a string: ", 0
    buffer resb 256
    len equ 256
    newline db 10

section .text
    global _start

_start:
    ; Display prompt
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt
    mov edx, len_prompt
    int 0x80

    ; Read input
    mov eax, 3
    mov ebx, 0
    mov ecx, buffer
    mov edx, len
    int 0x80
    
    ; Calculate length of input string
    mov esi, 0
    count_loop:
        cmp byte [buffer+esi], 0
        je print_input
        inc esi
        jmp count_loop
    
    ; Display input
    print_input:
    mov eax, 4
    mov ebx, 1
    mov ecx, buffer
    mov edx, esi
    int 0x80
    
    ; Print newline
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80
    
    ; Exit
    mov eax, 1
    xor ebx, ebx
    int 0x80

section .data
    len_prompt equ $-prompt
