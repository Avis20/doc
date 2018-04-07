---
title: "Заметки по книге - Администрирование PostgreSQL 9. Книга рецептов"
categories: postgres
reference:
  -
    link: http://qaru.site/questions/16236/how-to-change-postgresql-user-password
    title: Как изменить пароль пользователя PostgreSQL?
---

* TOC 
{:toc}

В книге нет инструкции к установке, поэтому использовал статью - [Как установить и начать использовать PostgreSQL в Ubuntu 16.04](https://www.digitalocean.com/community/tutorials/postgresql-ubuntu-16-04-ru)

Сама установка свелась к:
<pre><code class="shell">$ sudo apt-get update
$ sudo apt-get install postgresql postgresql-contrib
</code></pre>

<div class="warn">
    <p>Блин, долго мучился с select-ом. Оказывается каждая команда в psql должна заканчиваться не новой строкой, а точкой с запятой!</p>
</div>

### Где я? кто я?

При подключении к базе, например через pgsql следующие команды помогут узнать где вынаходитесь

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
</div>

1. psql
<pre><code class="shell">psql -U avis -h 192.168.16.102 -p 5432 avis
</code></pre>

1. sql manager  

<img src="/doc/static/img/database/connect/1.png" alt="">

<img src="/doc/static/img/database/connect/2.png" alt="">

1. pgAdmin

<img src="/doc/static/img/database/connect/pgadmin1.png" alt="">

# Прочее

Graphical Query Builder

<img src="/doc/static/img/database/fire.png" alt="">
