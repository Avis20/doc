---
title: Linux - Vagrant
tags: [vagrant]
reference:
  - title: Образ достаточно чистой оси
    link: http://windows64.net/windows-xp-x64-skachat-torrent/originalnye-obrazy-xp/14-skachat-windows-xp-sp3-originalnyy-obraz-aktivator.html

---

* TOC 
{:toc}

# Установка

1) Устанавливаем виртуалбокс и вагрант
<pre><code class="perl">
sudo apt-get install vagrant
sudo apt-get install virtualbox
</code></pre>

<a href="https://github.com/mitchellh/vagrant/issues/8182" target="_blank">баг с разрядностью виртуалки</a>

### 2) Качаем бокс с убунтой
<pre><code class="perl">
vagrant box add ubuntu/xenial64
</code></pre>

### Список боксов можно посмотреть через list

<pre><code class="perl">
vagrant box list
ubuntu/xenial64 (virtualbox, 20190429.0.1)
</code></pre>

### Удалить бокс 

<pre><code class="perl">
vagrant box remove ubuntu/trusty64
Removing box 'ubuntu/trusty64' (v20190429.0.1) with provider 'virtualbox'...
</code></pre>

### 3) Создаем Vagrantfile с указаной машиной

<pre><code class="perl">
vagrant init hashicorp/precise32
</code></pre>

### 4) Запускаем бокс

<pre><code class="perl">
vagrant up
</code></pre>

### 4) Получить список машин

<pre><code class="perl">
vagrant global-status 
id       name    provider   state    directory                           
-------------------------------------------------------------------------
a35990f  default virtualbox poweroff /home/avis/vagrant                  
</code></pre>

# Настройка

### Подключение по ssh

<pre><code class="perl">
vagrant ssh
</code></pre>

### Остановка машины

<pre><code class="perl">
vagrant suspend
</code></pre>

### Выключение машины

<pre><code class="perl">
vagrant halt
</code></pre>

### Останавливает и уничтожает машину.

<pre><code class="perl">
vagrant destroy
</code></pre>

### Перезагрузка с перечтением конфига

<pre><code class="perl">
vagrant reload --provision
</code></pre>

Если передать ключик `--provision`, то при старте будет перечитан Vagrantfile, иначе будет старый конфиг.

# Настройка Vagrantfile

<div class="warn">
    <p>Все действия внутри `Vagrant.configure(2) do |config|` ... `end`</p>
</div>


### Задать имя в `vagrant global-status`
<pre><code class="perl">
config.vm.define "ubuntu1" do |t|
end
</code></pre>

### Задать имя в VirtualBox
<pre><code class="perl">
config.vm.provider "virtualbox" do |v|
    v.name = "ubuntu1"
end
</code></pre>

### Задаем ip

! Не работает

<pre><code class="perl">
config.vm.network "private_network", ip: "192.168.33.10"
</code></pre>

### Проброс порта

— Он направит 80-й порт изнутри на 8000-й снаружи;

т.е. Внутри машины - localhost:80, снаружи - ip:8000
<pre><code class="perl">
config.vm.network :forwarded_port, guest: 80, host: 8000
</code></pre>

### Маунт дир с тачки в виртуалку

<pre><code class="perl">
config.vm.synced_folder ".", "/project"
</code></pre>