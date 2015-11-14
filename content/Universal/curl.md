---
title: "curl"
date: 2015-11-14 15:40:28
---
[TOC]

## 使用代理访问

```
curl -x 127.0.0.1:1080 cli.xuanwo.org
```

参数说明：

- `-x` : 设置代理，格式为host[:port]，port的缺省值为1080

## 获取网页源码并保存

```
curl cli.xuanwo.org -o sample.html
```

参数说明：

- `-o` : 指定输出文件