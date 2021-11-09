#program <potprogram n-ti element fibonacijevog niza>
#autor SV25/2021 Cvijetic Danilo 09/11/21
.section .text
.globl fibonaci
fibonaci:
pushl %ebp
movl %esp, %ebp
pushl %ebx              #privremeni rezultat
movl 8(%ebp), %eax
movl $0, %ecx
movl $1, %edx
cmpl $0, %eax
jle greska

for:
cmpl $1, %eax
je kraj
addl %edx, %ecx
jc greska
xchgl %ecx, %edx
movl %edx, %ebx
decl %eax
jmp for

kraj:
movl 12(%ebp), %edx
movl %ebx, (%edx)
movl $0, %eax
popl %ebx
movl %ebp, %esp
popl %ebp
ret

greska:
movl $1, %eax
popl %ebx
movl %ebp, %esp
popl %ebp
ret
