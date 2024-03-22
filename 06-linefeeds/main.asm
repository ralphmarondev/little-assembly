; linefeeds
%include 'functions.asm'

section .data
    msg1 db 'Hello there, Ralph Maron Eda is here', 0h 
    msg2 db 'He is a Computer Engineering student.', 0h 

section .text 
    global _start 

_start:
    mov eax, msg1
    call sprintLF

    mov eax, msg2
    call sprintLF

    call quit