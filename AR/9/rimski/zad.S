#autor Cvijetic Danilo SV25/2021
#potprogram pretvaranje rimskog broja iz stringa u integer
#unsigned int roman_to_inter(char* str, unsigned int* greska);
.section .text
.globl roman_to_inter
dec:    .long 1000, 500, 100, 50, 10, 5, 1, 0
rom:   .ascii "MDCLXVI\0"

roman_to_inter:
    pushl %ebp
    movl %esp, %ebp
    pushl $-1           #prva cifra
    pushl $0       #broj karaktera
    pushl %esi
    pushl %edi
    movl 8(%ebp), %esi
    xorl %eax,%eax      #rezultat
    decl %esi
count:
    incl %esi
    cmpb $0, (%esi)
    jne count
    movl %esi, -8(%ebp)
    movl 8(%ebp), %esi


for:
    cmpl %esi, -8(%ebp)
    jle end
    movb (%esi), %dl
    cmpb $0, %dl
    je end
    movb 1(%esi), %cl
    movl $-1, %edi
findf:
    incl %edi
    cmpl $7, %edi
    jg greska1
    cmpb %dl, rom(,%edi,1)
    jne findf
    movl %edi, -4(%ebp)
    movl $-1, %edi
finds:
    incl %edi    
    cmpl $7, %edi
    jg greska1
    cmpb %cl, rom(,%edi,1)
    jne finds
check:
    movl dec(,%edi,4), %ecx     #naredna
    movl -4(%ebp), %edi
    movl dec(,%edi,4), %edx     #tekuca
    cmpl %ecx, %edx
    jl two
    jge one
one:    
    addl %edx, %eax
    incl %esi
    jmp for
two:
    subl %edx, %ecx
    addl %ecx, %eax
    addl $2, %esi
    jmp for
end:
    movl 12(%ebp),%ecx
    movl $0, (%ecx)
    jmp kraj
greska1:
    movl 12(%ebp),%ecx
    movl $1, (%ecx)
kraj: 
    popl %edi
    popl %esi
    movl %ebp, %esp
    popl %ebp
    ret
    

