#program <dijeljnje preko oduzimanja u dvostrukoj preciznosti>
#autor SV25/2021 Cvijetic Danilo 08/12/21
.section .data
a: .quad 4500000000000
b: .quad 25000000001
kolicnik: .quad 0
ostatak: .quad 0
greska: .byte 0
.section .text
.globl main
main:
    movl a, %eax            #nizi dio
    movl a+4, %edx          #visi dio
check_zero:
    cmpl $0, b
    jne for
    cmpl $0, b+4        #ako je nizi dio jednak 0 onda se i veci provjerava
    jne for
    incb greska
for:
    cmpl b+4, %edx
    jg divide
    jl kraj
    cmpl b, %eax   
    jl kraj
divide:
    subl b, %eax
    sbbl b+4, %edx       
    addl $1, kolicnik
    adcl $0, kolicnik+4
    jmp for

kraj:
movl %eax, ostatak
movl %edx, ostatak+4
movl $1, %eax
movl $0, %ebx
int $0x80