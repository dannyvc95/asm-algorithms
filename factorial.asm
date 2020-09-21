section .data
	mensaje: db "El factorial de 3 = "
	longitud: equ $-mensaje
	
section .bss
	resultado: resb 1
	
section .text
	global _start
	_start:
		mov bx, 3
		
		call factorial
		add ax, 0x30
		mov [resultado], ax
		
		mov eax, 4
		mov ebx, 1
		mov ecx, mensaje
		mov edx, longitud
		int 0x80
		
		mov eax, 4
		mov ebx, 1
		mov ecx, resultado
		mov edx, 1
		int 0x80
		
		mov eax, 1
		int 0x80
		
		factorial:
			cmp bl, 1
			jg calcular
			mov ax, 1
			ret
			
		calcular:
			dec bl
			call factorial
			inc bl
			mul bl
			ret
