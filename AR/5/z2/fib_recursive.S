#program <potprogram rekurzivni fibonacci>
#autor SV25/2021 Cvijetic Danilo 13/11/21
#unsigned int fibonaci(int n, int *g);
.section .text
.globl fibonaci
fibonaci:
    pushl %ebp
    movl %esp, %ebp
    movl 8(%ebp), %eax
    cmpl $2, %eax
    jle one
    cmpl $0, %eax
    jl greska
                                    #fib(n-1)
    decl %eax
   # movl $0, 12(%ebp)
    pushl 12(%ebp)          #lokacija za gresku se konstantno salje na stack da bi se u bilo kojem delu programa mogla postaviti na 1
    pushl %eax
    call fibonaci
    addl $8, %esp
    pushl %eax
    cmpl $1, 12(%ebp)
    je kraj
                                    #fib(n-2)
    movl 8(%ebp), %eax
    subl $2, %eax
    #movl $0, 12(%ebp)
    pushl 12(%ebp)
    pushl %eax
    call fibonaci
    addl $8, %esp
    cmpl $1, 12(%ebp)
    je kraj
    popl %ecx
    addl %ecx, %eax
    jnc kraj
    jmp greska
one:
    movl $1, %eax
    jmp kraj
greska:
    movl $1, 12(%ebp)
kraj:
    movl %ebp, %esp
    popl %ebp
    ret

