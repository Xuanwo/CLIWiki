---
title: "windows"
date: 2016-5-20 15:01:00
---
[TOC]

## 修改Hosts之后更新DNS缓存

``` cmd
ipconfig /flushdns
ipconfig /renew
ipconfig /registerdns  # 此命令需要管理员权限
```

## 删除无法删除的文件夹/文件

``` cmd
# 建议使用管理员权限
rd /s/q 盘符:\某个文件夹
del /f/s/q 盘符:\文件名
```

## 允许系统执行ps1脚本

在 Powershell 中执行

``` powershell
Set-ExecutionPolicy -ExecutionPolicy UNRESTRICTED
```
## 修改操作系统右键菜单

系统的右键菜单都在`HKEY_CLASSES_ROOT`根键下，**修改系统右键菜单是非常危险的操作，做任何变动前请备份并三思**。

### 修改全局右键菜单

1. 打开`HKEY_CLASSES_ROOT\*`；

2. 在其下新建`shell\<new command>\command`分支，再将command的键值设为执行该命令时所用的可执行程序的绝对路径，并在其后加`%1`即可。

例: 在`HKEY_CLASSES_ROOT\*`下新建`shell\用写字板打开\command`子键，将command的键值设为`c:\windows\notepad.exe %1`，就会在右键菜单中出现`用写字板打开`的命令了。

### 修改特定文件类型右键菜单

1. 打开`HKEY_CLASSES_ROOT\mp3_auto_file`主键；

2. 在其下新建`shell\Play with Winamp\command`，将command的键值设为“C:\Programfiles\winamp\winamp.exe ％1” 。

### 修改文件夹右键菜单

1. 打开`HKEY_CLASSES_ROOT\diretory\shell`主键；

2. 在其下新建`<new command>\command`

### 修改所有的文件与文件夹的右键菜单

1. 打开`HKEY_CLASSES_ROOT\AllFilesystemObjects`主键

2. 在其下新建`shell\<new command>\command`
