---
title: "Ubuntu : Разное"
categories: os
tags: ubuntu pdf
reference:
  -
    link: http://softhelp.org.ua/?p=6423
    title: "Печать плакатов в Ubuntu"
  -
    link: https://toster.ru/q/290158
    title: "Почему chrome не открывает ссылку кликнутую в сторонних приложениях в Ubuntu?"

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

## Баг с новым окном в хроме

Изменить параметр запуска

<pre><code class="shell">vim $HOME/.local/share/applications/google-chrome.desktop
# Exec=/opt/google/chrome/chrome -> Exec=/opt/google/chrome/chrome %U
</code></pre>

## Hotkeys для deadbeef

<img src="/doc/static/img/deadbeef.png" alt="">
