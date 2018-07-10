IF NOT EXISTS( SELECT NULL
            FROM INFORMATION_SCHEMA.COLUMNS
           WHERE table_name = 'tablename'
             AND table_schema = 'db_name'
             AND column_name = 'columnname')  THEN

  ALTER TABLE `TableName` ADD `ColumnName` int(1) NOT NULL default '0';

END IF;