 section .data
	ln1: db "Primer valor = ", 00h
	ln2: db 25h, 6ch, 66h, 00h
	ln3: db "Segundo valor = ", 00h
	ln4: db "Resultado = ", 25h, 6ch, 66h, 0ah, 00h
	
section .text
global _start
	_start:
		extern scanf
		extern printf
		push rbp
		mov rbp, rsp
		sub rsp, 16
		mov edi, ln1
		mov eax, 0
		call printf
		lea rax, [rbp-8h]
		mov rsi, rax
		mov edi, ln2
		mov eax, 0
		call scanf
		mov edi, ln3
		mov eax, 0
		call printf
		lea rax, [rbp-10h]
		mov rsi, rax
		mov edi, ln2
		mov eax, 0
		call scanf
		movsd xmm1, qword [rbp-8h]
		movsd xmm0, qword [rbp-10h]
		mulsd xmm0, xmm1
		mov edi, ln4
		mov edi, ln2
		mov eax, 0
		call scanf
		mov edi, ln3
		mov eax, 0
		call printf
		lea rax, [rbp-10h]
		mov rsi, rax
		mov edi, ln2
		mov eax, 0
		call scanf
		movsd xmm1, qword [rbp-8h]
		movsd xmm0, qword [rbp-10h]
		mulsd xmm0, xmm1
		mov edi, ln4
		mov eax, 1
		call printf
		mov eax, 0
		leave 
		ret
