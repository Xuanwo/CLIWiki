---
title: "alpine"
date: 2016-6-2 21:01:00
---
[TOC]

## 在alpine下安装nokogiri

首先安装对应的依赖：

```sh
apk add --update build-base libxml2-dev zlib-dev libgcrypt-dev libxslt-dev
```

然后使用系统库进行安装：

```sh
bundle config build.nokogiri --use-system-libraries
```


