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

## CGI escape

有时候需要对字符串做CGI escape，将url中不能出现字符进行escape

```php
urlencode(string);
```

## 获取系统信息

获取系统类型及版本号

```php
php_uname()
```

只获取系统类型

```php
php_uname('s')
```

只获取系统版本号

```php
php_uname('r')
```
