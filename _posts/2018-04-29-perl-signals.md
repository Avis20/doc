---
title: "Perl - перехват и обработка сигналов"
tags: [signals, perl]
reference:
  -
    link:
    title:
---

* TOC 
{:toc}

<h2><a href="#SIGTERM">SIGTERM</a></h2>

### Небольшой пример того как обработывать сигнал выключение/перезагрузки сервера

Скрипт который пишет в файлик раз в секунду(имитация работающего демона)
<pre><code class="perl">
#!/usr/local/bin/perl

while ( 1 ){
    open my $fh, '>', '/home/orlov/tmp/test' or die "Can't open /home/orlov/tmp/test: $!";
    print $fh "1\n";
    close $fh;
    sleep 1;
}

exit;
</code></pre>

Добавляем обработку сигнала

<pre><code class="perl">
...

$SIG{TERM} = sub {
    open my $fh, '>', '/home/orlov/tmp/test' or die "Can't open /home/orlov/tmp/test: $!";
    print $fh "Server is shutdown!\n";
    close $fh;
    die;
}

</code></pre>

Проверяем
<pre><code class="perl">
$ perl rollback-if-reboot-server.pl
</code></pre>

<pre><code class="perl">
$ tail -f /home/orlov/tmp/test
1
1
1

</code></pre>

<pre><code class="perl">
$ ps aux | grep perl
orlov 36681  0,0  0,0 35612 7300  1  S+J  13:34   0:00,03 perl rollback-if-reboot-server.pl
orlov 36698  0,0  0,0 18840 2528  3  S+J  13:34   0:00,00 grep perl
</code></pre>

<pre><code class="perl">
$ kill -15 36681
</code></pre>

<pre><code class="perl">
$ tail -f /home/orlov/tmp/test
1
1
Server is shutdown!
</code></pre>

Работает! Теперь проверим в боевых условиях

Добавляем в начало скрипта запуск только одного процесса
<pre><code class="perl">
my $wpc = `ps axww | grep rollback-if-reboot-server.pl | grep -v grep | wc`;
$wpc =~ m/^\s*(\d+)/;
die if ( $1 > 1 );
</code></pre>

Добавим скрипт в крон

<pre><code class="perl">
cat /etc/crontab
*/1 * * * * orlov /usr/local/bin/perl /home/orlov/projects/script/rollback-if-reboot-server.pl 1>/dev/null
</code></pre>

Почистим тестовый лог
<pre><code class="perl">
> /home/orlov/tmp/test
</code></pre>

Ребутаем сервер
<pre><code class="perl">
sudo shutdown -r now
</code></pre>

После того как сервер поднимется, получаем заветное сообщение
<pre><code class="perl">
$ tail -f tmp/test
Server is shutdown!
</code></pre>