---
title: ssh
date: 2016-03-30 10:40
---
[TOC]

## 防止SSH掉线

打开`ssh`配置文件：
```
sudo vim /etc/ssh/ssh_config
```
在文件中添加如下两行：
```
ServerAliveInterval 20
ServerAliveCountMax 999
```

