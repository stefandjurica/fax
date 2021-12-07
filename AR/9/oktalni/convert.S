#program <pretvaranje oktalnog stringa u int>
#autor SV25/2021 Cvijetic Danilo 07/12/21
#unsigned int oct_str_to_inter(char* str, unsigned int* greska);
.section .text
.globl oct_str_to_inter
oct_str_to_inter:
    pushl %ebp
    movl %esp, %ebp
    pushl $8                #baza broja
    pushl %esi
    pushl %ebx
    movl 8(%ebp), %esi
    xorl %eax, %eax         #rezultat
    xorl %ebx, %ebx
for:    
    movb (%esi), %bl
    cmpb $0, (%esi)
    je check
    cmpb $55, %bl
    jg greska
    cmpb $48, %bl
    jl greska
    subb $'0', %bl
    mull -4(%ebp)
    jc greska2
    addl %ebx, %eax
    jc greska2
    incl %esi
    jmp for
check:
    cmpl %esi, 8(%ebp)   #ako nije vrsena iteracija -> string prazan
    je greska
    jmp kraj
greska:
    movl 12(%ebp), %ebx
    movl $1, (%ebx)
    jmp end
greska2:
    movl 12(%ebp), %ebx
    movl $2, (%ebx)
    jmp end
kraj:
    movl 12(%ebp), %ebx
    movl $0, (%ebx)
end:
    popl %ebx
    popl %esi
    movl %ebp, %esp
    popl %ebp
    ret

