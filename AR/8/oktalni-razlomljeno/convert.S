#program <potprogram konverzije razlomljenih decimalnih brojeva u oktalne>
#unsigned int inter_to_oct_str_float(unsigned int broj, char* str, unsigned int duzina);
#autor SV25/2021 Cvijetic Danilo 06/12/21
.section .text
.globl inter_to_oct_str_float
inter_to_oct_str_float:
    pushl %ebp
    movl %esp, %ebp
    pushl $100000000   # skaliranje
    pushl %esi
    pushl %edi
    pushl %ebx

    movl 8(%ebp), %eax              #uneseni broj skaliran sa 10^8
    movl 12(%ebp), %esi             #pokazivac na niz charova
    movl 16(%ebp), %ecx 
    cmpl $4, %ecx
    jl greska                          #duzina bafera
    movl $'0', (%esi)
    incl %esi
    movl $'.', (%esi)
    incl %esi
    movl $8, %ebx     #baza broja
    subl $3, %ecx

for:
    cmpl $0, %ecx
    je end
    mull %ebx
    divl -4(%ebp)
    addl $'0', %eax
    movb %al, (%esi)
    decl %ecx
    incl %esi
    movl %edx, %eax
    cmpl $0, %eax
    jne for
end:
    movb $0, (%esi)      #buffer overflow ako stavimo \n na kraj
    movl $0, %eax
    jmp kraj
greska:
    movl $1, %eax
kraj:
    popl %ebx
    popl %edi
    popl %esi
    movl %ebp, %esp
    popl %ebp
    ret
    
    

    
