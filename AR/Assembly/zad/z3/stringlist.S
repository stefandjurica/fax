#program <unos 10 stringova i obrnuti ispis>
#autor SV25/2021 Cvijetic Danilo
.section .data
str_unos:   .ascii "Unesite string:\0"
str_unos_len = . - str_unos
str_ispis:  .ascii "\nObrnuti redosled:\n\0"
str_ispis_len = . - str_ispis
str_len = 21
str_num = 10
strings: .fill str_len*10,1,0
.section .text
.globl main
main:
movl $1, %esi                   #brojac
movl $strings, %edi             #adresa prvog elementa 
for_in:
cmpl $11, %esi
je poruka2

movl $4, %eax                   #ispis poruke
movl $1, %ebx
movl $str_unos, %ecx
movl $str_unos_len, %edx
int $0x80

movl $3, %eax
movl $1, %ebx               #unos i-tog elementa
movl %edi, %ecx
movl $str_len,%edx
int $0x80
incl %esi
addl $str_len, %edi         #prebacivanje na adresu sledeceg elementa
jmp for_in              
poruka2:                    #poruka2, obrnuti redosled
movl $4, %eax
movl $1, %ebx
movl $str_ispis, %ecx
movl $str_ispis_len, %edx
int $0x80
subl $str_len, %edi         #vracanje brojaca i adrese na kraj niza
decl %esi
jmp for_out
for_out:                    #petlja za ispis u obrnutom redosledu
cmpl $0, %esi
je kraj
movl $4, %eax
movl $0, %ebx
movl %edi, %ecx
movl $str_len, %edx
int $0x80
subl $str_len, %edi         #adrese elemenata
decl %esi                   #brojac
jmp for_out

kraj:
movl $1, %eax
movl $0, %ebx
int $0x80
