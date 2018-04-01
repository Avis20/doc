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
<pre><code class="perl">my $a = 0;
while ( $a < 3 ){
    $a++;
    print "$a\n";
}
=head
1
2
3
</code></pre>

Пока условие ложно
<pre><code class="perl">my $a = 0;
until ( $a > 3 ){
    $a++;
    print "$a\n";
}
=head
1
2
3
4
</code></pre>

Цикл с пост усовием пока истина
<pre><code class="perl">my $a = 0;
do {
    $a++;
    print "$a\n";
} while ($a < 3);
=head
1
2
3
</code></pre>

<pre><code class="perl">my $a = 0;
do {
    print "$a\n";
    $a++;
} until ( $a > 3 );
=head
0
1
2
3
</code></pre>

#### Циклы for/foreach

<pre><code class="perl">for (my $i = 0; $i < 3; $i++){
    print "$i\n";
}
=head
0
1
2
</code></pre>

<pre><code class="perl">my @list = (1,2,3);
for ( @list ){
    print "$_\n";
}
=head
2
3
</code></pre>

<pre><code class="perl">my @list = (1,2,3);
for my $a ( @list ){
    print "$a\n";
}
=head
1
2
3
</code></pre>

<pre><code class="perl">my @list = (1,2,3);
print "$_\n" for ( @list );
=head
1
2
3
</code></pre>

### Встроенные функций

#### warn, eval, die

<pre><code class="perl">eval "$a/$b";
warn $@ if $@;
=head
syntax error at (eval 4) line 1, at EOF
</code></pre>

<pre><code class="perl">eval { $a / $b };
warn $@ if $@;
=head
Illegal division by zero at simple.pl line 73.
</code></pre>

<pre><code class="shell">eval { die "Not root" if $< };
warn $@ if $@;
</code></pre>

Реализация try/catch
