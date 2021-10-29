#dijeljenje u dvostrukoj preciznosti preko oduzimanja
.section .data
a: .quad 25000000000000
b: .long 4302000
greska: .byte 0
.section .text
.globl main
main:
movl a, %eax
movl a+4, %edx
movl $0, %ebx
jmp uporedi
uporedi:
cmpl b+4, %edx
je cmplow
ja next
jb kraj
cmplow:
cmpl b, %eax
je next
jb kraj
ja next
next:
subl b, %eax
sbbl b+4, %edx
incl %ebx
jmp uporedi


kraj:
movl $1, %eax
movl $0, %ebx
int $0x80