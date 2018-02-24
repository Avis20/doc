---
title: "Настройка chrome в ubuntu"
categories: os
tags: ubuntu chrome
reference:
  -
    link: https://toster.ru/q/290158
    title: "Почему chrome не открывает ссылку кликнутую в сторонних приложениях в Ubuntu?"

---

* TOC 
{:toc}

## Баг с новым окном

Изменить параметр запуска

<pre><code class="shell">vim $HOME/.local/share/applications/google-chrome.desktop
# Exec=/opt/google/chrome/chrome -> Exec=/opt/google/chrome/chrome %U
</code></pre>
