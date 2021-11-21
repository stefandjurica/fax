#program <postavljanje pariteta>
#autor SV25/2021 Cvijetic Danilo 20/11/21
.section .text
.globl SetParity
SetParity:
    pushl %ebp
    movl %esp, %ebp
    movl 8(%ebp), %edx
    movw (%edx), %cx              #kopija ulaza
    movl $0, %eax               #bit parnosti
    movw $1, %dx               #maska
    andw $0x7fff, %cx           #postavljanje bita parnosti na nula zbog brojanja
    jmp for
set1:
    movl $1, %eax
    jmp next
set0:
    movl $0, %eax
next:
    shrw $1, %cx             #pomjeranje udesno

for:
    testw $0xffff, %cx     #provjera da li smo stigli do kraja
    jz kraj
    testw %cx, %dx         #provjera poslednjeg bita 
    jz next
    cmpl $0, %eax           #promjena bita parnosti sa 1 na 0 ili obrnutno
    je set1
    jmp set0

kraj:
    cmpl $1, %eax
    je first1
    jmp first0
first1:                          #postavljanje prvog bita broja na 1
    movl 8(%ebp), %ecx
    orw $0x8000, (%ecx)
    jmp end
first0:                           #postavljanje prvog bita broja na 0
    movl 8(%ebp), %ecx
    andw $0x7fff, (%ecx)
end:
    movl %ebp, %esp
    popl %ebp
    ret