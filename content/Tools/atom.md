---
title: "atom"
date: 2016-02-22 17:49
---
[TOC]

## 修复node-gyp 500错误

使用全局代理或VPN，无需修改apm相关参数

## 为apm设置代理

```
apm config set strict-ssl false

apm config set http-proxy http://127.0.0.1:1080
apm config set https-proxy http://127.0.0.1:1080
```

如果用的是Shadowsocks的话，Win可以直接用1080端口，Linux和Mac需要通过`Privoxy`将Socks代理转换为Http代理才能正常使用。
