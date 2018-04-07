---
title: "Заметки по книге - Администрирование PostgreSQL 9. Книга рецептов"
categories: postgres
reference:
  -
    link:
    title:
---

* TOC 
{:toc}

# TODO

В книге нет инструкции к установке, поэтому использовал статью - [Как установить и начать использовать PostgreSQL в Ubuntu 16.04](https://www.digitalocean.com/community/tutorials/postgresql-ubuntu-16-04-ru)

Сама установка свелась к:
<pre><code class="shell">$ sudo apt-get update
$ sudo apt-get install postgresql postgresql-contrib
</code></pre>

<div class="warn">
    <p>Блин, долго мучился с select-ом. Оказывается каждая команда в psql должна заканчиваться не новой строкой, а точкой с запятой!</p>
</div>