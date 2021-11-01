#program suma podintervala
.section .data
NELEM = 10
niz: .long 1,-2,5,-20,23,70,-8,92,-10
min: .long 0
max: .long 0
.section .text
.globl main
main:
movl $0, %esi
movl niz(,%esi,4), %eax   #min
movl niz(,%esi,4), %ebx   #max
manji:
movl niz(,%esi,4),%eax
incl %esi
jmp for
veci:
movl niz(,%esi,4), %ebx
incl %esi
jmp for
for:
cmpl niz(,%esi,4), %eax
jl manji
cmpl niz(,%esi,4), %ebx
jg veci
incl %esi
cmpl $NELEM, %esi
jb for

kraj:
movl %eax, min
movl %ebx, max
movl $1, %eax
movl $0, %ebx
int $0x80