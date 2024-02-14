%include 'in_out.asm'
SECTION .data
msg1 db 'Введите X: ',0h
msg2 db 'Введите а: ',0h
msg3 db 'Ответ: ',0h
SECTION .bss
x resb 10
a resb 10
o resb 10
SECTION .text
global _start
_start:
mov eax,msg1
call sprint

mov ecx,x
mov edx,10
call sread

mov eax,x
call atoi
mov [x],eax

mov eax,msg2
call sprint

mov ecx,a
mov edx,10
call sread

mov eax,a
call atoi
mov [a],eax

mov ecx, [x]
mov [o],ecx

mov ebx,3
cmp eax,ebx
je fin
mov eax,[x]
mul ebx
;add eax,1
mov [o], eax
jmp otv

fin:
mov eax,[a]
;mul ebx
add eax,1
mov [o],eax
otv:
mov eax,msg3
call sprint
mov eax,[o]
call iprintLF
call quit
