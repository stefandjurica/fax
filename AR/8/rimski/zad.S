#autor Cvijetic Danilo SV25/2021
#program za konverziju iz int u rimske brojeve
#int inter_to_roman(unsigned int broj, char *str, int duzina);

.section .text
.globl inter_to_roman
dec:    .long 1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1
rom1:   .ascii "MCDCCXLXXIVII"
rom2:   .ascii " M D C L X V "

inter_to_roman:
    pushl %ebp
    movl %esp, %ebp
    pushl %esi
    pushl %edi
    movl 8(%ebp), %eax              #uneseni int
    movl 12(%ebp), %esi             #pokazivac na char[30]
    movl 16(%ebp), %ecx             #duzina bafera
    movl $-1, %edi                  #iterator
    decl %ecx               #rezervise se jedno mjesto za \n
for:
    incl %edi                       
    cmpl $13, %edi
    jne for2
    jmp end
for2:
    cmpl %eax, dec(, %edi, 4)      
    jg for
    movb rom1(,%edi,1), %dl
    movb %dl, (%esi)
    decl %ecx                           #smanjuje se velicina preostalog buffera
    incl %esi                           #inc pokazivaca na niz
    subl dec(,%edi,4), %eax
    movb rom2(,%edi,1), %dh
    cmpb $' ', rom2(,%edi,1)            #provjera da li rimski broj ima zapis u dva char-a
    je for2
    movb rom2(,%edi,1), %dl
    movb %dl, (%esi)
    decl %ecx                       
    cmpl $-1, %ecx
    je greska
    incl %esi
    jmp for2
end:
    movl $0, %eax
    movb $0, (%esi)                     #dodajemo \n na kraj
    jmp kraj

greska:
    movl $1, %eax
kraj:
    popl %edi
    popl %esi
    movl %ebp, %esp
    popl %ebp
    ret
