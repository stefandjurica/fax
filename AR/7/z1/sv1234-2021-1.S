#autor: Danilo Cvijetic  SV25/2021 
.section .data
prompt_1: .ascii "Unesite string: \0"
prompt_1_len = . - prompt_1
prompt_2: .ascii "Enkodovan string: \0"
prompt_2_len = . - prompt_2
string: .fill 50,1,0
string_len: .long 0

.section .text
.globl main
main:
    movl $4, %eax                   #ispis poruke
    movl $1, %ebx
    movl $prompt_1, %ecx
    movl $prompt_1_len, %edx
    int $0x80

    movl $3, %eax                   #unos stringa
    movl $0, %ebx
    movl $string, %ecx
    movl $50, %edx
    int $0x80
    movl %eax, %esi
    movl %esi, %edi
    decl %esi
for:                                        # velika slova >65 <91
    decl %esi                                       # mala slova >96   <123
    cmpl $-1, %esi
    je ispis
    jmp check

    
check:
    cmpb $65, string(,%esi,1)
    jl for
    cmpb $91, string(,%esi,1)
    jl replaceu
    cmpb $122, string(,%esi, 1)
    jg for
    cmpb $96, string(,%esi, 1)
    jg replacel
    jmp for
replaceu:
    cmpb $68, string(,%esi,1)
    jl repl
    subb $3, string(,%esi,1)
    jmp for
replacel:
    cmpb $100, string(,%esi,1)
    jl repl
    subb $3, string(,%esi,1)
    jmp for
repl:
    addb $23, string(,%esi,1)
    jmp for
ispis:
    movl $4, %eax                   #ispis poruke
    movl $1, %ebx
    movl $prompt_2, %ecx
    movl $prompt_2_len, %edx
    int $0x80

    movl $4, %eax                   #ispis poruke
    movl $1, %ebx
    movl $string, %ecx
    movl %edi, %edx
    int $0x80
kraj:
    movl $1, %eax
    movl $0, %ebx
    int $0x80


