---
## Front matter
title: "Отчёта по лабораторной работе 6"
subtitle: "Освоение арифметических инструкций языка ассемблера NASM."
author: " Останин Владислав Александрович	НПМбв-01-21"

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
figureTitle: "Рис."
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

Целью работы является освоение арифметических инструкций языка ассемблера NASM.

# Выполнение лабораторной работы

1. Создаем каталог для программам лабораторной работы № 6, переходим в него и создаем файл lab6-1.asm: 

2. Рассмотрим примеры программ вывода символьных и численных значений. 
Программы будут выводить значения, записанные в регистр eax.

![Пример программы](image/01.png){ #fig:001 width=70%, height=70% }

![Работа программы](image/02.png){ #fig:002 width=70%, height=70% }

3. Далее изменим текст программы и вместо символов, запишем в регистры числа. 

![Пример программы](image/03.png){ #fig:003 width=70%, height=70% }

![Работа программы](image/04.png){ #fig:004 width=70%, height=70% }

Никакой символ не виден, но он есть. Это возврат каретки LF.

4. Как отмечалось выше, для работы с числами в файле in_out.asm реализованы 
подпрограммы для преобразования ASCII символов в числа и обратно. 
Преобразуем текст программы с использованием этих функций.

![Пример программы](image/05.png){ #fig:005 width=70%, height=70% }

![Работа программы](image/06.png){ #fig:006 width=70%, height=70% }

В результате работы программы мы получим число 106. В данном случае, как и в первом, 
команда add складывает коды символов ‘6’ и ‘4’ (54+52=106). 
Однако, в отличии от прошлой программы, функция iprintLF позволяет вывести число, 
а не символ, кодом которого является это число.

5. Аналогично предыдущему примеру изменим символы на числа.

Создайте исполняемый файл и запустите его. 
Какой результат будет получен при исполнении программы? – получили число 10

![Пример программы](image/07.png){ #fig:007 width=70%, height=70% }

![Работа программы](image/08.png){ #fig:008 width=70%, height=70% }

Замените функцию iprintLF на iprint. Создайте исполняемый файл и запустите его. 
Чем отличается вывод функций iprintLF и iprint? - Вывод отличается что нет переноса строки. (рис. [-@fig:009])

![Работа программы](image/09.png){ #fig:009 width=70%, height=70% }

6. В качестве примера выполнения арифметических операций в NASM приведем 
программу вычисления арифметического выражения 
$$f(x) = (5 * 2 + 3)/3$$.

![Пример программы](image/10.png){ #fig:010 width=70%, height=70% }

![Работа программы](image/11.png){ #fig:011 width=70%, height=70% }

Измените текст программы для вычисления выражения 
$$f(x) = (4 * 6 + 2)/5$$. 
Создайте исполняемый файл и проверьте его работу.

![Пример программы](image/12.png){ #fig:012 width=70%, height=70% }

![Работа программы](image/13.png){ #fig:013 width=70%, height=70% }

7. В качестве другого примера рассмотрим программу вычисления варианта задания по 
номеру студенческого билета: 

![Пример программы](image/14.png){ #fig:014 width=70%, height=70% }

![Работа программы](image/15.png){ #fig:015 width=70%, height=70% }

* Какие строки листинга 6.4 отвечают за вывод на экран сообщения ‘Ваш вариант:’? – mov eax,rem – перекладывает в регистр значение переменной с фразой ‘Ваш вариант:’ call sprint – вызов подпрограммы вывода строки

* Для чего используется следующие инструкции? 
```nasm 
mov ecx, x 
mov edx, 80 
call sread```
  
Считывает значение студбилета в переменную Х из консоли

* Для чего используется инструкция “call atoi”?  - эта подпрограмма переводит введенные символы в числовой формат

* Какие строки листинга 6.4 отвечают за вычисления варианта? 

```xor edx,edx
mov ebx,20
div ebx```

* В какой регистр записывается остаток от деления при выполнении инструкции “div ebx”? 

```1 байт AH 
2 байта DX 
4 байта EDX – наш случай```

* Для чего используется инструкция “inc edx”?  по формуле вычисления варианта нужно прибавить единицу

* Какие строки листинга 6.4 отвечают за вывод на экран результата вычислений

mov eax,edx – результат перекладывается в регистр eax
call iprintLF – вызов подпрограммы вывода

8. Написать программу вычисления выражения y = f(x). Программа должна выводить выражение 
для вычисления, выводить запрос на ввод значения x, 
вычислять заданное выражение в зависимости от введенного x, выводить результат вычислений. 
Вид функции f(x) выбрать из таблицы 6.3 вариантов заданий в соответствии с номером 
полученным при выполнении лабораторной работы. 
Создайте исполняемый файл и проверьте его работу для значений x1 и x2 из 6.3.

Получили вариант 13 - $$(8𝑥 + 6) ⋅ 10 $$  для х=1 и 4

![Пример программы](image/16.png){ #fig:016 width=70%, height=70% }

![Работа программы](image/17.png){ #fig:017 width=70%, height=70% }

# Выводы

Изучили работу с арифметическими операциями