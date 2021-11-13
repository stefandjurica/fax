#program <sabiranje dva niza u treci>
#int saberi_niz(long long *a, long long *b, long long *c, int n);
#autor SV25/2021 Cvijetic Danilo 13/11/21
.section .text
.globl saberi_niz
saberi_niz:
    pushl %ebp
    movl %esp, %ebp
    pushl %esi          #cuvamo registre
    pushl %ebx          # esi i ebx
    movl 20(%ebp), %esi #brojac --- n iz ulaza

    movl 8(%ebp), %eax
    movl 12(%ebp), %ebx
    movl 16(%ebp), %ecx
    movl $0, %edx
for:
    cmpl $0, %esi
    je end
    movl (%eax), %edx              #sabiranje nizih dijelova
    movl %edx, (%ecx)
    movl (%ebx), %edx
    addl %edx, (%ecx)

    movl 4(%eax), %edx              #sabiranje visih dijelova
    movl %edx, 4(%ecx)
    movl 4(%ebx), %edx
    adcl %edx, 4(%ecx)
    jo greska

    addl $8, %eax           #pomjeramo se na sledece elemente nizova
    addl $8, %ebx
    addl $8, %ecx

    decl %esi               #smanjuje se brojac
    jmp for
end:
    movl $0, %eax
    jmp kraj
greska:
    movl $1, %eax
kraj:
    popl %ebx
    popl %esi
    movl %ebp, %esp
    popl %ebp
    ret