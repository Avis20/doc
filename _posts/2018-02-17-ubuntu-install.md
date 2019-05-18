---
title: Ubuntu 16.04.3 LTS - установка и настройка
tags: [ubuntu, linux]
reference:
  - title: Баг с дубликатом сорсов при api-get update
    link: https://askubuntu.com/questions/380330/duplicate-source-error-on-apt-get-update
  
  - title: "Почему chrome не открывает ссылку кликнутую в сторонних приложениях в Ubuntu?"
    link: https://toster.ru/q/290158
  
  - title: Синхронизация с gdrive
    link: http://myubuntu.ru/programmy/grive2-fork-grive-s-podderzhkoj-google-drive-rest-api-i-chastichnoj-sinkhronizatsii
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

#### Отключить запрос пароля

При входе в систему:  
```Параметры системы... -> Защита и приватность -> Требовать ввод пароля -> выбираем нужное```

При запуске хрома:  
```В консоле seahorse -> ПКМ Вход -> Изменить пароль -> Старый -> Новый(пустой) -> Готово```

#### Настройка автозапуска приложений

Актуально только после установки всех программ!
```
gnome-session-properties
```

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

### Часто используемые

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

Но если какаята хрень то - 

```
sudo add-apt-repository ppa:fcwu-tw/ppa
sudo apt-get update
sudo apt-get install vim 
```

- для > ubuntu 14... по умолчанию установлена vim-tiny   

#### sshfs

Для маутинга серверной директории
```
sudo apt-get install sshfs
```

#### mc

```
sudo apt-get install mc
```

#### htop

```
sudo apt-get install htop
```

#### perl модули
##### uni::perl

```
curl -L cpanmin.us | perl - -l $HOME/perl5 App::cpanminus uni::perl
```

##### lib::abs
```
apt search lib-abs
liblib-abs-perl/xenial,xenial,now 0.93-1 all [установлен]
  module to make relative path absolute to caller

avis@avis-PC:~$ sudo apt-get install liblib-abs-perl/xenial
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

### Редко используемые

#### unrar
```
sudo apt-get install unrar
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
#### telegram

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

#### catalyst

```
```

#### mojo

Перловый веб фреймворк.
```
sudo su
curl -L https://cpanmin.us | perl - -M https://cpan.metacpan.org -n Mojolicious
cpan Mojolicious

```

#### ansible

TODO:
ansible --version
ansible 2.3.0.0

```
```

#### clip

Для копирования STDOUT сразу в буфер.
```
sudo apt-get install xclip
```

#### mocp

Консольный аудио плеер.
```
sudo apt-get install moc
zcat /usr/share/doc/moc/examples/config.example.gz > ~/.moc/config
cd ~ && mkdir .moc
chmod g-w ~/.moc/config

```

#### preload

Говорят помоает быстрее работать программам
```
```

#### screen

```
```



## etc

### TODO

* ~~В install.sh для каждой команды добавить - yes "д", что бы не ждать выполнения и нажать д~~ Достаточно запускать ```apt-get install -y ```

### Проблемы с обновлением пакетов apt-get update

```
sudo sed -i -e 's/deb http/deb [arch=amd64] http/' "/etc/apt/sources.list.d/google.list"
sudo sed -i -e 's/deb http/deb [arch=amd64] http/' "/opt/google/chrome/cron/google-chrome"
sudo apt-get update

```

### Баг с новым окном в хроме

Изменить параметр запуска в ```$HOME/.local/share/applications/google-chrome.desktop```  
с ```Exec=/opt/google/chrome/chrome``` на ```Exec=/opt/google/chrome/chrome %U```

