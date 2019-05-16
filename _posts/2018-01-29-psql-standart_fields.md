---
title: "Postgres - Создание стандартный полей: ts_create, ts_modify, user_id, modify_user_id"
tag: [postgres, catalyst]
reference:
  -
---

* TOC 
{:toc}


## Поля

<!-- ------------------------------------------------------------- -->

<pre><code class="sql">
ALTER TABLE schema.table
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

## Триггеры

<pre><code class="sql">
CREATE OR REPLACE FUNCTION schema._items_insert_before_trigger (
)
RETURNS trigger AS
$body$
DECLARE
    r_user          "public"."users";
BEGIN
    IF NEW._trigger_off IS TRUE THEN
        NEW._trigger_off := NULL;
        RETURN NEW;
    END IF;
 
    NEW.ts_create       := now();
    NEW.ts_modify       := now();
    NEW.modify_user_id  := NEW.user_id;
    
-- check user
    SELECT * INTO r_user
        FROM "public".check_item(NEW.user_id, row_to_json(NEW), 'user_id');
    IF r_user.id IS NULL THEN
        RETURN NULL;
    END IF;
 
    RETURN NEW;
END;
$body$
LANGUAGE 'plpgsql'
VOLATILE
CALLED ON NULL INPUT
SECURITY INVOKER
COST 100;

CREATE TRIGGER items_insert_before
  BEFORE INSERT 
  ON schema.items
  
FOR EACH ROW 
  EXECUTE PROCEDURE schema._items_insert_before();
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
 
