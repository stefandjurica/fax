#potprogram za konverziju iz int u octalni string
.section .text
.globl convert_oct
convert_oct:
    pushl %ebp
    movl %esp, %ebp
    pushl $8    #baza
    pushl %edi
    pushl %esi
    movl 8(%ebp), %eax
    movl 12(%ebp), %esi
    movl $0, %ecx   #brojac duzine
cnvrt:
    divb -4(%ebp)
    addb $48, %ah
    movb %ah, (%esi)
    movb $0, %ah
    incl %esi
    incl %ecx
    testl %eax, %eax
    jnz cnvrt
    movb $10, (%esi)
    movb $0, 1(%esi)
    decl %esi
    movl 12(%ebp), %edi
swap:
    cmpl %edi, %esi
    jle end
    movb (%edi), %al
    movb (%esi), %ah
    movb %ah, (%edi)
    movb %al, (%esi)
    decl %esi
    incl %edi
    jmp swap
end:
    movl %ecx, %eax
    addl $2, %eax
    popl %esi
    popl %edi
    movl %ebp, %esp
    popl %ebp
    ret    
