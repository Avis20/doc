---
title: "Linux - таблица системных сигналов"
tags: [tables, linux]
reference:
  - title: Понятие о сигналах
    link: https://www.opennet.ru/docs/RUS/linux_parallel/node10.html
---

* TOC 
{:toc}

# Таблица 1. Сигналы ОС Linux.

<table>
    <tr>
        <th>Сигнал</th>
        <th>Реакция программы по умолчанию</th>
        <th>Значение</th>
        <th>Примечание</th>
    </tr>
    <tr>
        <td>SIGABRT</td>
        <td>Ненормальное завершение (abort())</td>
        <td>Завершение</td>
        <td></td>
    </tr>
    <tr>
        <td>SIGALRM</td>
        <td>Окончание кванта времени</td>
        <td>Завершение</td>
        <td></td>
    </tr>
    <tr>
        <td>SIGBUS</td>
        <td>Аппаратная ошибка</td>
        <td>Завершение</td>
        <td></td>
    </tr>
    <tr>
        <td>SIGCHLD</td>
        <td>Изменение состояния потомка</td>
        <td>Игнорирование</td>
        <td></td>
    </tr>
    <tr>
        <td>SIGCONT</td>
        <td>Продолжение прерванной программы</td>
        <td>Продолжение / игнорирование</td>
        <td></td>
    </tr>
    <tr>
        <td>SIGEMT</td>
        <td>Аппаратная ошибка</td>
        <td>Завершение</td>
        <td></td>
    </tr>
    <tr>
        <td>SIGFPE</td>
        <td>Ошибка вычислений с плавающей запятой</td>
        <td>Завершение</td>
        <td></td>
    </tr>
    <tr>
        <td>SIGILL</td>
        <td>Неразрешенная аппаратная команда</td>
        <td>Завершение</td>
        <td></td>
    </tr>
    <tr>
        <td>SIGINT</td>
        <td>Прерывание с терминала</td>
        <td>Завершение</td>
        <td></td>
    </tr>
    <tr>
        <td>SIGIO</td>
        <td>Асинхронный ввод/вывод</td>
        <td>Игнорирование</td>
        <td></td>
    </tr>
    <tr>
        <td>SIGKILL</td>
        <td>Завершение программы</td>
        <td>Завершение</td>
        <td></td>
    </tr>
    <tr>
        <td>SIGPIPE</td>
        <td>Запись в канал без чтения</td>
        <td>Завершение</td>
        <td></td>
    </tr>
    <tr>
        <td>SIGPWR</td>
        <td>Сбой питания</td>
        <td>Игнорирование</td>
        <td></td>
    </tr>
        <tr>
        <td>SIGQUIT</td>
        <td>Прерывание с клавиатуры</td>
        <td>Завершение</td>
        <td></td>
    </tr>
    <tr>
        <td>SIGSEGV</td>
        <td>Ошибка адресации</td>
        <td>Завершение</td>
        <td></td>
    </tr>
    <tr>
        <td>SIGSTOP</td>
        <td>Остановка процесса</td>
        <td>Остановка</td>
        <td></td>
    </tr>
    <tr>
        <td>SIGTTIN</td>
        <td>Попытка чтения из фонового процесса</td>
        <td>Остановка</td>
        <td></td>
    </tr>
    <tr>
        <td>SIGTTOU</td>
        <td>Попытка записи в фоновый процесс</td>
        <td>Остановка</td>
        <td></td>
    </tr>
    <tr>
        <td>SIGTERM</td>
        <td>Cигнал для запроса завершения процесса</td>
        <td>Завершение</td>
        <td>В отличие от SIGKILL этот сигнал может быть обработан или проигнорирован программой. Подробнее как перехватывать и обрабатывать можно почитать <a href="/doc/29-04-2018/perl-signals/#SIGTERM">тут</a></td>
    </tr>
    <tr>
        <td>SIGUSR1</td>
        <td>Пользовательский сигнал</td>
        <td>Завершение</td>
        <td></td>
    </tr>
    <tr>
        <td>SIGUSR2</td>
        <td>Пользовательский сигнал</td>
        <td>Завершение</td>
        <td></td>
    </tr>
    <tr>
        <td>SIGXCPU</td>
        <td>Превышение лимита времени CPU</td>
        <td>Завершение</td>
        <td></td>
    </tr>
    <tr>
        <td>SIGXFSZ</td>
        <td>Превышение пространства памяти (4GB)</td>
        <td>Завершение</td>
        <td></td>
    </tr>
    <tr>
        <td>SIGURG</td>
        <td>Срочное событие</td>
        <td>Игнорирование</td>
        <td></td>
    </tr>
    <tr>
        <td>SIGWINCH</td>
        <td>Изменение размера окна</td>
        <td>Игнорирование</td>
        <td></td>
    </tr>
</table>
