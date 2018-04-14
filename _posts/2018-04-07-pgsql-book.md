---
title: "Заметки по книге - Администрирование PostgreSQL 9. Книга рецептов"
categories: postgres
reference:
  -
    link: http://qaru.site/questions/16236/how-to-change-postgresql-user-password
    title: Как изменить пароль пользователя PostgreSQL?
  - 
    title: psql manual
    link: http://postgresql.ru.net/manual/app-psql.html

---

* TOC 
{:toc}

В книге нет инструкции к установке, поэтому использовал статью - [Как установить и начать использовать PostgreSQL в Ubuntu 16.04](https://www.digitalocean.com/community/tutorials/postgresql-ubuntu-16-04-ru)

Сама установка свелась к:
<pre><code class="shell">$ sudo apt-get update
$ sudo apt-get install postgresql postgresql-contrib
</code></pre>

Зайти под пользователем postgres:
<pre><code class="shell">sudo -i -u postgres
</code></pre>

<div class="warn">
    <p>Блин, долго мучился с select-ом. Оказывается каждая команда в psql должна заканчиваться не новой строкой, а точкой с запятой!</p>
</div>

# psql

## Подключение psql

```psql -h host -p port -d dbname -U user```

<pre><code class="shell">psql -h 192.168.16.106 -p 5432 -d avis -U avis
</code></pre>

Пароль test12

Чтобы по 100 раз не вводить пароль, можно сохранить параметры подключения в ~/.pgpass  
Формат:
```host:port:dbname:user:password```
<pre><code class="shell">$ cat ~/.pgpass 
192.168.16.106:5432:*:avis:test12

$ psql -h 192.168.16.106
psql (9.5.12)
SSL connection (protocol: TLSv1.2, cipher: ECDHE-RSA-AES256-GCM-SHA384, bits: 256, compression: off)
Type "help" for help.

avis=# 
</code></pre>

<table>
    <tr>
        <th>Ключ</th>
        <th>Описание</th>
        <th>Пример</th>
    </tr>
    <tr>
        <td>-с</td>
        <td>Выполнить команду</td>
        <td><pre><code class="shell">$ psql -h 192.168.16.106 -d avis -U avis -c "select current_time;"
Password for user avis: 
       timetz       
--------------------
 18:07:26.839152+03
(1 row)
        </code></pre>
        </td>
    </tr>
    <tr>
        <td>-f</td>
        <td>Загрузить скрипт и выполнить</td>
        <td><pre><code class="shell">$ cat ./develop/learn/pgsql/book/script.sql 
CREATE TABLE "public".user (
    name varchar(50) NOT NULL
);

$ psql -h 192.168.16.106 -d avis -U avis -f ./develop/learn/pgsql/book/script.sql 
Password for user avis: 
CREATE TABLE
        </code></pre>
            
        </td>
    </tr>
    <tr>
        <td>-l</td>
        <td>Список баз данных на сервере</td>
        <td><pre><code class="shell">$ psql -h 192.168.16.106 -l
                                  List of databases
   Name    |  Owner   | Encoding |   Collate   |    Ctype    |   Access privileges   
-----------+----------+----------+-------------+-------------+-----------------------
 avis      | postgres | UTF8     | en_US.UTF-8 | en_US.UTF-8 | 
 postgres  | postgres | UTF8     | en_US.UTF-8 | en_US.UTF-8 | 
 template0 | postgres | UTF8     | en_US.UTF-8 | en_US.UTF-8 | =c/postgres          +
           |          |          |             |             | postgres=CTc/postgres
 template1 | postgres | UTF8     | en_US.UTF-8 | en_US.UTF-8 | =c/postgres          +
           |          |          |             |             | postgres=CTc/postgres
 test      | postgres | UTF8     | en_US.UTF-8 | en_US.UTF-8 | 
(5 rows)
        </code></pre></td>
    </tr>
    <tr>
        <td>\x</td>
        <td>Включить/выключить режим вывода строк в столбик</td>
        <td><pre><code class="perl">avis=# \d
List of relations
-[ RECORD 1 ]--------
Schema | public
Name   | test1
Type   | table
Owner  | avis
-[ RECORD 2 ]--------
Schema | public
Name   | test1_id_seq
Type   | sequence
Owner  | avis

        </code></pre></td>
    </tr>
    tr>td*3
</table>

## Мета-команды psql
<table>
    <tr>
        <th>Команда</th>
        <th>Описание</th>
        <th>Пример</th>
    </tr>
    <tr>
        <td>\h</td>
        <td>Запрсить справку по командам</td>
        <td><pre><code class="shell">avis=# \h delete
Command:     DELETE
Description: delete rows of a table
Syntax:
[ WITH [ RECURSIVE ] with_query [, ...] ]
DELETE FROM [ ONLY ] table_name [ * ] [ [ AS ] alias ]
    [ USING using_list ]
    [ WHERE condition | WHERE CURRENT OF cursor_name ]
    [ RETURNING * | output_expression [ [ AS ] output_name ] [, ...] ]
        </code></pre>
            
        </td>
    </tr>
    <tr>
        <td>\q</td>
        <td>Выйти из программы</td>
        <td></td>
    </tr>
    <tr>
        <td>\s</td>
        <td>Показать историю сделанных запросов</td>
        <td></td>
    </tr>
    <tr>
        <td>\password</td>
        <td>Сменить пароль пользователя под которым вошли</td>
        <td><pre><code class="shell"># \password 
Enter new password: 
Enter it again:
        </code></pre>
        </td>
    </tr>
    <tr>
        <td>\l</td>
        <td>Вывести список баз данных, по аналогии с psql -l</td>
        <td></td>
    </tr>

    
    tr>td*3
</table>

### Где я? кто я?

При подключении к базе, например через pgsql следующие команды помогут узнать где вы находитесь

* Узнать какой порт слушает сервер
<pre><code class="shell">avis=# select inet_server_port();
inet_server_port 
------------------
                 
(1 row)
</code></pre>

* IP адрес сервера принявшего соединение 
<pre><code class="shell">avis=# select inet_server_addr();
 inet_server_addr 
------------------
 
(1 row)
</code></pre>

* Текущая база

<pre><code class="shell">avis=# select current_database();
 current_database 
------------------
 avis
(1 row)
</code></pre>

* Текущий пользователь
<pre><code class="shell">avis=# select current_user;
 current_user 
--------------
 avis
(1 row)
</code></pre>

* Текущая версия postgres
<pre><code class="shell">avis=# select version();
                                                     version                                                      
------------------------------------------------------------------------------------------------------------------
 PostgreSQL 9.5.12 on x86_64-pc-linux-gnu, compiled by gcc (Ubuntu 5.4.0-6ubuntu1~16.04.9) 5.4.0 20160609, 64-bit
(1 row)
</code></pre>

### Открытие доступа к базе из вне

1. Установить адреса с которого постгрес будет ожидать соединения listen_addresses='*' в ```/etc/postgresql/9.5/main/postgresql.conf```
1. Чтобы установить всем пользователям доступ ко всем базам по паролю, нужно добавить/изменить в ```/etc/postgresql/9.5/main/pg_hba.conf```
    <pre><code class="shell"># TYPE  DATABASE        USER            ADDRESS                 METHOD
    host    all             all             0.0.0.0/0               md5
    </code></pre>


### Удаленное подключение

<div class="warn">
    <p>Перед подключением необходимо задать пароль пользователя к базе. Сделать это можно так: 
        <pre><code class="shell">avis=# alter user avis with password 'test12';
ALTER ROLE</code></pre>
    </p>
    <p>Что не очень безопасно, т.к. именно в таком виде будет храниться в базе</p>
</div>

1. psql
<pre><code class="shell">psql -U avis -h 192.168.16.102 -p 5432 avis
</code></pre>

1. sql manager  

<img src="/doc/static/img/books/pgsql/1.png" alt="">

<img src="/doc/static/img/books/pgsql/2.png" alt="">

1. pgAdmin

<img src="/doc/static/img/books/pgsql/pgadmin1.png" alt="">

# Прочее

Graphical Query Builder


## Какая версия postgres?

<pre><code class="shell"># select version();
                                                     version                                                      
------------------------------------------------------------------------------------------------------------------
 PostgreSQL 9.5.12 on x86_64-pc-linux-gnu, compiled by gcc (Ubuntu 5.4.0-6ubuntu1~16.04.9) 5.4.0 20160609, 64-bit
(1 row)
</code></pre>

## Сколько времени работает сервер?

<pre><code class="shell"># select date_trunc('second', current_timestamp - pg_postmaster_start_time());
 date_trunc 
------------
 00:56:57
(1 row)
</code></pre>

pg_postmaster_start_time - возвращает время когда сервер стартовал

## Где лежат логи сервера?

Он может быть в:
* Директории с данными
* В директории операционной системы - /spool/log, и т.п.
* Перенаправлен в syslog
* Может вовсе отсутсвовать

По умолчанию, в ubuntu - ```/var/log/postgresql/postgresql-9.5-main.log```

## Список баз данных на сервере

1. <pre><code class="shell">$ psql -h 192.168.16.106 -l
                                  List of databases
                                  ...
</code></pre>
2. <pre><code class="shell">avis=# \l
                                  List of databases
                                  ...
</code></pre>

3. <pre><code class="shell">select datname from pg_database;
  datname  
-----------
 template1
 template0
 postgres
 test
 avis
(5 rows)
</code></pre>

## Сколько таблиц в БД?

1. <pre><code class="perl">avis=# \dt
       List of relations
       ...
</code></pre>

2. <pre><code class="perl">avis=# select count(*) from information_schema.tables where table_schema not in ('information_schema', 'pg_catalog');
 count 
-------
     2
(1 row)
</code></pre>

В фонмиксе, на сегодняшний день - 14-04-2018, 26 схемы, 114 таблиц.

<img src="/doc/static/img/books/pgsql/difficult.png" alt="">

## Сколько весит база данных?

<pre><code class="perl">avis=# select pg_database_size(current_database());
 pg_database_size 
------------------
          7233708
(1 row)
</code></pre>

