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
```
sudo apt-get install pdfposter
```

Заходим в каталог с PDF файлом, который нужно разбить на части.
Теперь выполним команды, которые разобьют файл на нужное количество листов А4.

<pre><code class="shell"># 2 листа А4
pdfposter -p 2x1a4 input.pdf out.pdf
</code></pre>

## Hotkeys для deadbeef

```Параметры системы -> Клавиатура -> Комбинации клавиш -> Доп. комбинации```

<img src="/doc/static/img/deadbeef.png" alt="">
