%macro sys_write 3
    mov eax,1
    mov rdi, %1
    mov rsi, %2
    mov rdx, %3
    syscall
%endmacro

section .data
    Stmsg: db "Sucesion de numeros de Fibonacci",10
    StmsgLen equ $-Stmsg
    Edmsg: db "...",10
    EdmsgLen equ $-Edmsg
    a: dq 1
    b: dq 1
    table db '0123456789'

section .bss
    output resb 256

section .text
_qw2a:
    lea r10 , [rsp-1]
    xor rcx,rcx
    mov r8,10
_L0:
    xor rdx,rdx
    div r8
    mov r9b,[table+rdx]
    mov [r10],r9b
    dec r10
    inc rcx
    test rax,rax
    jnz _L0

    lea rsi,[r10+1]
    cld
_L1:
    movsb
    cmp rsi,rsp
    jne _L1
    ret

global _start
_start:
    nop
    sys_write 1,Stmsg,StmsgLen

    xor r11,r11
    xor r12,r12
    mov r11,[a]
    mov r12,[b]
    xor r13,r13

Fibo:
    add r11,r12
    push r11
    push r12
    mov rax, r11
    mov rdi, output
    call _qw2a
    mov byte[rcx+output],0xa
    inc rcx
    sys_write 1,output,rcx
    pop r12
    pop r11
    add r12,r11
    push r11
    push r12
    mov rax,r12
    mov rdi, output
    call _qw2a
    mov byte[rcx+output],0xa
    inc rcx
    sys_write 1,output,rcx
    pop r12
    pop r11

    inc r13
    cmp r13,45
    jna Fibo

    sys_write 1,Edmsg,EdmsgLen
Done:
    mov rax,60
    mov rdi,0
    syscall
