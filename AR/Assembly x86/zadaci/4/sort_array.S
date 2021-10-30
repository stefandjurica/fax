#program sortiranje niza znakova po abecedi
#autor SV25/21 Danilo Cvijetic

.section .data
niz: .ascii "jasezovemdanilo\0"
broj_el: .long 15
.section .text
.globl main
main:
movl $-1, %esi
movl $0, %edi

for:
movl $0, %edi
incl %esi
movl broj_el, %eax
subl %esi, %eax
cmpl %esi, broj_el
jg for2
je kraj
for2:
incl %edi
cmpl %edi, %eax
jg compare
je for
compare:
movl $niz, %edx
addl %edi, %edx
movb (%edx), %cl
movb -1(%edx), %dl
cmpb %cl, %dl
jg swap
jmp for2
swap:
movb %dl, niz(,%edi,1)
decl %edi
movb %cl, niz(,%edi,1)
incl %edi
jmp for2

kraj:
movl $1, %eax
movl $0, %ebx
int $0x80