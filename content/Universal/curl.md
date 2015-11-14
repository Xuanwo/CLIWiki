---
title: "curl"
date: 2015-11-14 15:40:28
---
[TOC]

## curl使用代理访问

```
curl -x 127.0.0.1:1080 cli.xuanwo.org
```

参数说明：

- `-x` : 设置代理，格式为host[:port]，port的缺省值为1080