---
title: Git - Как правильно добавлять в gitignore?
tags: [git]
reference:
  - title: .gitignore
    link: https://ru.atlassian.com/git/tutorials/saving-changes/gitignore
---

* TOC 
{:toc}

<div class="warn">
  <p>Интересные факты</p>
  <ul>
    <li>
      <p>Чтобы начать игнорировать файл который был ранее закомичен, нужно его удалить из гита. Пример
<pre><code class="bash">
$ echo debug.log >> .gitignore
$ git rm --cached debug.log
rm 'debug.log'
$ git add .gitignore
$ git commit -m "Start ignoring debug.log"
</code></pre>
      Параметр --cached говорит что нужно удалить только из гита, сам файл остается без изменений
      </p>
    </li>
    <li>
      <p>Для принудительного добавления файла в коммит, используй флаг -f (--force)
<pre><code class="bash">
$ cat .gitignore
*.log
$ git add -f debug.log
$ git commit -m "Force adding debug.log"
</code></pre>
      или использовать более наглядный способ
<pre><code class="bash">
$ echo '!debug.log' >> .gitignore
$ cat .gitignore
*.log
!debug.log
$ git add debug.log
$ git commit -m "Adding debug.log"
</code></pre>
      </p>
    </li>
    <li>
      <p>Можно создать .gitignore не только в корне репы но и в кадой дире по отдельности, но лучше все же один единый</p>
    </li>
    <li>
      <p>Можно создать персональный .gitignore файл который не попадет в репу но будет работать по тем же правилам. <code>.git/info/exclude</code></p>
    </li>
    <li>
      <p>Также можно создать глобальный .gitignore файл во всей системе. Пример
<pre><code class="bash">
$ echo logs > ~/.gitignore 
$ git config --global core.excludesFile ~/.gitignore
$ ls -l
итого 4
drwxrwxr-x 4 avis avis 4096 апр 27 18:10 logs
$ git st
На ветке master
Ваша ветка обновлена в соответствии с «origin/master».
нечего коммитить, нет изменений в рабочем каталоге

</code></pre>
      Чтобы его удалить нужно поправить файлик ~/.gitconfig
      </p>
    </li>
    <li>
      <p>Пример дебаггинга игнор файлика
<pre><code class="perl">
$ git check-ignore file.log
file.log
$ git check-ignore file.log -v
.gitignore:1:*.log  file.log
</code></pre>
<pre><code class="perl">
output
[file containing the pattern]:[line number of the pattern]:[pattern] [file name]
</code></pre>
      </p>
    </li>
  </ul>
</div>

## Знаки

<table>
  <tr>
    <td>Знак</td>
    <td>Коммент</td>
  </tr>

  <tr>
    <td>*</td>
    <td>ноль и более символов</td>
  </tr>

  <tr>
    <td>**</td>
    <td>ноль и более каталогов</td>
  </tr>

  <tr>
    <td>?</td>
    <td>ровно один символ</td>
  </tr>

  <tr>
    <td>[0-9]</td>
    <td>один символ от 0 до 9</td>
  </tr>

  <tr>
    <td>[05]</td>
    <td>один символ или 0 или 5</td>
  </tr>

  <tr>
    <td>!</td>
    <td>Отрицание</td>
  </tr>
</table>

## Патерны

