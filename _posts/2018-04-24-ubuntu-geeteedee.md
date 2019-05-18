---
title: "Ubuntu - Установка todo менеджера GeeTeeDee"
tags: [ubuntu, todo]
reference:
  -
    link:
    title:
---

* TOC 
{:toc}

# Установка в Ubuntu 16.04
Оказывается все не так уж и просто! Нужно еще с бубном поплясать!

## Простая установка:
<pre><code class="shell">
>>>32bit

wget -O geeteedee_32.deb http://codea.ru/static/codea-geeteedee_0.2.608_i386.deb
sudo dpkg -i geeteedee_32.deb
sudo apt-get -f install;rm geeteedee_32.deb

>>>64bit

wget -O geeteedee_64.deb http://codea.ru/static/codea-geeteedee_0.2.608_amd64.deb
sudo dpkg -i geeteedee_64.deb
sudo apt-get -f install;rm geeteedee_64.deb

</code></pre>

## Если что-то пошло не так

У меня во время установки упало с ошибкой:
<pre><code class="shell">
Распаковывается codea-geeteedee (0.2.608) …
dpkg: зависимости пакетов не позволяют настроить пакет codea-geeteedee:
 codea-geeteedee зависит от libqt4-gui (>= 4.8.0), однако:
  Пакет libqt4-gui не установлен.
</code></pre>

И вот как я ее решал:

1. Установить зависимости для qt4
<pre><code class="shell">
sudo apt install libqt4-designer libqt4-opengl libqt4-svg libqtgui4 libqtwebkit4
</code></pre>
Если что-то ламается, лучше следовать советам. Например сделать ```sudo apt autoremove```

2. Создать скрипт по изменению зависимостей пакетов:
<pre><code class="perl">
vim videbcontrol
#!/bin/bash

if [[ -z "$1" ]]; then
  echo "Syntax: $0 debfile"
  exit 1
fi

DEBFILE="$1"
TMPDIR=`mktemp -d /tmp/deb.XXXXXXXXXX` || exit 1
OUTPUT=`basename "$DEBFILE" .deb`.modfied.deb

if [[ -e "$OUTPUT" ]]; then
  echo "$OUTPUT exists."
  rm -r "$TMPDIR"
  exit 1
fi

dpkg-deb -x "$DEBFILE" "$TMPDIR"
dpkg-deb --control "$DEBFILE" "$TMPDIR"/DEBIAN

if [[ ! -e "$TMPDIR"/DEBIAN/control ]]; then
  echo DEBIAN/control not found.

  rm -r "$TMPDIR"
  exit 1
fi

CONTROL="$TMPDIR"/DEBIAN/control

MOD=`stat -c "%y" "$CONTROL"`
vi "$CONTROL"

if [[ "$MOD" == `stat -c "%y" "$CONTROL"` ]]; then
  echo Not modfied.
else
  echo Building new deb...
  dpkg -b "$TMPDIR" "$OUTPUT"
fi

rm -r "$TMPDIR"
</code></pre>

3. Разрешить права на исполнение(не обязательно):
<pre><code class="shell">
chomd +x videbcontrol
</code></pre>

4. Скачать пакет libqt4-gui:
[libqt4-gui_4.8.5+git192-g085f851+dfsg-2ubuntu4_amd64.deb](https://ubuntu.pkgs.org/14.04/ubuntu-universe-amd64/libqt4-gui_4.8.5+git192-g085f851+dfsg-2ubuntu4_amd64.deb.html)

5. Запустить скрипт с пакетом:
<pre><code class="shell">
videbcontrol libqt4-gui_4.8.5+git192-g085f851+dfsg-2ubuntu4_amd64.deb
</code></pre>

6. В появившемся редакторе, изменить строчку ```Depends: libxss1,libaudio2,libasound2,libqt4-gui (>= 4.8.1)...``` на
<pre><code class="perl">
Depends: libxss1,libaudio2,libasound2,libqt4-designer,libqt4-opengl,libqt4-svg,libqtgui4,libqtwebkit4,libqt4-network
</code></pre>
появиться новый файлик - libqt4-gui_4.8.5+git192-g085f851+dfsg-2ubuntu4_amd64.modfied.deb

7. Внимание, важный момент! Установить новый пакет:
<pre><code class="perl">
sudo dpkg -i libqt4-gui_4.8.5+git192-g085f851+dfsg-2ubuntu4_amd64.modfied.deb
</code></pre>

8. Устанавливаем geeteedee:
<pre><code class="perl">
sudo dpkg -i geeteedee_64.deb
</code></pre>