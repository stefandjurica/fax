#potprogram od t12
#autor Cvijetic Danilo SV25/2021
#void potprogram(unsigned char *s1, unsigned char *s2, char *r);
.section .text
.globl potprogram
potprogram:
    pushl %ebp
    movl %esp, %ebp
    pushl %esi
    pushl %edi
    movl 8(%ebp), %esi
    movl 12(%ebp), %edi
    xorl %ecx, %ecx
    xorl %edx, %edx
    decl %esi
    decl %edi
count:
    incl %esi
    cmpb $0, (%esi)
    je count2
    cmpb $'+',(%esi)
    jne count
    incl %ecx 
    jmp count
count2:
    incl %edi
    cmpb $0, (%edi)
    je compare
    cmpb $'-', (%edi)
    jne count2
    incl %edx
    jmp count2
compare:
    cmpl %ecx, %edx
    jl set1
    jg set2
    movl 16(%ebp), %eax
    movl $3, (%eax)
    jmp kraj
set1:
    movl 16(%ebp), %eax
    movl $1, (%eax)
    jmp kraj
set2:
    movl 16(%ebp), %eax
    movl $2, (%eax)
kraj:
    popl %edi
    popl %esi
    movl %ebp, %esp
    popl %ebp
    ret

