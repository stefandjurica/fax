#program <potprogram rekurzivno izracunavanje n-tog elementa fibonacijevog niza>
#autor SV25/2021 Cvijetic Danilo 10/11/21

.section .text
.globl fibonaci
#int fibonaci(int n)
fibonaci:
    pushl %ebp
    movl %esp, %ebp
    cmpl $2, 8(%ebp)    # f(1) = f(2) = 1
    jbe fib_1

    movl 8(%ebp), %eax  # f(n-1)
    decl %eax
    pushl %eax
    call fibonaci
    addl $4, %esp
    pushl %eax          # izračunata vrednost se čuva na steku

    movl 8(%ebp), %eax  # f(n-2)
    subl $2, %eax
    pushl %eax
    call fibonaci
    addl $4, %esp
    popl %ecx           # sačuvana vrednost za f(n-1)
    addl %ecx, %eax
    jmp fib_kraj
fib_1:
    movl $1,%eax
fib_kraj:
    movl %ebp, %esp
    popl %ebp
    ret

