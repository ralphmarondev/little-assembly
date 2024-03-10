; subroutines are functions
section .data
    msg db 'Hello World, Ralph Maron Eda is here', 0
    newline db 10

section .text
    global _start

_start:
    mov eax, msg        ; move the address of our message string into eax
    call strlen         ; call our function to calculate the length of the string

    mov edx, eax        ; our function leaves the result in eax
    mov ecx, msg        ; same as before
    mov ebx, 1
    mov eax, 4
    int 80h 

    ; printing newline
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 80h 

    mov ebx, 0          ; return 0 status on exit - 'No errors'
    mov eax, 1          ; invoke sys_exit [kernel opcode 1]
    int 80h

strlen:                 ; first function decleration
    push ebx            ; push the value in ebx into stack to preserve it while we user ebx in this function
    mov ebx, eax        ; move the address in eax, into ebx [both point to the same segment in memory]

nextchar: 
    cmp byte [eax], 0   ; compare the byte pointed to by eax at this address against zero [zero is an end of string delimiter]
    jz finished         ; jump [if the zero flagged has been set]
    inc eax             ; increment the address in eax by one byte [if the zero flagged has not been set]
    jmp nextchar        ; jump to the point in the code labeled 'nextchar'

finished:
    sub eax, ebx
    pop ebx             ; pop the value on the stack back into ebx
    ret                 ; return to where the function was called

