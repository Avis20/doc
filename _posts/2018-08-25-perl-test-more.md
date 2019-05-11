---
title: Perl - Test::More
tags: [perl, test]
reference:
  - title: Test::More для начинающих
    link: http://dev-lab.info/2010/11/testmore-%D0%B4%D0%BB%D1%8F-%D0%BD%D0%B0%D1%87%D0%B8%D0%BD%D0%B0%D1%8E%D1%89%D0%B8%D1%85/

  - title: Тестирование в Perl. Лучшие практики
    link: http://pragmaticperl.com/issues/14/pragmaticperl-14-%D1%82%D0%B5%D1%81%D1%82%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D0%B5-%D0%B2-perl.-%D0%BB%D1%83%D1%87%D1%88%D0%B8%D0%B5-%D0%BF%D1%80%D0%B0%D0%BA%D1%82%D0%B8%D0%BA%D0%B8.html
---

* TOC 
{:toc}

>Здесь главное не начать подгонять код под тесты, чтобы "все работало". Тогда будет счастье. Ну и не писать бесполезных тестов.
justnoxx • 4 года назад

Синтаксис

## План

Чтобы вывести кол-во успешных/неуспешных тестов, нужно указать ```no_plan``` в use

<pre><code class="perl">
use Test::More  qw| no_plan |;
</code></pre>

В таком случает, модуль сам посчитает

Либо в конце скрипта
<pre><code class="perl">
use Test::More;
...
done_testing();
</code></pre>

Или самому сказать сколько планировалось обработать тестов
<pre><code class="perl">
use Test::More  'tests' => 2;
</code></pre>

## Основные функции модуля

### ok

<pre>
    ok($got eq $expected, $test_name)
</pre>

ok проверяет булево значение 

<pre><code class="perl">
use Test::More      qw| no_plan |;

ok('Привет' eq 'Привет', 'Проверка строки');
ok( 1 + 1 == 3, '1 + 1 = 3');

$ perl script.pl 
ok 1 - Проверка строки
not ok 2 - 1 + 1 = 3
#   Failed test '1 + 1 = 3'
#   at script.pl line 7.
1..2
# Looks like you failed 1 test of 2.
</code></pre>


### is, isnt

<pre>
    is  ($got eq $expected, $test_name)
    isnt($got eq $expected, $test_name)
</pre>

Сравнение на eq и ne

<pre><code class="perl">
use Test::More      qw| no_plan |;

is('Привет', 'Привет', 'Проверка eq');
isnt('Привет', 'Пока', 'Проверка ne');

$ perl script.pl 
ok 1 - Проверка eq
ok 2 - Проверка ne
1..2
</code></pre>

По сравнению с ok, is и isnt предосталяют подробный отчет

<pre><code class="perl">
use Test::More      qw| no_plan |;
is('test', 'more', 'fail test!!!');

$ perl script.pl 
not ok 1 - fail test!!!
#   Failed test 'fail test!!!'
#   at script.pl line 6.
#          got: 'test'
#     expected: 'more'
1..1
# Looks like you failed 1 test of 1.
</code></pre>

### like, unlike

<pre>
    like  ($got, qr/expected/, $test_name)
    unlike($got, qr/expected/, $test_name)
</pre>

Сравнение по регулярке

<pre><code class="perl">
use Test::More      qw| no_plan |;

like('hello, world!', qr/hell/, 'hell is matched');

$ perl script.pl 
ok 1 - hell is matched
1..1
</code></pre>

<pre><code class="perl">
use Test::More      qw| no_plan |;

unlike('hello, world!', qr/you/, 'you is not matched');

$ perl script.pl 
ok 1 - you is not matched
1..1
</code></pre>

### cmp_ok

<pre>
    cmp_ok($got, $operator, $expected, $test_name)
</pre>

Сравнение с переданным оператором 

<pre><code class="perl">
use Test::More      qw| no_plan |;

cmp_ok('1', '<', 2, "Test cmp_ok");

$ perl script.pl 
ok 1 - Test cmp_ok
1..1
</code></pre>

### pass, fail

<pre>
    pass($test_name)
    fail($test_name)
</pre>

Тест пройден(pass) или не пройден(fail)

Видимо используются для принудительного указания

<pre><code class="perl">
use Test::More      qw| no_plan |;

pass('test 1 ok');
pass('test 2 ok');
fail('test 3 ok');
fail('test 4 ok');

$ perl script.pl 
ok 1 - test 1 ok
ok 2 - test 2 ok
not ok 3 - test 3 ok
#   Failed test 'test 3 ok'
#   at script.pl line 8.
not ok 4 - test 4 ok
#   Failed test 'test 4 ok'
#   at script.pl line 9.
1..4
# Looks like you failed 2 tests of 4.
</code></pre>

## саб тесты

<pre><code class="perl">
subtest "Название теста" => sub {
    # Тест
};
</code></pre>

## Тест ООП

TODO

### can_ok

<pre>
    can_ok($module, @methods);
    can_ok($object, @methods);
</pre>

### isa_ok

## Модули

### use_ok

### require_ok

## Сложные структуры

### is_deeply

<pre>
    is_deeply($got, $expected, $test_name);
</pre>

Проверяет структуру

<pre><code class="perl">
use Test::More      qw| no_plan |;

my $got = {
    test  => [{t => 1,  q  => 'w'}],
    test2 => [{t2 => 1, q1 => 'w'}],
};

my $expected = {
    test => { test2 => 2 }
};

is_deeply($got, $expected, "test structure");

$ perl script.pl 
not ok 1 - test structure
#   Failed test 'test structure'
#   at script.pl line 15.
#     Structures begin differing at:
#          $got->{test} = ARRAY(0x18769c0)
#     $expected->{test} = HASH(0x1858f30)
1..1
# Looks like you failed 1 test of 1.
</code></pre>

## Диагностика

### diag
### note

## Разное

### TODO: BLOCK
### SKIP: BLOCK
### todo_skip


## Debugging tests

<pre><code class="perl">
perl -d -Ilib t/mytest.t
</code></pre>

