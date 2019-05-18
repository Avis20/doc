---
title: Ubuntu - etc
tags: [ubuntu, pdf, deadbeef]
reference:
  -
    link: http://softhelp.org.ua/?p=6423
    title: "Печать плакатов в Ubuntu"
---

* TOC 
{:toc}

## Печать одной страницы pdf на 2 страницы A4

Установка
<pre><code class="perl">
sudo apt-get install pdfposter
</code></pre>

Заходим в каталог с PDF файлом, который нужно разбить на части.
Теперь выполним команды, которые разобьют файл на нужное количество листов А4.

<pre><code class="shell">
# 2 листа А4
pdfposter -p 2x1a4 input.pdf out.pdf
</code></pre>

## Hotkeys для deadbeef

```Параметры системы -> Клавиатура -> Комбинации клавиш -> Доп. комбинации```

<pre><code class="perl">
gnome-calculator
/usr/bin/gnome-calculator

deadbeef: next
deadbeef --next

deadbeef: prev
deadbeef --prev

Value up
amixer -q sset Master 2+

Value down
amixer -q sset Master 2-
</code></pre>

<img src="/doc/static/img/deadbeef.png" alt="">
<img src="/doc/static/img/deadbeef2.png" alt="">
