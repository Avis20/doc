---
title: Perl - курсы Лекция 6
tags: [perl, courses]
reference:
  -

---

* TOC 
{:toc}

# Работа с файлами

* FILEHANDLER - спец. тип
* STDIN, STDOUT, STDERR - спец. потоки

## Открыть файл

<pre><code class="perl">
open my $fh, '<', 'test.txt'; # '<' - открыть файл на чтение
print <$fh>; # <> - алиас для readline
</code></pre>

### Режимы открытия
* ```<``` - читать
* ```+<``` - читать + писать(заменяет текущий текст) TODO: непонятно
* ```>``` - писать
* ```+>``` - писать + читать. TODO: непонятно
* ```>>``` - дописать в конец. Читать не получиться 

### Указание кодировки при открытии

<pre><code class="perl">
open my $fh, '<:encoding(CP-1251)', 'unicode.txt';
print <$fh>;

$ cat unicode.txt 
�����
$ perl script.pl 
Привет
</code></pre>

Из cp-1251 в utf8
<pre><code class="perl">
open my $fh_cp, '<:encoding(CP-1251)', 'unicode.txt';
open my $fh_utf, '>:encoding(UTF-8)', 'utf8.txt';

while ( <$fh_cp> ){
    print $fh_utf $_;
}

close($fh_utf);
close($fh_cp);

$ cat unicode.txt 
�����
$ cat utf8.txt 
Привет
</code></pre>

### Чтение и запись в файл?

Читать можно из файла или из входного потока
<pre><code class="perl">
my $input = <> # = <STDIN\> - чтение из дескриптора;
open my $fh, '<', 'test.txt';
my $input = <$fh>; # Первую строку
say $input;
my @input = <$fh>; # Или все строки
say @input; # Причем если прочитали то из файлхендлера удаляется!

$ perl script.pl 
1

2
3
4
</code></pre>

Писать также
<pre><code class="perl">
open my $fh, '>', 'test.txt';
my $var = 'test';
print $var; # Пишет в STDOUT
print STDERR "ALARM!"; # Можно указывать явно поток
print $fh $var; # Пишет в файл
print {$fh} $var; # Можно и так

$ perl script.pl 
ALARM!test
</code></pre>

### Выбор дескриптора

<pre><code class="perl">
open my $fh1, '>', 'file1.txt' or die $!;
open my $fh2, '>', 'file2.txt' or die $!;

print "Написать в STDOUT\n";
select($fh1);
print "Написать в файл file1.txt\n";
my $old_fh = select($fh2); # можно выбрать и записать в переменную, причем сохраниться GLOB
print "Написать в файл file2.txt\n";
select(STDOUT);
print "Написать опять в STDOUT\n";
select($old_fh); # востановить предыдущий файлхендлер
print "Написать опять в файл file2.txt\n";

close $fh2;
close $fh1;

$ perl script.pl 
Написать в STDOUT
Написать опять в STDOUT

$ tail -f file*
==> file1.txt <==
Написать в файл file1.txt
Написать опять в файл file2.txt

==> file2.txt <==
Написать в файл file2.txt

==> file1.txt <==

</code></pre>

### Втроенные данные

<pre><code class="perl">
my @data = <DATA\>; # Здесь слеш не нужен!!

print @data;

__DATA__
Это текст который игнорирует перл, но может прочитать ;)

$ perl script.pl 
Это текст который игнорирует перл, но может прочитать ;)
</code></pre>

PS Чтобы прочитать, не нужно вызывать open

### Функции для чтения

Для работы с двоичными данными. Не помю зачем нужно...
<pre><code class="perl">
open my $fh, '<', 'test.bin' or die $!;
binmode($fh);
warn <$fh>;
</code></pre>

Небуферизированная запись
<pre><code class="perl">
open my $fh, '>', 'test.txt' or die $!;
my $data = "Test\n";
syswrite($fh, $data, length($data));
</code></pre>

Прямой вызов системного вызова sysread. Ваще непонятно!
<pre><code class="perl">
open my $fh, 'test.txt' or die $!;
my $data = "Test\n";
sysread($fh, $data, 2);
</code></pre>

Чтение двоичных данных. TODO: нужен нормальный двоичный файл!
<pre><code class="perl">
open my $fh, 'test.bin' or die $!;
my $data = "Test\n";
read($fh, $data, 2);
warn <$fh>;
</code></pre>

Проверка на отсутствие данных в файле
<pre><code class="perl">
open my $fh, 'test.txt' or die $!;
warn eof($fh);
my @test = <$fh>;
warn eof($fh);

$ perl script.pl 
Warning: something's wrong at script.pl line 6.
1 at script.pl line 8, <$fh> line 1.

</code></pre>

#### Пример
<pre><code class="perl">
$ cat script.pl 
#!/usr/bin/env perl

use strict;
use Digest::MD5 qw| md5_hex |;

$\ = "\n";
my $data = '';
my $data_size = 1024;

open my $fh, '<:raw', 'a.out' or die $!;

until ( eof($fh) ){
    read($fh, $data, $data_size) == $data_size
      or die "Неверный формат";
    print md5_hex($data);
}
close($fh);

$ cat hi.cpp 

#include <iostream\>

int main (){
    std::cout << 123 << std::endl;
    return 0;
}

$ g++ hi.cpp
$ perl script.pl 
2912b5a9a1d612b3225e6259c8f16d82
2b4c581f784b0c9ec5541ebb18747f8c
4d158812ac0cf9d9b7788a148d2fb045
d7db69845df9d9aeea28d0aa03222594
7cad1fb5520ed9655e74d460d122f827
d63d4167a2bb47e5ff299d855de08437
fd05c1dde19ee23ae446b95029db2457
f11bd83a259b3f32e9076d03570a236e
Неверный формат at script.pl line 13.

</code></pre>

ЗАЧЕМ???

### Проверка результата работы программы open

<pre><code class="perl">
open my $fh, 'Такого файла не существует!' || die $!;
$ perl script.pl 

open my $fh, 'Такого файла не существует!' or die $!;
$ perl script.pl 
No such file or directory at script.pl line 5.

</code></pre>

<!-- --------------------------------------------------------------------------- -->


# Perl io backend

fread, fwrite - чтение из диска!

# Взаимодействие с процессами

`` - бектике
qw - синоним бектикетов
exec - замена текущего процесса
fork - порождение нового процесса
pipe - связка манипуляторов в канал. Не сразу попадает в получателю! Но можно управлять через autoflush
<> -> readline 

$| = 1 -> autoflush на STDIN, STDOUT, STDERR - очистка буфера; Действует только на файлы!
Если только на файл. $fh->autoflush;

waitpid - подождать когда завершаться chaild-ы

<pre><code class="shell">

</code></pre>


### Модули

#### IPC::Open3
#### IPC::Run3
#### IO::Handle


## Зомби

$? - 16 

## Обработка сигалов

<pre><code class="shell">
{
    local $SIG{INT} = 'IGNORE';

    sleep 3;
}

warn "NOW";

sleep 10;
</code></pre>

## Локи на файлы

flock - работает только c flock

# Сериализация

Почитать про pack и unpack
pack и unpack могут быть разными!