---
title: "perl : курсы : Лекция 3"
categories: perl
tags: courses 
reference:
  -

---

* TOC 
{:toc}

# Работа с файлами

FILEHANDLER - спец. тип
STDIN, STDOUT, STDERR - спец. потоки

## Открыть файл

TODO: ...

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

<pre><code class="shell">{
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