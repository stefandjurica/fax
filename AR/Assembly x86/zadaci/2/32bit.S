#program 32bit variable to 8 bit reg
.section .data
a: .long 0x32ff1516
.section .text
.globl main
main:
movb a, %ah
movb a+1, %al
movb a+2, %bh
movb a+3, %bl
kraj:
movl $1, %eax
movl $0, %ebx
int $0x80