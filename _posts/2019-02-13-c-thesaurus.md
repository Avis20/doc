---
title: Си - справочник 
tags: [c]
reference:

---

* TOC 
{:toc}

# stdlib.h - стандартный заголовочный файл. Содержит кучу всего

### strtol - Преобразует строку в число

Принимает: строку, TODO: Что-то еще, систему счисления  
Возвращает: число типа long int

long int strtol(const char *str, char **endptr, int base)

[strtol - convert string to a long integer](http://pubs.opengroup.org/onlinepubs/7908799/xsh/strtol.html)

<p><b>Примеры</b></p>
<details>
    <summary>
        Пример
    </summary>
    <pre><code class="perl">
printf("%ld\n", strtol("0xabcdef0", NULL, 16));
180150000
[Finished in 0.1s]
    </code></pre>
</details>

# string.h - обработка строк

### strlen(s) - возвращает длину строки s

<p><b>Примеры</b></p>
<details>
    <summary>
        Пример
    </summary>
    <pre><code class="perl">
        content
    </code></pre>
</details>

# ctype.h - обработка символов

### isdigit(c) - проверка на число

<p><b>Примеры</b></p>
<details>
    <summary>
        Пример
    </summary>
    <pre><code class="perl">
        content
    </code></pre>
</details>

# math.h - мат. функции

### sqrt - квадратный корень

<p><b>Примеры</b></p>
<details>
    <summary>
        Пример
    </summary>
    <pre><code class="perl">
printf("%f", sqrt( (double) 4));
    </code></pre>
</details>
