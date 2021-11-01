#faktorijel 64bit
.section .data
a: .long 17
rez: .quad 1
.section .text
.globl main
main:
movl a, %ebx
subl $1, %ebx
movl %ebx, %ecx
movl $0, %eax
movl $0, %edx
movl a, %esi
movl $0, %edi

uporedi:
cmpl $0, %ebx
je newn
ja next
newn:
subl $1, %ecx
cmpl $0, %ecx
je kraj
movl %ecx, %ebx
movl %eax, %esi
movl %edx, %edi
movl $0, %eax
movl $0, %edx
jmp uporedi
next:
addl %esi, %eax
adcl %edi, %edx
subl $1, %ebx
jmp uporedi

kraj:
movl %eax, rez
movl %edx, rez+4
movl $1, %eax
movl $0, %ebx
int $0x80