---
title: VirtualBox на Ubuntu 16.04. Установка/Настройка
tags: [chrome, tools]
reference:
  - title: Образ достаточно чистой оси
    link: http://windows64.net/windows-xp-x64-skachat-torrent/originalnye-obrazy-xp/14-skachat-windows-xp-sp3-originalnyy-obraz-aktivator.html
  
  - title: Баг с зависанием виртуалки
    link: https://ru.stackoverflow.com/questions/774963/virtualbox-%D0%B8-%D0%B7%D0%B0%D0%B2%D0%B8%D1%81%D0%B0%D0%BD%D0%B8%D0%B5-%D0%BA%D0%BE%D0%BC%D0%BF%D1%8C%D1%8E%D1%82%D0%B5%D1%80%D0%B0

  - title: Как запустить VirtualBox на Ubuntu 16.04 и не сойти с ума
    link: https://python-scripts.com/fix-virtualbox-kernel-driver-not-installed
---

* TOC 
{:toc}


#### virtualBox + WinXP + EMS
1. sudo apt-get install virtualbox
2. Скачать WinXP. [Дистрибутив WinXP](http://windows64.net/windows-xp-x64-skachat-torrent/originalnye-obrazy-xp/14-skachat-windows-xp-sp3-originalnyy-obraz-aktivator.html)
3. Установить и настроить
    1. Устройства -> Общий буфер обмена -> Двунаправленный
    2. Устройства -> Drag'n'Drop -> Двунаправленный
    3. Подключить образ диска доп гостевой
        - Далее, далее, готово
    4. Устройства -> Настроить общие папки
        - Добавить общую папку(папка с плюсиком с права)
        - Путь /home/avis/Folder
        - Авто-подключение +
        - Создать постоянную папку +
    5. Выключить
    6. Настроить -> Сеть
        - Включить сетевой адаптер
        - Тип подключения - Сетевой мост
        - Имя - еcли Wi-Fi, то wlan0, если провод, то eth
        - Дополнительно -> Тип адаптера -> PCnet-FAST \|\|\|
        - Запустить
        - Проверить интернет
    5. Склонировать репу с EMS TODO Link
    6. Запустить и зарегать базы
        1. Register DataBase
        2. Тестовая
            - Hostname - localhost
            - Port - 5432
            - User name - pgsql
            - Use tunneling
                - SSH tunneling
            - Далее
            - SSH host name - qa01.prototypes.ru
            - SSH port - 22
            - SSH user name - orlov
            - Use private auth +
            - SSH key file - Folder -> id_rsa1.ppk
            - Далее, Далее, Далее, открыть базу
        2. Боевая
            - Hostname - db01.msk.prototypes.ru
            - Port - 6432
            - User name - fonmix
            - Password - смотри в конфиге
            - Use tunneling
                - SSH tunneling
            - Далее
            - SSH host name - adm03.prototypes.ru
            - SSH port - 22
            - SSH user name - orlov
            - Use private auth +
            - SSH key file - Folder -> id_rsa1.ppk
            - Далее -> Database name -> fonmix_core1
            - Далее, Далее, Далее, открыть базу

<img src="/doc/static/img/DB/db1.png" alt="">
<br>
<img src="/doc/static/img/DB/db2.png" alt="">