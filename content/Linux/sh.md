---
title: "sh"
date: 2016-04-28 17:22
---
[TOC]

## 改变所属群组, chgrp
```
chgrp [-R] dirname/filename ...
```

`-R` : 意为递归修改

## 改变文件拥有者, chown
```
chown [-R] 账号名称 文件或目录
chown [-R] 账号名称:组名 文件或目录
```

`-R` : 意为递归修改

可以同时修改文件所有者和所属群组

## 改变权限, chmod


Linux文件的基本权限就有九个，分别是owner/group/others三种身份各有自己的read/write/execute权限。

### 数字形式修改权限

我们可以使用数字来代表各个权限，各权限的分数对照表如下：

|权限|对应数字|
|-|-|
|r|4|
|w|2|
|x|1|

每种身份(owner/group/others)各自的三个权限(r/w/x)分数是需要累加的，例如当权限为： `[-rwxrwx---]` 分数则是：

owner = rwx = 4+2+1 = 7

group = rwx = 4+2+1 = 7

others= --- = 0+0+0 = 0

变更文件权限的命令为：

```
chmod [-R] xyz 文件或目录
```

### 字母形式修改权限

|命令|用户类型|修改操作|权限类型|内容|
|-|-|-|-|-|
|chmod|u<br>g<br>o<br>a|+(加入)<br>-(除去)<br>=(设定)|r<br>w<br>x|文件或目录|

样例：

```
chmod  u=rwx,go=rx  .bashrc
# -rwxr-xr-x .bashrc
chmod  a+w  .bashrc
# -rwxrwxrwx .bashrc
```

