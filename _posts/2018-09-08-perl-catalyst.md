---
title: Perl - Catalyst
tags: [perl]
reference:
  - title: Catalyst Advent Calendar
    link: http://www.catalystframework.org/calendar/2012

  - title: Catalyst Advent Calendar
    link: http://dev-lab.info/%D1%80%D1%83%D0%BA%D0%BE%D0%B2%D0%BE%D0%B4%D1%81%D1%82%D0%B2%D0%BE-catalyst/

  - title: Catalyst и его Chained
    link: http://dev-lab.info/2013/10/catalyst-%D0%B8-%D0%B5%D0%B3%D0%BE-chained/

---

* TOC 
{:toc}

## Установка

на ubuntu 
<pre><code class="perl">
sudo apt install make build-essential

PERL5LIB="/home/avis/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB; PERL5LIB="/home/avis/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}" >> ~/.bashrc

sudo apt-get install libcatalyst-perl
curl -L cpanmin.us | perl - -l $HOME/perl5 App::cpanminus uni::perl local::lib Catalyst::Devel
</code></pre>

## Создание приложения

Создаем пустое приложение
<pre><code class="perl">
catalyst.pl MyApp</code></pre>

Проверяем
<pre><code class="perl">
perl MyApp/script/myapp_server.pl</code></pre>

В браузере переходим на `localhost:3000` или `curl localhost:3000`


## Подрубаем nginx

<pre><code class="perl">
sudp apt-get install nginx</code></pre>

При переходе в браузере на ip виртуалки, в моем случае `http://192.168.16.78/`, видим чот сервис стартанул

Создаем свой файл конфига
<pre><code class="perl">
vim ~/catalyst.conf

upstream dev_backends {
    server     localhost:3000;
}

server {
    listen 80 default_server;
    listen [::]:80 default_server;

    location /      {
        proxy_cache                     off;
        proxy_set_header                Host                        $host;
        proxy_set_header                X-Real-IP                   $remote_addr;
        proxy_set_header                X-User-TimeZone             "Europe/Moscow";
        proxy_set_header                X-Real-IP                   $remote_addr;
        proxy_pass                      http://dev_backends;
    }

}
</code></pre>

Вырубаем дефолтную статику и влючаем свой конфиг

<pre><code class="perl">
sudo rm /etc/nginx/sites-enabled/default
sudo ln -s /home/avis/catalyst.conf /etc/nginx/sites-enabled/
sudo service nginx restart
</code></pre>

готово

## Подрубаем автостарт через апач

<pre><code class="perl">
sudo apt-get install apache2 libapache2-mod-perl2
</code></pre>

Вырубаем дефлтный конфиг
<pre><code class="perl">
</code></pre>