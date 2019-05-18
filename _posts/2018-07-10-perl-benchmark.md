---
title: Perl - Benchmark
tags: [Benchmark, perl]
reference:
  - title: Benchmarking Your Code - PerlMonks
    link: https://www.perlmonks.org/?node_id=8745

---

* TOC 
{:toc}

# DESCRIPTION

Модуль Benchmark, инкапсулирует ряд подпрограм, которые помогут определить сколько времени потребуется для выполнения некоторого кода.

* timethese - выполнить несколько фрагментов кода несколько раз
* cmpthese - распечатать результаты timethese в виде сравнительной диаграммы
* countit - посмотреть сколько раз часть кода запуститься за указанное время

* timeit(COUNT, CODE) - запустить часть кода и посмотреть как долго он работает. COUNT - сколько раз запускать код. CODE - может быть как строкой, ссылкой на coderef или eval-ом.  
Возвращает обьект Benchmark

<pre><code class="perl">
use Benchmark;

my $res = timeit(100, sub { for (0..1000000){}; });
print "Result: " . timestr($res) . "\n\n";

$ perl benchmark.pl  
Result:  4 wallclock secs ( 3.29 usr +  0.01 sys =  3.30 CPU) @ 30.30/s (n=100)
</code></pre>

* timethis( COUNT, CODE, [ TITLE, [ STYLE ]] ) - выполнить часть кода несколько раз.  
COUNT - сколько раз запускать, CODE - что запускать, TITLE - заголовок теста, STYLE - формат как для timestr()  
Результат будет выведен в STDOUT

PS. COUNT может быть нулем либо отрицательным значением. В таком случае код будет повторятся в течении COUNT секунд. 0 - 3 сек.

<pre><code class="perl">
use Benchmark;

timethis(100, sub { for (0..200000){}; }, "Привет", 'noс');

$ perl benchmark.pl 
Привет: 1 0.65 0 0 0 100 noс @ 153.85/s (n=100)
</code></pre>

<pre><code class="perl">
timethis(0, sub { for (0..200000){}; } );

$ perl benchmark.pl 
timethis for 3:  4 wallclock secs ( 3.22 usr +  0.01 sys =  3.23 CPU) @ 150.77/s (n=487)
</code></pre>

or to run two pieces of code tests for at least 3 seconds:

<pre><code class="perl">
my @words = (qw(dsa dsafq fwqnjvreniop jop jop rkej[pb rekop[verw verwkobp[rewmboefr4 )) x 1200;

timethese(0, {
    foreach => sub {
        my %hash;
        foreach my $word ( @words ){
            $hash{ $word }++;
        }
    },
    for     => sub {
        my %hash;
        for ( @words ){
            $hash{ $_ }++;
        }
    }
});

$ perl benchmark.pl 
Benchmark: running for, foreach for at least 3 CPU seconds...
       for:  4 wallclock secs ( 3.22 usr +  0.00 sys =  3.22 CPU) @ 908.70/s (n=2926)
   foreach:  4 wallclock secs ( 3.22 usr +  0.00 sys =  3.22 CPU) @ 918.94/s (n=2959)

</code></pre>


## Примеры

<details>
    <summary>
        Сколько выполняется часть кода между start и end
    </summary>
<pre><code class="perl">
use Benchmark;

my $start = Benchmark->new();

for ( 0..20000000 ){};

my $end = Benchmark->new();
my $diff = timediff($start, $end);
print "Code took: " . timestr($diff) . "\n\n";

$ perl benchmark.pl  
Code took: -1 wallclock secs (-0.66 usr +  0.00 sys = -0.66 CPU)
</code></pre>
</details>



TODO: 10-07-2018 17:00