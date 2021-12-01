#potprogram konverzija iz internog u oktalni
#unsigned int inter_to_oct_str(unsigned int broj, char *str, unsigned int duzina);
.section .text
.globl inter_to_oct_str
inter_to_oct_str:
    pushl %ebp
    movl %esp, %ebp
    pushl %ebx
    pushl %esi
    pushl %edi
    movl 8(%ebp), %eax   #broj
    movl 12(%ebp), %esi   #pokazivac na niz
    movl 16(%ebp), %ecx   #duzina
    movl $8, %ebx
    cmpl $2, %ecx
    jl greska
for:
    xorl %edx, %edx
    divl %ebx
    addb $'0', %dl
    movb %dl, (%esi)
    incl %esi
    andl %eax, %eax
    jnz for
    movb $0, (%esi)
    movl %esi, %edi
    subl 12(%ebp), %edi
    cmpl %edi, %ecx
    jle greska
    movl 12(%ebp), %edi
    decl %esi

swap:
    cmpl %edi, %esi
    jle correct
    movb (%esi), %al
    movb (%edi), %ah
    movb %ah, (%esi)
    movb %al, (%edi)
    decl %esi
    incl %edi
    jmp swap
correct:
    movl $0, %eax
    jmp kraj
greska:
    movl $1, %eax
kraj:
    popl %edi
    popl %esi
    popl %ebx
    movl %ebp, %esp
    popl %ebp
    ret