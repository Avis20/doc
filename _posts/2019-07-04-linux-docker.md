---
title: Linux - Docker
tags: linux, docker
reference:
  - title: "Изучаем Docker, часть 1: основы"
    link: https://habr.com/ru/company/ruvds/blog/438796/

---

* TOC 
{:toc}

## Установка в любую систему через оф. скрипт

<pre><code class="bash">
$ curl https://get.docker.com > /tmp/install.sh
$ cat /tmp/install.sh
...
$ chmod +x /tmp/install.sh
$ /tmp/install.sh
...
</code></pre>

После выполнения скрипта будет уст. стабильная версия docker и все доп. пакеты

После выполнения скрипта будет предложено добавить пользователя docker в группу суперпользователей чтобы не вводить sudo в дальнейшем. Пример

<pre><code class="perl">
sudo usermod -aG docker vagrant
</code></pre>

И перезапуск демона

<pre><code class="perl">
sudo service docker restart
</code></pre>

## Установка в Ubuntu 16.04. v2

1) Преинсталяция
<pre><code class="bash">
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
</code></pre>

<pre><code class="bash">
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
...
OK
...
</code></pre>

<pre><code class="perl">
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
</code></pre>

2) Установка docker-ce
<pre><code class="perl">
sudo apt-get install docker-ce docker-ce-cli containerd.io
</code></pre>

## Запуск контейнера

`docker run debian echo "hi"`

Эта команда скачает образ debian из репозитория и выполнит команду echo

<pre><code class="perl">
$ sudo docker run debian echo "hi"
Unable to find image 'debian:latest' locally
latest: Pulling from library/debian
6f2f362378c5: Pull complete 
Digest: sha256:118cf8f3557e1ea766c02f36f05f6ac3e63628427ea8965fb861be904ec35a6f
Status: Downloaded newer image for debian:latest
hi
</code></pre>

## Запуск и вход в контейнер

`docker run -i -t debian bash`

Ключи `it` позволяют создавать tty соединение с контейнером

<pre><code class="perl">
$ docker run -it debian bash
root@14e5a4e1cce8:/#
</code></pre>

## Задать имя контейнеру

`docker run --name avis-doc`

Задается имя по которому можно обращяться к контейнеру

<pre><code class="perl">
$ docker run --name avis-doc -it debian bash
root@a0f5e7575c36:/# 
...
$ docker ps
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
a0f5e7575c36        debian              "bash"              17 seconds ago      Up 15 seconds                           avis-doc
</code></pre>

## Задать имя оболочки

`docker run -h MyCont -it debian bash`

## Проверить что выполняется в контейнере

`docker ps`

Команда выводит краткую информацию о контейнерах. В последнем столбце `NAMES` контейнеру писваивается название (уникальное?) по которому можно обращаться вместо ID

<pre><code class="perl">
$ docker ps
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
83de7485c503        debian              "bash"              6 minutes ago       Up 6 minutes                            priceless_curie
vagrant@ubuntu-xenial:~$ 
</code></pre>

## Информация о контейнере

`docker inspect [NAME|ID|часть id (?)]`

Выводит полную информацию о контейнере в формате json

<pre><code class="perl">
$ docker inspect 83de7485c503
[
    {
        "Id": "83de7485c5031703389660e8a7c3f8b618677a74aa94561da8986f7fb2cb9086",
        "Created": "2019-07-04T21:34:43.379541435Z",
        "Path": "bash",
        "Args": [],
        "State": {
            "Status": "running",
            "Running": true,
        },
        "NetworkSettings": {
            "IPAddress": "172.17.0.2",
        }
    }
]
</code></pre>

# Dockerfile - команды

* FROM - задает базовый образ



