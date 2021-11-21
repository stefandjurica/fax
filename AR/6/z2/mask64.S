#program <maska64>
#autor SV25/2021 Cvijetic Danilo 20/11/21
.section .text
.globl maska64
maska64:
    pushl %ebp
    movl %esp, %ebp
    pushl %ebx
    movl 8(%ebp), %ecx
    movl 12(%ebp), %ebx
        cmpl $1, %ebx
        jg greska
        cmpl $0, %ebx
        jl greska
        cmpl $0, %ecx
        jl greska
        cmpl $63, %ecx
        jg greska
    movl $0, %eax
    movl $0, %edx
shiftlower:
    movl $1, %eax
    shll %ecx, %eax
    jmp check
shifthigher:
    movl $1, %edx
    subl $31, %ecx
    shll %ecx, %edx

check:
    cmpl $0, %ebx
    je invert
    jmp kraj

invert:
    notl %eax
    notl %edx
    jmp kraj
greska:
    movl $0, %eax
    movl $0, %edx
kraj:
    popl %ebx
    movl %ebp, %esp
    popl %ebp
    ret
