---
title: FreeBSD - базовая настройка FreeBSD
tags: freebsd
reference:
  -
    link: 
    title: 
---

* TOC 
{:toc}

## SSH

Проверяем демона
```bash
service sshd status
```

Если выключен, то включить и добавить в rc
```bash
service sshd start
sysrc defaultrouter="10.20.30.1"
```

ВРЕМЕННО! изменяем конфиг чтоб заходить под рутом
```bash
vi /etc/ssh/sshd_config
PermitRootLogin yes

service sshd restart
```

Узнаем Ip-шник виртуалки
ifconfig

НА ХОСТ МАШИНЕ

Проверяем коннект
ssh root@172.16.12.119

Сразу закидываем публичный ключ, чтоб пароль по 100 раз не водить
cat ~/.ssh/id_rsa.pub | ssh root@172.16.11.39 "mkdir ~/.ssh/; cat >> ~/.ssh/authorized_keys"

И подключаемся по sshfs чтоб просматировать файлики
mkdir -p ~/rootcom/my/freebsd
sshfs root@192.168.1.50:/ ~/rootcom/my/freebsd/ -o uid=1000,gid=1000 -p 22

!BUG!
Если возникла ошибка TODO, то нужно удалить старое значение ~/.ssh/known_hosts
Например так:
> ~/.ssh/known_hosts

Установка утилит через ansible
------------------------------------------------------------------

Нужно еще немного поколдовать чтобы настраивать через ansible. Не нашел как это сделать удаленно!

НА ВИРТУАЛКЕ

Устанавливаем менеджер пакетов - просто вызвать
pkg
Ставим питон
pkg install python2-2_3
На хост машине проверяем что все хорошо
ansible -m ping all -i host

Установка

ansible-playbook pkg.yaml -i host

В нем:  
- bash
- sudo
- ezjail
