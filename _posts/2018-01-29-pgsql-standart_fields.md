---
title: "Создание стандартный полей: ts_create, ts_modify, user_id, modify_user_id"
categories: pgsql 
tag: databases  catalyst
reference:
  -
---

* TOC 
{:toc}


## Поля

<!-- ------------------------------------------------------------- -->

<pre><code class="sql">ALTER TABLE schema.table
  ADD COLUMN ts_create TIMESTAMP(0) WITHOUT TIME ZONE DEFAULT now() NOT NULL;

ALTER TABLE schema.table
  ADD COLUMN ts_modify TIMESTAMP(0) WITHOUT TIME ZONE;

ALTER TABLE schema.table
  ADD COLUMN user_id INTEGER NOT NULL;

ALTER TABLE schema.table
  ADD COLUMN modify_user_id INTEGER;

ALTER TABLE schema.table
  ADD COLUMN _trigger_off BOOLEAN;

COMMENT ON COLUMN schema.table.ts_create
IS 'Дата создания записи';

COMMENT ON COLUMN schema.table.ts_modify
IS 'Дата последнего обновления';

COMMENT ON COLUMN schema.table.user_id
IS 'Пользователь создавший запись';

COMMENT ON COLUMN schema.table.modify_user_id
IS 'Пользователь изменивший запись';
</code></pre>


## DBIx

<!-- ------------------------------------------------------------- -->

<pre><code class="perl">
    'ts_create',
        {
            data_type           => 'datetime',
            timezone            => 'local',
            is_nullable         => 0,
            default_value       => \'now()',
            retrieve_on_insert  => 1
        },
    'ts_modify',
        {
            data_type           => 'datetime',
            timezone            => 'local',
            is_nullable         => 1,
        },
    'user_id',
        {
            data_type           => 'integer',
            is_nullable         => 0
        },
    'modify_user_id',
        {
            data_type           => 'integer',
            is_nullable         => 1
        },
</code></pre>
