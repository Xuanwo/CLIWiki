---
title: "wget"
date: 2015-11-14 15:42:59
---
[TOC]

## wget使用代理访问

```
wget -Y on -e "http_proxy=http://127.0.0.1:1080" "cli.xuanwo.org"
```

参数说明：

- `-Y` : 是否使用代理
- `-e` : 执行命令