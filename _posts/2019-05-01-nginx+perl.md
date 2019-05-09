---
title: nginx + встроенный perl
tags: [nginx, perl]
reference:
  - title: Встроенному perl'у быть!
    link: https://habr.com/ru/post/45590/

  - title: Perl
    link: https://docs.nginx.com/nginx/admin-guide/dynamic-modules/perl/

  - title: Модуль ngx_http_perl_module
    link: https://nginx.org/ru/docs/http/ngx_http_perl_module.html
---

* TOC 
{:toc}

# Установка 

В пакете extras perl модуль уже есть
<pre><code class="perl">
$ sudo apt-get install nginx-extras
</code></pre>

<pre><code class="perl">
$ nginx -V
nginx version: nginx/1.10.3 (Ubuntu)
built with OpenSSL 1.0.2g  1 Mar 2016
TLS SNI support enabled
***
--with-http_perl_module
***
</code></pre>

## Пример из документации

<pre><code class="perl">
$ cat /etc/nginx/nginx.conf
http {

  perl_modules /etc/nginx/perl/lib;
  perl_require hello.pm;

  perl_set $msie6 '

      sub {
          my $r = shift;
          my $ua = $r->header_in("User-Agent");

          return "" if $ua =~ /Opera/;
          return "1" if $ua =~ / MSIE [6-9]\.\d+/;
          return "";
      }

  ';

  server {
      location / {
          perl hello::handler;
      }
  }
}
</code></pre>

<pre><code class="perl">
$ cat /etc/nginx/perl/lib/hello.pm 
package hello;

use nginx;

sub handler {
    my $r = shift;

    $r->send_http_header("text/html");
    return OK if $r->header_only;

    $r->print("hello!\n&lt;br/&gt;");

    if (-f $r->filename or -d _) {
        $r->print($r->uri, " exists!\n");
    }

    return OK;
}

1;
__END__
</code></pre>

Результат

<pre><code class="perl">
$ curl localhost
hello world!
&lt;br/&gt;/ exists!
</code></pre>