#!/usr/local/bin/perl

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
