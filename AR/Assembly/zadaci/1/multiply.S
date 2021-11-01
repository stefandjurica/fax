#program mnozenje
.section .data
.section .text
.globl main
main:
movl $4, %eax
movl $3, %ebx
movl $1, %esi
movl %eax, %ecx
jmp run
run:
cmpl %esi, %ebx
je end
ja multi
multi:

addl %ecx, %eax
incl %esi
jmp run



end:
    movl $1, %eax
    movl $0, %ebx
    int $0x80