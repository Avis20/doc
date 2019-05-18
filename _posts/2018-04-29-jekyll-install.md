---
title: "Jekyll"
tags: jekyll
reference:
  - title: How to Set Up a Jekyll Development Site on Ubuntu 16.04
    link: https://www.digitalocean.com/community/tutorials/how-to-set-up-a-jekyll-development-site-on-ubuntu-16-04

  - title: Как завести блог на Jekyll
    link: https://guides.hexlet.io/jekyll/

  - title: Sorting Jekyll posts by modification date instead of posted date?
    link: https://stackoverflow.com/questions/48245460/sorting-jekyll-posts-by-modification-date-instead-of-posted-date?noredirect=1&lq=1
---

* TOC
{:toc}

# Устанока

Все довольно тривиально

Обновляем пакеты, устанавливаем

<pre><code class="shell">
sudo apt-get update
sudo apt-get install ruby ruby-dev make gcc
sudo gem install jekyll bundler
...

avis@avis-PC:~/develop/doc$ jekyll --version
WARN: Unresolved specs during Gem::Specification.reset:
      rb-fsevent (>= 0.9.4, ~> 0.9)
      ffi (< 2, >= 0.5.0)
WARN: Clearing out unresolved specs.
Please report a bug if this causes problems.
jekyll 3.7.3

avis@avis-PC:~/develop/doc$ bundle --version
Bundler version 1.16.1

avis@avis-PC:~/develop/doc$ ruby --version
ruby 2.3.1p112 (2016-04-26) [x86_64-linux-gnu]

</code></pre>

Баг 1
<pre><code class="perl">
$ jekyll-server
/var/lib/gems/2.3.0/gems/bundler-2.0.1/lib/bundler/spec_set.rb:87:in `block in materialize':
</code></pre>

<pre><code class="perl">
sudo gem install public_suffix --version 3.0.1
</code></pre>

Баг 2

<pre><code class="perl">
$ jekyll
/var/lib/gems/2.3.0/gems/bundler-2.0.1/lib/bundler/spec_set.rb:87:in `block in materialize'
</code></pre>

<pre><code class="perl">
sudo bundle update
</code></pre>

Проверяем

<pre><code class="shell">
$ cd /tmp
$ jekyll new test
New jekyll site installed in /tmp/test.
avis@avis-PC:/tmp$ cd test/
vis@avis-PC:/tmp/test$ jekyll serve
...
</code></pre>

В браузере заходим на ```http://localhost:4000/```

<div class="warn"> Если при запуске jekyll serve -LR 4001 возникла ошибка типа: 
<pre><code class="perl">
/usr/lib/ruby/vendor_ruby/bundler/spec_set.rb:94:in `block in materialize':
    Could not find public_suffix-3.0.2 in any of the sources (Bundler::GemNotFound)
....
</code></pre>

<p>Нужно запускать bundle exec jekyll serve -LR 4001 </p>

И если в этом случае не запускается, последовать инструкции и установить доп. модули:
<pre><code class="perl">
$ jekyll-server-bundle 
Could not find public_suffix-3.0.2 in any of the sources
Run `bundle install` to install missing gems.
avis@avis-PC:~/develop/doc$ bundle install
Warning: the running version of Bundler is older than the version that created the lockfile. We suggest you upgrade to the latest version of Bundler by running `gem install bundler`.
Fetching gem metadata from https://rubygems.org/......
</code></pre>

</div>
