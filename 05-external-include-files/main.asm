; hello world (external file include)
%include 'functions.asm'

; null terminating byte [0Ah, 0h] prints the string one line after another
section .data 
    msg1 db 'Hello world, Ralph Maron Eda is here!', 0Ah, 0
    msg2 db 'Learning assembly [nasm] is fun!', 0Ah, 0
    msg3 db 'This is how we recycle in NASM.', 0Ah, 0

section .text 
    global _start

_start:
    mov eax, msg1
    call sprint

    mov eax, msg2
    call sprint

    mov eax, msg3
    call sprint

    call quit
