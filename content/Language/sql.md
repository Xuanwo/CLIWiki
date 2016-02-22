---
title: "sql"
date: 2015-12-29 15:17:09
---
[TOC]

## 创建表

``` sql
CREATE TABLE table_name
(
    column_name column_type [PRIMARY KEY] [NULL/NOT NULL],
    column_name column_type [PRIMARY KEY] [NULL/NOT NULL]
)
```

## 在已有表中加入列

``` sql
ALTER TABLE table_name
ADD column_name column_type [PRIMARY KEY] [NULL/NOT NULL]
```

