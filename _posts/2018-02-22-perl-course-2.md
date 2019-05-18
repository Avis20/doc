---
title: Perl - курсы Лекция 2
tags: [perl, courses]
reference:
  -

---

* TOC 
{:toc}
* SCALAR ($s)
    * Number
        * Integer value ($s = 1)
        * Numeric value (double) ($s = 3.14)
    * String ($s = "str")
    * Reference ($r)
        * Scalar ($$r)
        * Array (@$r)
        * Hash (%$r)
        * Function (&$r)
        * Filehandle (*$r)
        * Lvalue ($$r)
        * Reference ($$r)
        * ARRAY (@a)
        * HASH (%h)
* Array (@a)
* Hash (%h)


## Числа 
<pre><code class="perl">
my $int = 12345;                # число
my $pi = 3.141592;              # число с остатком
my $pi_read = 3.14_15_92_65;    # Число с остатком разделеное _
my $plank = .6633E-33;          # ?
my $hex = 0xffff;               # 16-ричное чило
my $bom = 0xef_bb_55;           # 16-ричное чило разделеное _
my $oct = 0751;                 # 8-рично число
my $bin = 0b0101;               # 2-чное число
</code></pre>

## Строки

<pre><code class="perl">
my $one = "string";
my $two = 'str';
my $wrap = "wrapped 
string";
my $join = "prefix:$one\r\n";
my $q_1 = q/single-'quote'/;
my $qq_2 = qq/double-"quoted"-$two/; # Двойные кавычки поддерживают интерполяцию
my $smile = ":) -> \x{263A}"; # также есть поддержка юникода
my $ver  = v1.2.3.123; # еще есть специальные строки которые обозначают версию, но я не помню чем они особенны ;)
my $here  = <<END;
Если текст большой
его можно записать в переменную
таким образом.
При этом сохраняться все переносы
END
</code></pre>

## Массивы

<pre><code class="perl">
</code></pre>