#program <potprogram T34 sabiranje dva niza >
#autor SV25/2021 Cvijetic Danilo 08/12/21
#int SaberiMnozi(int n, unsigned short *a, unsigned short *b, unsigned short *resenje);
.section .text
.globl SaberiMnozi
SaberiMnozi:
    pushl %ebp
    movl %esp, %ebp
    pushl $0    #broj gresaka
    pushl %esi
    pushl %edi
    pushl %ebx
    movl 12(%ebp), %esi
    movl 16(%ebp), %edi
    movl 20(%ebp), %ecx
    movl $0, %ebx       #brojac

for:
    cmpl %ebx, 8(%ebp)
    jle next
    movw (%esi,%ebx,2), %ax
    mulw (%edi,%ebx,2)
    jc greska1
    movw %ax, (%ecx, %ebx,2)
    addl $2, %ebx
    jmp for
next:
    movl $1, %ebx
for2:
    cmpl %ebx, 8(%ebp)
    jle end
    movw (%esi, %ebx,2), %ax
    movw %ax, (%ecx,%ebx,2)
    movw (%edi, %ebx,2), %ax
    addw %ax,(%ecx,%ebx,2)
    jc greska2
    addl $2, %ebx
    jmp for2
greska1:
    movw $11111, (%ecx,%ebx,2)
    addl $2, %ebx
    incl -4(%ebp)
    jmp for
greska2:
    movw $11111, (%ecx,%ebx,2)
    addl $2, %ebx
    incl -4(%ebp)
    jmp for2
end:
    movl -4(%ebp),%eax
    popl %ebx
    popl %edi
    popl %esi
    movl %ebp, %esp
    popl %ebp
    ret
