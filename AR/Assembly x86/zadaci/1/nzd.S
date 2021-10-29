#program nzd
.section .data
a: .long 10
b: .long 2
.section .text
.globl main
main:
uporedi: 
cmpl a, b
je kraj
ja vece
subl $b, $a
jmp uporedi
vece:
subl $a, $b
jmp uporedi



end:
    movl $1, %eax
    movl $0, %ebx
    int $0x80