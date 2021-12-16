#funkcija za konverziju iz dec i hex stringa u int
.section .text
.globl convert_func
convert_func:
    pushl %ebp
    movl %esp, %ebp
    pushl $10       #baza za konverziju decimalnih
    pushl $16       #baza za konverziju hex
    pushl %esi
    pushl %ebx
    movl 8(%ebp), %esi  
    movl $0, %eax       #rezultat 
    cmpb $'0', (%esi)
    je checkifhex
    jne cnvrtdec
checkifhex:
    cmpb $'x', 1(%esi)
    je cnvrthexi
    cmpb $'X', 1(%esi)
    jne cnvrtdec
    jmp cnvrthexi
cnvrtdec:
    xorl %ebx, %ebx
    movb (%esi), %bl
    cmpb $0, %bl
    je end           
    cmpb $48, %bl
    jb error
    cmpb $57, %bl
    ja error
    subb $48, %bl
    mull -4(%ebp)
    addb %bl, %al
    jc error
    incl %esi
    jmp cnvrtdec
cnvrthexi:
    addl $2, %esi       #postavlja se iza 0x
cnvrthex:
    cmpb $0, (%esi)
    je end
    cmpb $'0', (%esi)
    jb error
    cmpb $58, (%esi)
    jb cnvrthex09
    cmpb $'f', (%esi)
    ja error
    cmpb $96, (%esi)
    ja cnvrthexlow
    cmpb $'G', (%esi)
    ja error
    cmpb $64, (%esi)
    ja cnvrthexup
    jmp error
cnvrthex09:
    movb (%esi), %bl
    subb $'0', %bl
    mull -8(%ebp)
    addb %bl, %al
    jc error
    incl %esi
    jmp cnvrthex
cnvrthexlow:
    movb (%esi), %bl
    subb $87, %bl
    mull -8(%ebp)
    addb %bl, %al
    jc error
    incl %esi
    jmp cnvrthex
cnvrthexup:
    movb (%esi), %bl
    subb $55, %bl
    mull -8(%ebp)
    addb %bl, %al
    jc error
    incl %esi
    jmp cnvrthex
error:
    movl $266, %eax
end:
    popl %ebx
    popl %esi
    movl %ebp, %esp
    popl %ebp
    ret

