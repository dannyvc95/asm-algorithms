section .data
	numero: equ 9
	
section .bss
	raiz: resb 8
	;cero: resb 8
	;temporal: resb 8

section .text
	global _start
	_start:
		mov rcx, 0
		mov byte[raiz], 0
		
		ciclo:
			mov rax, rcx
			mul rax
			cmp rax, numero
			je continuar
			inc rcx
			inc byte[raiz]
			jmp ciclo
			
		continuar:
			;mov byte[cero], 0
			;mov byte[temporal], 10
			mov rcx, raiz
			add byte[rcx], 48
			
			mov rax, 4
			mov rbx, 1
			mov rcx, raiz
			mov rdx, 8
			int 0x80
			
			mov rax, 1
			mov rbx, 0
			int 0x80
