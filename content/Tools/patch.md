---
title: "patch"
date: 2016-12-22 20:51:36
---
[TOC]

## 使用diff制作补丁

> diff 【选项】 源文件（夹） 目的文件（夹）

- `-r`
递归。设置后diff会将两个不同版本源代码目录中的所有对应文件全部都进行一次比较，包括子目录文件。
- `-N`
选项确保补丁文件将正确地处理已经创建或删除文件的情况
- `-u`
输出每个修改前后的3行，也可以用-u5等指定输出更多上下文
- `-E, -b, -w, -B, --strip-trailing-cr`
忽略各种空白，可参见文档，按需选用。

## 使用patch应用补丁

patch的作用则是将diff记录的结果（即补丁）应用到相应文件（夹）上。最常见的用法为：

> patch -pNUM <patchfile>

- `-p Num`
忽略几层文件夹
- `-E`
选项说明如果发现了空文件，那么就删除它
- `-R`
取消打过的补丁

为了解释 -p 参数，看看如下patch文件片段：

> --- old/modules/pcitable       Mon Sep 27 11:03:56 1999

> +++ new/modules/pcitable       Tue Dec 19 20:05:41 2000

如果使用参数 -p0，那就表示从当前目录找一个叫做old的文件夹，再在它下面寻找 modules/pcitable 文件来执行patch操作。
而如果使用参数 -p1，那就表示忽略第一层目录（即不管old），从当前目录寻找 modules 的文件夹，再在它下面找pcitable。

### 单个文件打补丁

```bash
# 产生补丁
diff -uN from-file to-file >to-file.patch

# 打补丁
patch -p0 < to-file.patch

# 取消补丁
patch -RE -p0 < to-file.patch
```

### 对文件夹打补丁

```bash
# 产生补丁
diff -uNr  from-docu  to-docu  >to-docu.patch

# 打补丁
cd to-docu
patch -p1 < to-docu.patch

# 取消补丁
patch -R -p1 <to-docu.patch
```
