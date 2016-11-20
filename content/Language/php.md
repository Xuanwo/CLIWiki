---
title: "php"
date: 2016-11-19 12:00
---
[TOC]

## 判断一个变量是否为空

```php
empty ( mixed $var )
```

需要注意的是以下值会被判定为空值：

- "" (an empty string)
- 0 (0 as an integer)
- 0.0 (0 as a float)
- "0" (0 as a string)
- NULL
- FALSE
- array() (an empty array)
- $var; (a variable declared, but without a value)

## 将两个对象合并在一起

```php
foreach($objB as $var=>$value){
    $objA->$var = $value;
}
```

在某些特定的场景下会用到，随意使用会污染对象内部的变量。
