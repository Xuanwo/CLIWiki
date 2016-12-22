---
title: "sed"
date: 2016-11-1 21:07:36
---
[TOC]

## 去除所有的tags

```bash
sed 's/<[^>]*>//g'
```

比如说有一个`html.txt`内容如下：

```html
<b>This</b> is what <span style="text-decoration: underline;">I</span> meant. Understand?
```

执行命令

```bash
sed 's/<[^>]*>//g' html.txt
```

结果为：

```
This is what I meant. Understand?
```

## 在指定行插入新行

在指定行前插入一行

```bash
sed '2 i<Content>' -i a.txt
```
在指定行后插入一行

```bash
sed '2 a<Content>' -i a.txt
```
在指定的多行前面插入

```bash
sed 'n,m i<Content>' -i a.txt
```

在指定的多行后面插入

```bash
sed 'n,m a<Content>' -i a.txt
```

在匹配的行前面插入新行

```bash
sed '/test/i<Content>' -i a.txt
```

在匹配的行后面插入新行

```bash
sed '/test/a<Content>' -i a.txt
```
