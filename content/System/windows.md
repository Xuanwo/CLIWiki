---
title: "windows"
date: 2016-5-20 15:01:00
---

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

