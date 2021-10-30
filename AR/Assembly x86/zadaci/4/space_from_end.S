.section .data
text: .ascii "abcd    \0"

.section .text
.globl main
main:
movl $text, %eax

to_end:
cmpb $0, (%eax)
je space
incl %eax
jmp to_end
space:
cmpb $' ', -1(%eax)
jne kick
decl %eax
jmp space
kick:
movb $0, (%eax)
kraj:
movl $1, %eax
movl $0, %ebx
int $0x80
