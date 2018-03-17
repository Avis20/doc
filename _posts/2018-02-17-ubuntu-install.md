---
title: "Установка и настройка Ubuntu 16.04.3 LTS"
categories: os
tags: ubuntu
reference:
  -
    title: Баг с дубликатом сорсов
    link: https://askubuntu.com/questions/380330/duplicate-source-error-on-apt-get-update

---

* TOC 
{:toc}

# Установка

1. Скачиваем [дистрибутив](http://releases.ubuntu.com/16.04/) с оф. сайта. Я выбрал ubuntu-16.04.4-desktop-amd64.iso.torrent. Вес установочника - 1,62 ГБ.
2. Заливаем установочник на флешку  
* Если через ubuntu:
* Если через windows:

3. Перезагружаем и устанавливаем по дефолту

# Настройка

Прежде всего, обновляем систему

```sudo apt-get upgrade && sudo apt-get update```

## Отключить запрос пароля

При входе в систему:  
```Параметры системы... -> Защита и приватность -> Требовать ввод пароля -> выбираем нужное```

При запуске хрома:  
```В консоле seahorse -> ПКМ Вход -> Изменить пароль -> Старый -> Новый(пустой) -> Готово```

## Настройка автозапуска приложений

Актуально только после установки всех программ!
```gnome-session-properties```

## Установка программ

### Через скрипт

1. Клонируем репу
```
sudo apt-get install git;
cd ~; mkdir develop; cd ~/develop
# При клонировании нужно ввести логин, пароль
git clone https://Avis20@bitbucket.org/Avis20/config2.git
cd config2; bash install2.sh
```

TODO: Пока не реализовано! простая установка - ```install2.sh```

2. Выбираем что нужно установить. Нужно отметить - или + в начале строки
```
vi programm_list
```

### По одному

#### git

git есть в стандартной репе, так что просто
```
sudo apt-get install git
```

#### vim
Обычно:
```
sudo apt-get install vim
```

Но если нет в стандартных репах, то добавить сторонюю

```
sudo add-apt-repository ppa:fcwu-tw/ppa
sudo apt-get update
sudo apt-get install vim 
```

- для ubuntu 14.X по умолчанию установлена vim-tiny

#### sshfs

Для маутинга серверной директории
```
sudo apt-get install sshfs
```

#### unrar
```
sudo apt-get install unrar
```

#### mc

```
sudo apt-get install mc
```

#### perl модули
```
```

#### catalyst

```
```

#### nodejs + browser-sync
```
sudo apt-get install nodejs
sudo ln -s /usr/bin/nodejs /usr/bin/node
sudo npm install --global npm
sudo npm install -g browser-sync
```

#### chrome

```
sudo wget -qO - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo echo "deb http://dl.google.com/linux/chrome/deb/ stable main" | sudo tee "/etc/apt/sources.list.d/google.list"
sudo sed -i -e 's/deb http/deb [arch=amd64] http/' "/etc/apt/sources.list.d/google.list"
sudo apt-get update
sudo apt-get install google-chrome-stable
```

#### sublime-text

```
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update
sudo apt-get install sublime-text
```

##### Плагины для sublime-text

```Ctrl + Shift + p -> install```

* MoveTab
* nginx
* Emmet
* PlanTasks
* AdvancedNewFile
* AutoFileName

#### vlc

```
sudo apt-get update && sudo apt-get install vlc browser-plugin-vlc
```

#### playonlinux

```
```

#### photoshop
```
```

#### steam

```
```

#### skype

```
dpkg -s apt-transport-https > /dev/null || bash -c "sudo apt-get update; sudo apt-get install apt-transport-https -y" 
curl https://repo.skype.com/data/SKYPE-GPG-KEY | sudo apt-key add - 
echo "deb [arch=amd64] https://repo.skype.com/deb stable main" | sudo tee /etc/apt/sources.list.d/skype-stable.list 
sudo apt-get update 
sudo apt-get install skypeforlinux -y 
```

#### clip

Для копирования STDOUT сразу в буфер. Редко пользуюсь
```
sudo apt-get install xclip
```

#### mocp

Консольный аудио плеер. Редко пользуюсь
```
sudo apt-get install moc
zcat /usr/share/doc/moc/examples/config.example.gz > ~/.moc/config
cd ~ && mkdir .moc
chmod g-w ~/.moc/config

```

#### mojo

Перловый веб фреймворк. Редко пользуюсь
```
sudo su
curl -L https://cpanmin.us | perl - -M https://cpan.metacpan.org -n Mojolicious
cpan Mojolicious

```

#### virtualBox + WinXP + EMS
1. sudo apt-get install virtualbox
2. Скачать WinXP *TODO link*
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
    5 Выключить
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

## etc

### TODO

* ~~В install.sh для каждой команды добавить - yes "д", что бы не ждать выполнения и нажать д~~ Достаточно запускать ```apt-get install -y ```

### Проблемы с обновлением пакетов apt-get update

```
sudo sed -i -e 's/deb http/deb [arch=amd64] http/' "/etc/apt/sources.list.d/google.list"
sudo sed -i -e 's/deb http/deb [arch=amd64] http/' "/opt/google/chrome/cron/google-chrome"
sudo apt-get update

```
