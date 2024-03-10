; user input using assembly [nasm]
section .text
	global _start

_start:
	; print the message asking for input
	mov eax, 4				; sys_write syscall number
	mov ebx, 1				; file descriptor (stdout)
	mov ecx, prompt			; pointer to the message
	mov edx, prompt_len		; length of the message
	int 80h					; invoke syscall

	; read user input
	mov eax, 3				; sys_read syscall number
	mov ebx, 0				; file descriptor (stdin)
	mov ecx, user_input		; pointer to the buffer
	mov edx, 100			; maximum number of bytes to read
	int 80h

	; print the user input
	mov eax, 4
	mov ebx, 1
	mov ecx, user_input
	mov edx, 100
	int 80h

	; exit the program
	mov eax, 1				; sys_exit syscall number
	xor ebx, ebx			; return 0 status
	int 80h

section .data
	prompt db 'Enter your name: ', 0
	prompt_len equ $ -prompt
	input_buffer db 100		; buffer to store user input

section .bss
	user_input resb 100		; reserved space for user input

