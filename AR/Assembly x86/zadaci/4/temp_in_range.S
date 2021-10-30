.section .data
NDAYS = 7
d_gr: .long -1
g_gr: .long 5
prvi_dan: .long 1
zadnji_dan: .long 7
greska: .byte 0
days: .long 2, -1, 6, 3, -3, -7, 10
rezultat: .long 0
granica: .long 0
.section .text
.globl main
main:
movb prvi_dan, %al
movb zadnji_dan, %ah
jmp check
movl days(,%esi,4), %eax
check:
cmpb %al, %ah
jl error
cmpb $1, %al
jl error
cmpb $NDAYS, %ah
jg error
movl prvi_dan, %esi
subl $2, %esi
jmp for
for:
incl %esi
cmpl %esi, zadnji_dan
jg check2
je kraj
check2:
movl days(,%esi,4), %ebx
cmpl %ebx, d_gr
jg for
cmpl %ebx, g_gr
jl for
incl rezultat
jmp for
error:
incb greska
kraj:
movl $1, %eax
movl $0, %ebx
int $0x80