
%include 'in_out.asm'
SECTION .data
msg: DB 'Введите N: ',0
rem: DB 'Result: ',0
SECTION .bss
x: RESB 80
SECTION .text
GLOBAL _start
_start:
mov eax, msg
call sprintLF
mov ecx, x
mov edx, 80
call sread
mov eax,x ; вызов подпрограммы преобразования
call atoi ; ASCII кода в число, `eax=x

add eax,2 
mul eax

mov ebx, eax
mov eax,rem
call sprint
mov eax,ebx
call iprintLF
call quit