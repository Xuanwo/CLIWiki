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
