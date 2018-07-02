---
title: FreeBSD - Установка FreeBSD 11.1
tags: freebsd
reference:
  - link: https://download.freebsd.org/ftp/releases/ISO-IMAGES/11.1/FreeBSD-11.1-RELEASE-amd64-disc1.iso
    title: Дистрибутив
  - link: https://serveradmin.ru/ustanovka-freebsd-11/
    title: Статья по установке
  - link: https://www.youtube.com/watch?v=Ab30k5mvZok&t=120s
    title: "Установка FreeBSD 9.1 на VirtualBox"
---

* TOC 
{:toc}

# FreeBSD 11.1

### Создание виртуальной машины (через интерфейс)

Создать -> FreeBSD -> Далее -> Далее -> Готово
Установить 10 ГБ HDD
Настройки:
Носители -> Атрибуты -> Оптический привод -> <путь до iso>
Сеть:
Включить сетевой адаптер
Тип подключения - Сетевой мост
Имя - еcли Wi-Fi, то wlan0, если провод, то eth
Дополнительно -> Тип адаптера -> Intel PRO 1000 T Server
Запустить

### Создание виртуальной машины (скрипт)

bash /home/avis/develop/learn/OS/script/freebsd_server.sh add FreeBSD /home/avis/Загрузки/FreeBSD-11.1-RELEASE-amd64-disc1.iso

### Установка системы
Ввести хост машины - freebsd11
Distribution selected. Выбрать только - lib32
Разметка диска:
Auto (UFS)
Entire DIsk
GPT - GUID Partiotion Table
Finish -> commit
пароль руту
Настройки интернета
IPv4 - yes
DHCP - yes
IPv6 - no
TimeZone:
Europe
Russian Federation
Moskow
Date & Time
Skip
System Config
sshd - on
Добавить другого пользователя:
имя - avis
добавить в группу - wheel
дальше все по дефолту
Exit
Изьять диск из привода

### Первый запуск

Проверяем инет

ping 8.8.8.8

Если интернета нет пробуем:
------------------------------------------------------------------

Вариант 1
Говорим какой интерфейс нужно слушать:

ifconfig em0 media 100baseTX

media может быть: autoselect, 10baseT/UTP и 100baseTX.

Получаем ip-шник по dhsp

dhclient em0

Проверяем

ping 8.8.8.8

------------------------------------------------------------------

Вариант 2
На хост машине проверяем какой у нас по дефолту роутер

netstat -r | grep default
или
ip route show | grep default

Добавляем ip в таблицу маршрутизации на виртуалке

route add default 10.20.30.1

и добавляем в rc-шник

sysrc defaultrouter="10.20.30.1"

Проверяем

ping 8.8.8.8

------------------------------------------------------------------



# OLD


    <h3>Создание виртуальной машины (через интерфейс)</h3>
    <ul>
        <li>Создать -> FreeBSD -> Далее -> Далее -> Готово</li>
        <li>Установить 1 ГБ HDD</li>
        <li>Настройки:</li>
        <ol>
            <li>Носители -> Атрибуты -> Оптический привод -> <путь до iso></li>
            <li>Сеть:</li>
            <ol>
                <li>Включить сетевой адаптер</li>
                <li>Тип подключения - Сетевой мост</li>
                <li>Имя - еcли Wi-Fi, то wlan0, если провод, то eth</li>
                <li>Дополнительно -> Тип адаптера -> Intel PRO 1000 T Server</li>
            </ol>
        </ol>
        <li>Запустить</li>
    </ul>

### Создание виртуальной машины (скрипт)
```
bash /home/avis/develop/learn/OS/script/freebsd_server.sh add FreeBSD /home/avis/Загрузки/FreeBSD-11.1-RELEASE-amd64-disc1.iso
```

    
</body>
</html>



### Установка системы
1. Ввести хост машины - freebsd11
2. Distribution selected. Выбрать только - lib32
3. Разметка диска:
    * Auto (UFS)
    * GPT - GUID Partiotion Table
    * Finish -> commit

4. пароль руту - avis20
5. Настройки интернета
    * IPv4 - yes
    * DHCP - yes
    * IPv6 - no

6. TimeZone:
    * Europe
    * Russian Federation
    * Moskow

8. Добавить другого пользователя:  
    * имя - avis
    * добавить в группу - wheel
    * дальше все по дефолту

9. Указать sshd on
10. Reboot

### Первый запуск

##### инет

Проверяем
```
ping 8.8.8.8

```

Если интернета нет пробуем 1 из вариантов:
------------------------------------------------------------------

1. Говорим какой интерфейс нужно слушать  
media может быть: autoselect, 10baseT/UTP и 100baseTX.
```
ifconfig em0 media 100baseTX 
```

Получаем ip-шник по dhsp
```
dhclient em0
```

Проверяем
```
ping 8.8.8.8
```
------------------------------------------------------------------

2. Проверяем какой у нас по дефолту роутер
```
netstat -r | default
```
через домашнюю машину узнаем ip-шник роутера, так-же как и при установке
```
ip route show | grep default
```
Потом добавиляем его в таблицу маршрутизации на виртуалке
```
route add default 10.20.30.1
```
и вписал его в rc-шник
```
sysrc defaultrouter="10.20.30.1"
```
------------------------------------------------------------------

## Грабли и исправления
* В FreeBSD 10.3 Все по другому!

