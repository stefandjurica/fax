#program uklanjanje razmaka sa pocetka i kraja stringa
#autor SV25/2021 Cvijetic Danilo
.section .data
text: .ascii "    abcd    \0"
spaces: .byte 0
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
jmp front
front:
movl $text, %eax
check:
cmpb $' ', (%eax)
je spacefr
jne next
spacefr:
incb spaces
incl %eax
jmp check
move:
movb (%eax), %cl
movl %eax, %ebx
subl spaces, %ebx
movb %cl, (%ebx)
incl %eax
jmp next
next:
cmpb $0, (%eax)
jne move
je movenull
movenull:
movb (%eax), %cl
movl %eax, %ebx
subl spaces, %ebx
movb %cl, (%ebx)
jmp kraj
jmp next
kraj:
movl $1, %eax
movl $0, %ebx
int $0x80
