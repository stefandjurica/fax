#program <sabiranje dva niza u dvostrukoj preciznosti>
#autor SV25/2021 Cvijetic Danilo 30/10/21
.section .data
arr1: .quad 12,42323,44321,95323233232323233,223,54
arr2: .quad 555454,66443,32,553,900000000000,223
NUM_EL = 12
.section .text
.globl main
main:
movl $arr1, %esi
movl $arr2, %edi
movl $NUM_EL, %ebx
decl %ebx
for:
movl (%esi,%ebx,4), %eax
addl (%edi,%ebx,4), %eax
movl %eax, (%esi,%ebx,4)
decl %ebx
movl (%esi,%ebx, 4), %edx
adcl (%edi,%ebx,4), %edx
movl %edx, (%esi,%ebx,4)
decl %ebx
cmpl $-1, %ebx
je kraj
jne for

kraj:
movl $1, %eax
movl $0, %ebx
int $0x80