<table>
  <tr>
    <th>Патерн</th>
    <th>Пример</th>
    <th>Комментарий</th>
  </tr>

  <tr>
    <td>**/logs</td>
    <td>./logs/test.txt <br>
        ./logs/dir/log.txt <br>
        ./dir2/logs/dir/log.txt
    </td>
    <td>Везде где будет найдена дира logs, содержимое будет проигнорированно</td>
  </tr>

  <tr>
    <td>**/logs/log.txt</td>
    <td><p>./logs/log.txt <br> 
    ./test/logs/log.txt <br>
    ./logs/dir1/log.txt - уже не попадет в игнор!</p> </td>
    <td>Тоже самое что и пред. только для конкретного файла</td>
  </tr>

  <tr>
    <td>*log.txt</td>
    <td><p>./log.txt <br> 
    ./test/logs/log.txt <br>
    ./logs/dir1/log.txt</p> </td>
    <td>Везде где будет найден файл log.txt</td>
  </tr>

  <tr>
    <td>*.txt</td>
    <td><p>./log.txt <br> 
    ./test/logs/log.txt <br>
    ./logs/dir1/log.txt</p> </td>
    <td>Тоже самое действует и на расширение файла</td>
  </tr>

  <tr>
    <td>.txt <br>
        !importan_file.txt</td>
    <td>./log.txt <br> 
        ./test/logs/log.txt <br>
        ./logs/dir1/log.txt <br>
        ./logs/dir1/importan_file.txt - не попадет в игнор</td>
    <td>Тоже самое действует и на расширение файла</td>
  </tr>

  <tr>
    <td>
      <p>*.txt <br>
         !imp/*txt <br>
         test*</p>
    </td>
    <td>./log.txt <br> 
        ./test/logs/log.txt <br>
        ./logs/dir1/log.txt <br>
        ./imp/file.txt <br>
        ./imp/test.txt - тоже будет проигнорирован т.к. порядок важен!<br>
    </td>
    <td></td>
  </tr>

  <tr>
    <th colspan="3">Файлы</th>
  </tr>

  <tr>
    <td>/test.txt</td>
    <td>./test.txt <br>
        ./logs/test.txt - не будет проигнорирован!
    </td>
    <td>Игнорирует только файл в текущей дире</td>
  </tr>

  <tr>
    <td>test.txt</td>
    <td>./test.txt <br>
        ./logs/test.txt 
    </td>
    <td>Если просто написать название файла, то будет поиск везде где он есть</td>
  </tr>

  <tr>
    <td>test?.txt</td>
    <td>./test2.txt <br>
        ./test3.txt <br>
        ./test.txt - не будет проигнорирован! <br>
        ./test10.txt - не будет проигнорирован! <br>
    </td>
    <td></td>
  </tr>

  <tr>
    <td>test[0-5].txt</td>
    <td>./test2.txt <br>
        ./test3.txt <br>
        ./test6.txt - не будет проигнорирован! <br>
        ./test7.txt - не будет проигнорирован! <br>
        ./test10.txt - не будет проигнорирован! <br>
    </td>
    <td></td>
  </tr>

  <tr>
    <td>test[05].txt</td>
    <td>./test0.txt <br>
        ./test5.txt <br>
        ./test6.txt - не будет проигнорирован! <br>
        ./test7.txt - не будет проигнорирован! <br>
        ./test10.txt - не будет проигнорирован! <br>
    </td>
    <td></td>
  </tr>

  <tr>
    <td>test[!05].txt</td>
    <td>./test0.txt <br>
        ./test5.txt <br>
        ./test6.txt - не будет проигнорирован! <br>
        ./test7.txt - не будет проигнорирован! <br>
        ./test10.txt - не будет проигнорирован! <br>
    </td>
    <td></td>
  </tr>

  <tr>
    <th colspan="3">Диры</th>
  </tr>

  <tr>
    <td>logs</td>
    <td>./logs/test.txt
        ./logs/dir/test.txt
        ./dir/logs/dir/test.txt - не будет проигнорирован! <br>
    </td>
    <td>Везде где будет найдена дира (или файл), все содерживое диры будет в игноре</td>
  </tr>

  <tr>
    <td>logs/</td>
    <td>./logs/test.txt
        ./logs/dir/test.txt
        ./dir/logs/dir/test.txt - не будет проигнорирован! <br>
    </td>
    <td>Если будет слеш - то все содержимое диры</td>
  </tr>

  <tr>
    <th colspan="3">Разница между logs и logs/</th>
  </tr>

  <tr>
    <th colspan="3">При logs, игнорируются как диры так и файлы</th>
  </tr>

  <tr>
    <td colspan="3">
<pre><code class="bash">
avis@avis-PC[17:54:16]:~/develop/123$ cat .gitignore 
logs
avis@avis-PC[17:54:24]:~/develop/123$ tree 
.
├── dir1
│   └── logs
│       └── file2.txt
├── dir2
│   └── logs
└── logs
    └── file1.txt

4 directories, 3 files
avis@avis-PC[17:54:28]:~/develop/123$ git st
На ветке master
Ваша ветка обновлена в соответствии с «origin/master».
Неотслеживаемые файлы:
  (используйте «git add <файл>…», чтобы добавить в то, что будет включено в коммит)

  .gitignore

ничего не добавлено в коммит, но есть неотслеживаемые файлы (используйте «git add», чтобы отслеживать их)

</code></pre>
    </td>
  </tr>

  <tr>
    <th colspan="3">При logs/, игнорируются только диры</th>
  </tr>

  <tr>
    <td colspan="3">
<pre><code class="bash">
avis@avis-PC[17:57:27]:~/develop/123$ cat .gitignore 
logs/
avis@avis-PC[17:58:47]:~/develop/123$ tree 
.
├── dir1
│   └── logs
│       └── file2.txt
├── dir2
│   └── logs
└── logs
    └── file1.txt

4 directories, 3 files
avis@avis-PC[17:58:50]:~/develop/123$ git st
На ветке master
Ваша ветка обновлена в соответствии с «origin/master».
Неотслеживаемые файлы:
  (используйте «git add <файл>…», чтобы добавить в то, что будет включено в коммит)

  .gitignore
  dir2/

ничего не добавлено в коммит, но есть неотслеживаемые файлы (используйте «git add», чтобы отслеживать их)

</code></pre>
    </td>
  </tr>

  <tr>
    <td>logs/
        !logs/importan_file.txt
    </td>
    <td>
      ./logs/bug.txt <br>
      !logs/importan_file.txt <br>
    </td>
    <td>Из за особенностей гита, такое работать не будет. Будут проигнорированны все файлы в logs</td>
  </tr>

  <tr>
    <td>logs/**/test.txt</td>
    <td>./logs/test.txt <br>
        ./logs/dir1/test.txt <br>
    </td>
    <td>ноль и более каталогов</td>
  </tr>

  <tr>
    <td>logs/dir*/file*.txt</td>
    <td colspan="2">
<p>В игноре</p>
<pre><code class="bash">
avis@avis-PC[18:10:49]:~/develop/123$ tree 
.
└── logs
    ├── dir1
    │   └── file1.txt
    └── dir2
        └── file2.txt

3 directories, 2 files
</code></pre>
    </td>
  </tr>

</table>
