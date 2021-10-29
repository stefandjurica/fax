#program nzd
.section .data
a: .long, 10,20
.section .text
.globl main
main:



end:
    movl $1, %eax
    movl $0, %ebx
    int $0x80