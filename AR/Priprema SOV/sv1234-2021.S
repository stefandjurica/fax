#program <priprema za SOV>
#autor SV25/2021 Cvijetic Danilo 15/12/21
.section .data
    prompt1: .ascii "Unseite logicki izraz: \0"
    prompt1_len = . - prompt1
    prompt2: .ascii "Rezultat: \0"
    prompt2_len = . - prompt2
    err1: .ascii "Greska kod operanda.\n\0"
    err1_len = . - err1
    err2: .ascii "Greska kod operacije.\n\0"
    err2_len = . - err2
    newline: .ascii "\n\0"
    newline_len = . - newline
    #input: .fill 100,1,0
    input: .ascii "123 ^ 0xf2 < 0X12\0"
    input_len = 100
    substring: .fill 10,1,0
    values: .fill 25, 1, 0
    operators: .fill 25, 1, 0
    length: .long 0
    end: .byte 0
.section .text
.globl main
main:
    movl $4, %eax
    movl $1, %ebx
    movl $prompt1, %ecx
    movl $prompt1_len, %edx
    int $0x80

    movl $3, %eax
    movl $1, %ebx
    movl $input, %ecx
    movl $input_len, %edx
    int $0x80
    movl %eax, length
    movl $input, %esi           #baza input stringa
   # movl $substring, %edi
    movl $0, %ebx  #ebx brojac u operators, ecx brojac u values    
    movl $0, %ecx  
separate:  
    cmpb $1, end
    je next
    cmpb $0, (%esi)
    je next
    cmpb $'^', (%esi)
    je setop1
    cmpb $'<', (%esi)
    je setop2
    cmpb $'>', (%esi)
    je setop3
    movl $substring, %edi
    jmp sep_part
sep_part:
    cmpb $0, (%esi)
    je endconvert
    cmpb $' ', (%esi)
    je convert
    movb (%esi), %al
    movb %al, (%edi)
    incl %esi
    incl %edi
    jmp sep_part
setop1:
    movb $1, operators(,%ebx, 1)
    incl %ebx
    addl $2, %esi
    jmp separate
setop2:
    movb $2, operators(,%ebx, 1)
    incl %ebx
    addl $2, %esi
    jmp separate
setop3:
    movb $3, operators(,%ebx, 1)
    incl %ebx
    addl $2, %esi
    jmp separate
endconvert:
    movl $1, end
convert:
    pushl $substring
    call convert_func
    addl $4, %esp
    cmpl $266, %eax
    je error1
    movb %al, values(,%ecx, 1)
    incl %ecx
    movl $0, %eax
    incl %esi
    jmp  separate
next:
    movl $0, %edi
    movl %ebx, %esi
    movl $0, %ebx
    movb values(,%edi, 1), %ch
    incl %edi
next2:
    cmpl %esi, %ebx
    je kraj
    movb values(,%edi,1), %cl
    movb operators(,%ebx,1), %dl
    cmpb $1, %dl
    je doxor
    cmpb $2, %dl
    je rotateleft
    cmpb $3, %dl
    je rotateright
doxor:
    xorb %cl, %ch
    incl %edi
    incl %ebx
    jmp next2
rotateleft:
    rolb %cl, %ch
    incl %edi
    incl %ebx
    jmp next2
rotateright:
    rolb %cl, %ch
    incl %edi
    incl %ebx
    jmp next2
#### rezultatt je u cl i treba ga u konvertovati u oktalni string 
error1:
    movl $1, %ebx
kraj:

movl $1, %eax
movl $0, %ebx
int $0x80