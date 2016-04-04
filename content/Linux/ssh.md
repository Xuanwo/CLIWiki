---
title: ssh
date: 2016-03-30 10:40
---
[TOC]

## 防止SSH掉线

打开`ssh`配置文件：
```bash
sudo vim /etc/ssh/ssh_config
```
在文件中添加如下两行：
```
ServerAliveInterval 20
ServerAliveCountMax 999
```

## 修复SSH中文方块（乱码）

SSH会将当前Shell中的语言设定传递过去，如果服务器端没有安装对应的语言，就会出现中文字块等现象。

在Shell中执行：

```bash
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
```

