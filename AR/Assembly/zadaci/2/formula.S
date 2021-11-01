#formula a=2*b + c/3
.section .data
a: .quad 0
b: .quad 20
c: .quad 33
.section .text
.globl main
main:
first:
movl b, %eax
movl b+4, %edx
addl b, %eax
adcl b+4, %edx

addl %eax, a
adcl %edx, a+4
jnc second
second:
movl c,%eax
movl c+4, %edx
movl $0, %ebx
jmp uporedi
uporedi:
cmpl $3, %edx
je cmplow
ja next
jb cmplow
cmplow:
cmpl $3, %eax
je next
jb end
ja next
next:
subl $3, %eax
incl %ebx
jmp uporedi
end:
movl a, %eax
movl a+4, %edx
addl %ebx, %eax
adcl $0, %edx
jmp kraj
kraj:
movl $1, %eax
movl $0, %ebx
int $0x80