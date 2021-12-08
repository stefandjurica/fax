#program <shiftovanje dvostruke preciznosti>
#autor SV25/2021 Cvijetic Danilo 09/12/21
#void shiftujDvostruko(unsigned long long *a, unsigned int *b, unsigned n);
.section .text
.globl shiftujDvostruko
shiftujDvostruko:
    pushl %ebp
    movl %esp, %ebp
    pushl %esi
    pushl %edi
    pushl %ebx
    movl 8(%ebp), %esi
    movl 12(%ebp), %edi
    movl $0, %ebx
shft:
    cmpl %ebx, 16(%ebp)
    jle next
    movl (%esi), %eax
    movl (%edi,%ebx,4), %ecx
    shrl %ecx
    mo

kraj:
movl $1, %eax
movl $0, %ebx
int $0x80