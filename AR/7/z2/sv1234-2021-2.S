#autor: Cvijetic Danilo SV25/2021  
#int encode(char* izvorni, char* ciljni, char* enkodovati);
.section .text
.globl encode
encode:
    pushl %ebp
    movl %esp, %ebp
    pushl %ebx
    pushl %edi
    pushl %esi       #
    movl 16(%ebp), %ecx   
    movl $0, %esi
    movl $0, %eax
search:
    movl $0, %edi 
    movb (%ecx,%esi,1), %dl
    cmpb $0, %dl
    je kraj
    jmp search_izvorni
next:
    incl %esi
    jmp search
search_izvorni:
    movl 8(%ebp), %ebx
    movb (%ebx,%edi,1), %dh
    cmpb $0, %dh
    je next
    cmpb %dl, %dh
    je swap
    incl %edi
    jmp search_izvorni
swap:
    movl 12(%ebp), %ebx
    movb (%ebx, %edi, 1), %dh
    movb %dh, (%ecx,%esi,1)
    incl %eax
    jmp next
kraj:
    popl %esi
    popl %edi
    popl %ebx
    movl %ebp, %esp
    popl %ebp
    ret

