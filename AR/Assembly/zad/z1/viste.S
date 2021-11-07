#program unos stringa i pretvaranje u velika slova
#autor SV25/2021 Danilo Cvijetic
.section .data
poruka1: .ascii "Unesite ime i prezime: \0"
poruka2: .ascii "Vi ste: \0"
imeprez: .fill 50,1,42
str_len = 23
in_len = 50
.section .text
.globl main
main:
movl $4, %eax                #ispis prve poruke
movl $1, %ebx
movl $poruka1, %ecx
movl $str_len, %edx
int $0x80
movl $3, %eax               #sistemski poziv za unos
movl $1, %ebx
movl $imeprez, %ecx
movl $in_len, %edx
int $0x80
movl %eax, %edi

convert:
movl $imeprez, %esi
decl %esi
for:
incl %esi
cmpb $0, (%esi)           #iteracija preko karaktera i upcase malih slova
je output
cmpb $90, (%esi) 
jg upcase
jmp for
upcase:
subb $32, (%esi)     
jmp convert


output:
movl $4, %eax               #ispis druge poruke
movl $1, %ebx
movl $poruka2, %ecx
movl $8, %edx
int $0x80
output2:
movl $4, %eax
movl $1, %ebx                #ispis rezultata
movl $imeprez, %ecx
movl %edi, %edx
int $0x80


kraj:
movl $1, %eax
movl $0, %ebx
int $0x80

