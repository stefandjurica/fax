#program <palindrom>
#autor SV25/2021 Cvijetic Danilo 
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
movl $4, %eax                   #ispis poruke
movl $1, %ebx
movl $poruka, %ecx
movl $poruka_len, %edx
int $0x80
movl $3, %eax                   #unos stringa
movl $0, %ebx
movl $unos, %ecx
movl $50, %edx
int $0x80
movl %eax, %esi             #duzina unosa u %esi
decl %esi                   #oduzima se 1 zbog toga jer se ostatak dodaje na $unos koji je vec prva adresa
movl $unos, %eax            #donji brojac
addl $unos, %esi            #gornji brojac
decl %esi                   #izostavlja se znak enter /n
for:
cmpl %eax, %esi
jl is_p
je is_p
movb (%eax), %cl
cmpb %cl, (%esi)            #provjera slovo po slovo da li je palindrom
jne not_p
incl %eax
decl %esi
jmp for
is_p:
movl $4, %eax
movl $1, %ebx
movl $jestep, %ecx
movl $jestep_len, %edx
int $0x80
movl $0, %ebx             #izlazni kod je obrnut od postavke zadatka zbog greske u postavci i test skripti
jmp kraj
not_p:
movl $4, %eax
movl $1, %ebx
movl $nijep, %ecx
movl $nijep_len, %edx
int $0x80
movl $1, %ebx            #izlazni kod
jmp kraj

kraj:
movl $1, %eax
int $0x80
