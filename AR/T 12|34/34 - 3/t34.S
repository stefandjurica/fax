#program <shiftovanje dvostruke preciznosti>
#autor SV25/2021 Cvijetic Danilo 09/12/21
#void shiftujDvostruko(unsigned long long *a, unsigned char *b, unsigned n);
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
    jle end
    movb (%edi,%ebx,4), %cl
   # subb $'0', %cl 
    testl $1, %ebx
    jnz shiftujr
    jz shiftujl
shiftujr:
    shrl $1, 4(%esi,%ebx,4)
    rcrl $1, (%esi,%ebx,4)
    decb %cl
    cmpb $0, %cl
    je next
    jmp shiftujr
shiftujl:
    shll $1, (%esi,%ebx,4)
    rcll $1, 4(%esi,%ebx,4)
    decb %cl
    cmpb $0, %cl
    je next
    jmp shiftujl
next:
    incl %ebx
    jmp shft
end:
    popl %ebx
    popl %edi
    popl %esi
    movl %ebp, %esp
    popl %ebp
    ret
