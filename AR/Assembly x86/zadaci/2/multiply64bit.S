#program mnozenje preko sabiranja u dvostrukoj preciznosti
.section .data
a: .quad 0x23ffffffe5
b: .long 3
greska: .byte 0
.section .text

.globl main
main:
movl a, %eax
movl a+4, %edx
movl b, %ebx
uporedi:
cmpl $0, %ebx
je kraj
ja next

next:
addl a, %eax
adcl a+4, %edx
subl $1, %ebx
jnc uporedi
incb greska



kraj:
movl $1, %eax
movl $0, %ebx
int $0x80