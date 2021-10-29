#program suma podintervala
.section .data
granica = 5
niz: .long 1,2,3,4,5,6,7,8,9,10
suma: .long 0
.section .text
.globl main
main:
movl $2, %esi
movl $0, %eax
for:
addl niz(,%esi,4), %eax
incl %esi
cmpl $granica, %esi
jb for
kraj:
movl %eax, suma
movl $1, %eax
movl $0, %ebx
int $0x80