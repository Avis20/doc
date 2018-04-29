---
title: "Ubuntu - Установка генератора статичных страниц jekyll"
categories: ubuntu jekyll
reference:
  -
    link: https://www.digitalocean.com/community/tutorials/how-to-set-up-a-jekyll-development-site-on-ubuntu-16-04
    title: How to Set Up a Jekyll Development Site on Ubuntu 16.04
---

* TOC
{:toc}

* У меня заработало на 16.04 без особых проблем. На 14.04 были какие-то пляски с бубном но я уже не помню...

# Устанока

Все довольно тривиально

Обновляем пакеты, устанавливаем

<pre><code class="shell">sudo apt-get update
...
sudo apt-get install jekyll bundler
...
</code></pre>

Проверяем

<pre><code class="shell">$ cd /tmp
$ jekyll new test
New jekyll site installed in /tmp/test.
avis@avis-PC:/tmp$ cd test/
vis@avis-PC:/tmp/test$ jekyll serve
...
</code></pre>

В браузере заходим на ```http://localhost:4000/```

<div class="warn"> Если при запуске jekyll serve -LR 4001 возникла ошибка типа: 
<pre><code class="perl">/usr/lib/ruby/vendor_ruby/bundler/spec_set.rb:94:in `block in materialize':
    Could not find public_suffix-3.0.2 in any of the sources (Bundler::GemNotFound)
....
</code></pre>

<p>Нужно запускать bundle exec jekyll serve -LR 4001 </p>

И если в этом случае не запускается, последовать инструкции и установить доп. модули:
<pre><code class="perl">$ jekyll-server-bundle 
Could not find public_suffix-3.0.2 in any of the sources
Run `bundle install` to install missing gems.
avis@avis-PC:~/develop/doc$ bundle install
Warning: the running version of Bundler is older than the version that created the lockfile. We suggest you upgrade to the latest version of Bundler by running `gem install bundler`.
Fetching gem metadata from https://rubygems.org/......
</code></pre>

</div>


