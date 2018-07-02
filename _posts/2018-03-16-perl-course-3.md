---
title: Perl - курсы Лекция 3
tags: [perl, courses]
reference:
  -

---

* TOC 
{:toc}

# Массивы массивов

## Пример массива содежашего в сибе другие массивы

<pre><code class="perl">
my @array1 = (
    [1, 2, 3 ],
    [4, 5, 6 ],
    [7, 8, 9 ]
);

my $array2 = [
    [9, 8, 7],
    [6, 5, 4],
    [3, 2, 1]
];

warn $array1[1][1]; # 5
warn $array2->[1][1]; # 5
</code></pre>

# Манипуляции: дереференс
# Сложные структуры
# Автооживление (autovivification)
# Символические ссылки
# sort
# map/map
# dumper
# Context: wantarray
# Prototype: empty & scalar
# Prototype: list
# Prototype: optional
# Prototype: force type
# Prototype: code block
# Prototype: context
# Prototype: constants
# Подавление прототипа
# Вызов с чужими параметрами
# lvalue
# HASH + SUB = Handlers
# Приоритеты операторов
# Операторы инкремента
# True & False
# Числа и строки
# Операторы сравнения и равенства
# C-style логические операторы
# Низкоприоритетные операторы
# Тернарный оператор
# Оператор присваивания
# Оператор запятая
# Оператор кавычки
# Регулярные выражения
# Сопоставление ( m// )
# Поиск и замена ( s/// )
# Метасимволы
# Классы символов
# Квантификаторы
# Группы и захваты
# Выбор альтернатив
# Модификаторы
# Unicode
# UTF
# Представление в байтах
# Значащие биты в UTF-8
# Строки и байты
# Преобразование
# Кодировка, набор символов
# Преобразование
# UTF8_FLAG
# use utf8;
# С флагом и без флага
# Поведение функций
# @ARGV в UTF-8
# STDIN, STDOUT, STDERR в UTF-8
# Default open
# Весь ввод/вывод в UTF-8
# Полезности
# use charnames
# Casefolding
# Unicode + RegExp
# v-strings