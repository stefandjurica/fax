#program N-ti element fibonacijevog niza 
.section .data
.section .text
.globl main
main:
movl $8, %eax
movl $0, %ebx
movl $1, %ecx
movl $1, %edx
movl $2, %esi
jmp check
check:
cmpl $1, %eax
je one_two
cmpl $2, %eax
je one_two
jmp checkk
one_two:
movl $1, %ebx
jmp end
checkk:
cmpl %esi, %eax
je end
ja next
next:
movl %ecx, %ebx
addl %edx, %ecx
movl %ebx, %edx
movl %ecx, %ebx
incl %esi
jmp checkk
end:
    movl $1, %eax
    movl $0, %ebx
    int $0x80