---
title: "perl : курсы : Лекция 1"
categories: perl
tags: courses 
reference:
  -

---

* TOC 
{:toc}

# Синтаксис языка
#### Простые конструкции

<pre><code class="perl">my $var;        # Обьявление переменной
my $a = 42;     # Присвоение переменной значниея
print "test";   # Вывод в STDOUT
eval {};        # Выполнение кода с крит. ошибкой
do {};          # Просто выполнение блок кода
</code></pre>

#### Блок
<pre><code class="perl">{
    # Здесь можно писать код
}
</code></pre>

#### Условия - if

<pre><code class="perl">if ( $a > $b ){
    print "a > b";
}
</code></pre>

<pre><code class="perl">if ( $a > $b ){
    print "a > b";
} else {
    print "something else";
}
</code></pre>

<pre><code class="perl">if ( $a > $b ){
    print "a > b";
} elsif ( $a > $c ){
    print "a > c";
} else {
    print "something else";
}
</code></pre>

#### Условия - unless

<pre><code class="perl">unless ( $a > $b ){
    print 'b > a';
}
</code></pre>

#### Циклы while/until

Пока условие истина
<pre><code class="perl">my $a = 1;
while ( $a < 10 ){
    $a++;
    print "hello\n";
}
</code></pre>

Пока условие лож
<pre><code class="perl">my $a = 1;
until ( $a > 10 ){
    $a++;
    print "hi\n";
}
</code></pre>