---
title: Perl - курсы Лекция 1
tags: [perl, courses]
reference:
  -

---

* TOC 
{:toc}

# Синтаксис языка
#### Простые конструкции

<pre><code class="perl">
my $var;        # Обьявление переменной
my $a = 42;     # Присвоение переменной значниея
print "test";   # Вывод в STDOUT
eval {};        # Выполнение кода с крит. ошибкой
do {};          # Просто выполнение блок кода
</code></pre>

#### Блок
<pre><code class="perl">
{
    # Здесь можно писать код
}
</code></pre>

#### Условия - if

<pre><code class="perl">
if ( $a > $b ){
    print "a > b";
}
</code></pre>

<pre><code class="perl">
if ( $a > $b ){
    print "a > b";
} else {
    print "something else";
}
</code></pre>

<pre><code class="perl">
if ( $a > $b ){
    print "a > b";
} elsif ( $a > $c ){
    print "a > c";
} else {
    print "something else";
}
</code></pre>

#### Условия - unless

<pre><code class="perl">
unless ( $a > $b ){
    print 'b > a';
}
</code></pre>

#### Циклы while/until

Пока условие истина
<pre><code class="perl">
my $a = 0;
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
<pre><code class="perl">
my $a = 0;
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
<pre><code class="perl">
my $a = 0;
do {
    $a++;
    print "$a\n";
} while ($a < 3);
=head
1
2
3
</code></pre>

<pre><code class="perl">
my $a = 0;
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

<pre><code class="perl">
for (my $i = 0; $i < 3; $i++){
    print "$i\n";
}
=head
0
1
2
</code></pre>

<pre><code class="perl">
my @list = (1,2,3);
for ( @list ){
    print "$_\n";
}
=head
2
3
</code></pre>

<pre><code class="perl">
my @list = (1,2,3);
for my $a ( @list ){
    print "$a\n";
}
=head
1
2
3
</code></pre>

<pre><code class="perl">
my @list = (1,2,3);
print "$_\n" for ( @list );
=head
1
2
3
</code></pre>

### Встроенные функций

#### warn, eval, die

<pre><code class="perl">
eval "$a/$b";
warn $@ if $@;
=head
syntax error at (eval 4) line 1, at EOF
</code></pre>

<pre><code class="perl">
eval { $a / $b };
warn $@ if $@;
=head
Illegal division by zero at simple.pl line 73.
</code></pre>

<pre><code class="perl">
eval { die "Not root" if $< };
warn $@ if $@;
</code></pre>

Реализация try/catch

<pre><code class="perl">
eval {
    100 / 0;
1} or do {
    warn "Error: $@";
}
=head
Error: Illegal division by zero at simple.pl line 80.
</code></pre>

#### chop, chomp

chop - вырезает 1 символ с конца строки  
chomp - вырезает 1 спец символ с конца строки

<pre><code class="perl">
my $a = $b = "test\t\n";
say chop($a) . chop($a) . chop($a); # \n, \t, t
say $a;

say chomp($b) . chomp($b) . chomp($b); # \n, \t, ''
say $b;
=head

    t
tes
100
test    
</code></pre>

#### index, rindex, substr, length

<pre><code class="perl">
#         ↓─────index($_," ") # 4
$_ = "some average string\n";
#        └─┬─┘    ↑───rindex($_," ") # 12
#          substr($_,3,5) = "e ave"
</code></pre>

#### lc, lcfirst, uc, ucfirst

<pre><code class="perl">
my $big = 'WORD';
my $small = 'word';
say lc $big;        # word "\L"
say lcfirst $big;   # wORD "\l"
say uc $small;      # WORD "\U"
say ucfirst $small; # Word "\u"

say "\u\l$big\E";
</code></pre>

#### sprintf

<pre><code class="perl">
say sprintf "%c", 9786;     # ☺ - utf8 символы
say sprintf "%s", "str";    # str - строка
say sprintf "%d", 49;       # 49 - число
say sprintf "%u", -1;       # 18446744073709551615 - TODO: непонятно
say sprintf "%o", 101;      # 145 - 8-ричное число
say sprintf "%x", 57005;    # dead - 16-ричное число
say sprintf "%e", 1/3;      # 3.333333e-01 - вывод дробного числа с экспонентой
say sprintf "%f", 1/5;      # 0.200000
say sprintf "%g", .333333e-01; # 0.0333333
</code></pre>

### Функции

#### обьявление

Именнованные функции
<pre><code class="perl">
sub mysub {
    my ($a, $b ) = @_;
    my $r = $a + $b;
    return $r;
}
</code></pre>

Безымянные функции
<pre><code class="perl">
my $var = sub {
    my $a = shift;
    return $a * 2;
}
</code></pre>

#### вызов

<pre><code class="perl">
say mysub( 1, 2 );
say mysub 5, 9;
say $var->(5);
=head
3
14
10
</code></pre>

### Модули

Пример модуля

<pre><code class="perl">
use MP3::Tag;
my $mp3 = MP3::Tag->new( $ARGV[0] );
print $mp3->artist . " - " . $mp3->title . "\n";
=head
perl simple.pl 1.mp3 
Tech N9ne - Worldwide Choppers
</code></pre>

<pre><code class="perl">
use Data::Dumper;
my $foo = [{a => 1, b => 2}, { c => 3, d => 4}];
print Dumper $foo;
=head
$VAR1 = [
          {
            'b' => 2,
            'a' => 1
          },
          {
            'd' => 4,
            'c' => 3
          }
        ];
</code></pre>

<pre><code class="perl">
use DDP;
my $foo = [{a => 1, b => 2}, { c => 3, d => 4}];
say p $foo;
=head
\ [
    [0] {
        a   1,
        b   2
    },
    [1] {
        c   3,
        d   4
    }
]
ARRAY(0x9aaa48)
</code></pre>