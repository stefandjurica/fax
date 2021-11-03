.section .data
poruka: .ascii "Unesite string:\0"
poruka_len = . - poruka
nijep:  .ascii "String nije palindrom.\n\0"
nijep_len = . - nijep
jestep: .ascii "String je palindrom.\n\0"
jestep_len = . - jestep
unos:   .fill 50,1,42

.section .text
.globl main
main:
movl $4, %eax
movl $1, %ebx
movl $poruka, %ecx
movl $poruka_len, %edx
int $0x80
movl $3, %eax
movl $1, %ebx
movl $unos, %ecx
movl $50, %edx
int $0x80
movl %eax, %edi
movl $unos, %esi
decl %esi
addl $unos, %edi
incl %edi
for:
incl %esi
decl %edi
cmpl %esi, %edi
jl jesu
je jesu


movb (%esi), %ah
movb (%edi), %bl
cmpb %ah, %bl
jne nisu
je for
jesu:
movl $4, %eax
movl $1, %ebx
movl $jestep, %ecx
movl $jestep_len, %edx
int $0x80
nisu:
movl $4, %eax
movl $1, %ebx
movl $nijep, %ecx
movl $nijep_len, %edx
int $0x80


kraj:
movl $1, %eax
movl $0, %ebx
int $0x80

