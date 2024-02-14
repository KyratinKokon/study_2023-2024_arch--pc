%include 'in_out.asm'

SECTION .data
prim DB 'f(x) = 7 + 2x',0
otv DB 'Результат: ',0
SECTION .text
GLOBAL _start
_start:

pop ecx

pop edx

sub ecx,1

mov esi,0

mov eax,prim
call sprintLF
next:
cmp ecx,0
jz _end

pop eax
call vadim

add esi, eax
loop next

_end:
mov eax,otv
call sprint
mov eax,esi
call iprintLF
call quit


vadim:
call atoi
mov ebx,2
; pop eax
mul ebx
add eax,7
ret
