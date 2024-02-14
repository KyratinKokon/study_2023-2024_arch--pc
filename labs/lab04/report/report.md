---
## Front matter
title: "Отчёта по лабораторной работе 4"
subtitle: "Создание и процесс обработки программ на языке ассемблера NASM"
author: "Останин Владислав Александрович	НПМбв-01-21"

## Generic otions
lang: ru-RU
toc-title: "Содержание"

## Bibliography
bibliography: bib/cite.bib
csl: pandoc/csl/gost-r-7-0-5-2008-numeric.csl

## Pdf output format
toc: true # Table of contents
toc-depth: 2
lof: true # List of figures
lot: true # List of tables
fontsize: 12pt
linestretch: 1.5
papersize: a4
documentclass: scrreprt
## I18n polyglossia
polyglossia-lang:
  name: russian
  options:
	- spelling=modern
	- babelshorthands=true
polyglossia-otherlangs:
  name: english
## I18n babel
babel-lang: russian
babel-otherlangs: english
## Fonts
mainfont: PT Serif
romanfont: PT Serif
sansfont: PT Sans
monofont: PT Mono
mainfontoptions: Ligatures=TeX
romanfontoptions: Ligatures=TeX
sansfontoptions: Ligatures=TeX,Scale=MatchLowercase
monofontoptions: Scale=MatchLowercase,Scale=0.9
## Biblatex
biblatex: true
biblio-style: "gost-numeric"
biblatexoptions:
  - parentracker=true
  - backend=biber
  - hyperref=auto
  - language=auto
  - autolang=other*
  - citestyle=gost-numeric
## Pandoc-crossref LaTeX customization
figureTitle: "� ис."
tableTitle: "Таблица"
listingTitle: "Листинг"
lofTitle: "Список иллюстраций"
lotTitle: "Список таблиц"
lolTitle: "Листинги"
## Misc options
indent: true
header-includes:
  - \usepackage{indentfirst}
  - \usepackage{float} # keep figures where there are in the text
  - \floatplacement{figure}{H} # keep figures where there are in the text
---

# Цель работы

Целью работы является освоение процедуры компиляции и сборки программ, написанных на ассемблере NASM.

# Выполнение лабораторной работы

1. Создали каталог lab04 командой mkdir, перешел в него с помощью команды cd, создал файл hello.asm.

![Создание каталога и файла](images/1.png){ #fig:001 width=70%, height=70% }

2. Открыли файл и написали текст программы

![Программа в файле hello.asm](images/2.png){ #fig:002 width=70%, height=70% }

```
SECTION .data
hello: DB 'Hello world!',10 
helloLen: EQU $-hello
SECTION .text
GLOBAL _start
_start:
mov eax,4
mov ebx,1
mov ecx,hello
mov edx,helloLen
int 80h
mov eax,1
mov ebx,0
int 80h
```
3. Транслировали файл командой nasm. Получился объектный файл hello.o

4. Транслировали файл командой nasm с дополнительными опциями.

5. Выполнили линковку командой ld и получили исполняемый файл.

6. Еще раз выполнили линковку для объектного файла obj.o и получили исполняемый файл main.

7. Запустили исполняемые файлы.

![Трансляция, линковка и запуск программы hello.asm](images/3.png){ #fig:003 width=70%, height=70% }

8. Изменили сообщение Hello world на свое имя и запустили файл еще раз.

![Программа в файле lab4.asm](images/4.png){ #fig:004 width=70%, height=70% }

```
SECTION .data
hello: DB 'Yusuf Subanov',10 
helloLen: EQU $-hello
SECTION .text
GLOBAL _start
_start:
mov eax,4
mov ebx,1
mov ecx,hello
mov edx,helloLen
int 80h
mov eax,1
mov ebx,0
int 80h
```

![Трансляция, линковка и запуск программы lab4.asm](images/5.png){ #fig:005 width=70%, height=70% }

# Выводы

Освоили процесс компиляции и сборки программ, написанных на ассемблере nasm.
