; TODO: fix this! it prints ';' when I input 'ralphmaron' :D

section .data
    msg db 'Enter a string: ', 0
    len_msg equ $ - msg
    input_buffer db 100

section .bss
    user_input resb 100
    input_length resb 10  ; Increase buffer size to accommodate larger numbers

section .text
    global _start

_start:
    ; print the message asking for input
    mov eax, 4
    mov ebx, 1
    mov ecx, msg
    mov edx, len_msg
    int 0x80

    ; read user input
    mov eax, 3
    mov ebx, 0
    mov ecx, user_input
    mov edx, 100
    int 0x80

    ; calculate the length of the user input string
    mov ecx, user_input
    xor eax, eax
    xor ebx, ebx           ; Clear EBX to ensure correct calculation

loop_calc_length:
    cmp byte [ecx + ebx], 0  ; Accessing elements of user_input buffer sequentially
    je end_calc_length
    inc ebx 
    jmp loop_calc_length

end_calc_length:
    mov [input_length], bl    ; Store the length in input_length variable

    ; convert the length to string
    add byte [input_length], '0'  ; Convert length to ASCII character

    ; print the length of the user input
    mov eax, 4
    mov ebx, 1
    mov ecx, input_length
    mov edx, 1
    int 0x80

    ; exit the program
    mov eax, 1
    xor ebx, ebx
    int 0x80
