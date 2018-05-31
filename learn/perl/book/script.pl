#!/usr/local/bin/perl -w

use strict;
use English;

print $] . "\n";
use v5.22;
print $] . "\n";

=head
# =head given/when

# use v5.22;

print "Введите цвет";

chomp(my $answer = <STDIN>);

given ($answer) {
    when (/apples?/) {
        print "I like apples."
    }
    when (/oranges?/) {
        print "I don't like oranges."
    }
    default {
        print "I don't like anything"
    }
}

# given($answer){
#     when('фиолетовый') { print "фиолетовый" };
# }

= if/unless

my $a = 11;
if ( $a > 10 ){
    print "a > 10\n";
}

my $a = 15;
if ( $a > 15 ){
    print "a > 15\n";
} else {
    print "a < 15\n";
}

my $a = 20;
if ( $a > 15 ){
    print "a > 15\n";
} elsif( $a >= 20 ) {
    print "a >= 20\n";
} else {
    print "a > 20 or a < 20\n";
}

my $a = 20;
unless( $a > 40 ){
    print "a < 40\n";
}

=head Истина 

print 0 ? "true\n" : "false\n";             # 0 становится строкой '0', поэтому false
print 1 ? "true\n" : "false\n";             # 1 становится строкой '1', поэтому true
print '0' ? "true\n" : "false\n";           # '0' итак строка '0', поэтому false
print 10 - 10 ? "true\n" : "false\n";       # 10 - 10 будет строка '0', поэтому false
print 0.00 ? "true\n" : "false\n";          # 0.00 становится строкой '0', поэтому false
print 0.00 ? "true\n" : "false\n";          # пустая строка, поэтому false
print '0.00' ? "true\n" : "false\n";        # строка '0.00', поэтому true
print '0.00' + 0 ? "true\n" : "false\n";    # строка '0.00' становится числом 0, поэтому false
# из той же оперы
print +'hi' ? "true\n" : "false\n";         # строка 'hi' остается без изменений, поэтому true
print 0 + 'hi' ? "true\n" : "false\n";      # в строке 'hi', впереди нет чисел, поэтому false
print 0 + '1hello, world' ? "true\n" : "false\n"; # ну т.е. если будут впереди числа то будет true

my $a = '';
print \$a ? "true\n" : "false\n";         # ссылка является истинной даже если она содержит false
print undef() ? "true\n" : "false\n";     # функция возвращает undef, поэтому false

=head
# Строки
my $a = '';
print '$a = ' . "$a it's " . ( $a ? "true\n" : "false\n" );

my $b = '0';
print '$b = ' . "$b it's " .( $b ? "true\n" : "false\n" );

my $c = "0";
print '$c = ' . "$c it's " .( $c ? "true\n" : "false\n" );

my $d = "hi";
print '$d = ' . "$d it's " .( $d ? "true\n" : "false\n" );

# числа

my $zero = 0;
print '$zero = ' . "$zero it's " .( $zero ? "true\n" : "false\n" );

my $one = 1;
print '$one = ' . "$one it's " .( $one ? "true\n" : "false\n" );


=head
my $val = 0;
$val //= 2;
$val ||= 4;
print $val;

# my $val = 0;
# $val //= 2;
# print $val;

=head
# open my $fh, "test"; # Чтение файла
# open my $fh, '<', "test"; # Тоже но с указанием действия
# open my $fh, '>', "test2"; # Создает и записывает в файл, если файл уже был создан - перезаписывает 
# open my $fh, '>>', "test3"; # Дописывает в конец файла. Также создает если его нет
# open my $fh, '|-', "ls -la";
# open my $fh, '-|', "test4";
use Encode;
use utf8;

# open my $fh, '>> : encoding(cp1251)', "test_cp1251";
# open my $fh, '< : encoding(cp1251)', "hi";
open my $fh, '>>:encoding(cp1251)', "hi2";
print $fh "Привет\n";
close $fh;

# v1
# open my $fh, '<', "hi";
# print encode("utf8", decode("cp1251", <$fh>) );

# v2
# open my $fh, '<:encoding(cp1251)', "hi";
# print encode("utf8", <$fh> );

# v2
open my $fh, '<:encoding(cp1251)', "hi2";
binmode STDOUT, 'utf8'; # Указывает в какой кодировке выводить
print <$fh>;

# # v3
# open my $fh, '<:encoding(cp1251)', "hi";
# print <$fh>;

close $fh;

=head
# запись
open my $fh, '>>', 'test.txt' or die "Can't create or open file 'test.txt'";
print $fh "hello\n";
close $fh;

# чтение
open my $fh, '<', 'test.txt' or die "Can't open file 'test.txt'";
my @test = <$fh>;
print @test;
close $fh;
