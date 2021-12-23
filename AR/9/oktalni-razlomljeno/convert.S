#program <pretvaranje oktalnog razlomljenog stringa u int>
#autor SV25/2021 Cvijetic Danilo 08/12/21
#unsigned int oct_str_float_to_inter(char* str, unsigned int* greska);
.section .text
.globl oct_str_float_to_inter 
oct_str_float_to_inter:
    pushl %ebp
    movl %esp, %ebp
    pushl $100000000        #skaliranje izlaza 10^8
    pushl $8                #baza broja
    pushl $0                #pocetak broja
    pushl %esi              
    movl 8(%ebp), %esi     #pokazivac na ulazni string
    xorl %ecx, %ecx         #rezlutat
check:
    cmpb $'0', (%esi)
    jne greska1
    cmpb $'.', 1(%esi)
    jne greska1
    incl %esi
    movl %esi, -12(%ebp)
    incl -12(%ebp)

to_end:
    cmpl $0, (%esi)
    je for
    incl %esi
    jmp to_end
for:
    decl %esi
    xorl %eax, %eax
    movb (%esi), %al
    cmpl %esi, -12(%ebp)
    je end
    cmpb $55, %al
    jg greska1
    cmpb $49, %al
    jl greska1
    subb $'0', %al
    mull -4(%ebp)
    addl %ecx, %eax
    divl -8(%ebp)
    movl %eax, %ecx         #rezultat u %edx
    jmp for
greska1:
    movl 12(%ebp), %edx
    movl $1, (%edx)
    jmp kraj
end:
    movl %ecx, %eax
    movl 12(%ebp), %edx
    movl $0, (%edx)

kraj:
    popl %esi
    movl %ebp, %esp
    popl %ebp
    ret

