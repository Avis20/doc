---
title: Postgres - Установка PostgreSQL
tags: postgres
reference:
  -
    link:
    title:
---

* TOC 
{:toc}

# Базовая установка postgres на ubuntu server 16.04.4

<pre><code class="shell">
$ sudo apt-get update
$ sudo apt-get install postgresql postgresql-contrib
</code></pre>

## Install 9.6

<pre><code class="perl">
sudo add-apt-repository "deb http://apt.postgresql.org/pub/repos/apt/ $(lsb_release -sc)-pgdg main"
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo apt-get update
sudo apt-get install postgresql-9.6
</code></pre>