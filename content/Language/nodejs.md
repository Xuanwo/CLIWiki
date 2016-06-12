---
title: "nodejs"
date: 2016-06-12 21:00
---
[TOC]

## 配置国内镜像源

由于特殊国情，在国内需要配置镜像源才能正常使用npm下载及更新包。

### 临时使用

```
npm --registry https://registry.npm.taobao.org install <package>
```

### 持久使用

```
npm config set registry https://registry.npm.taobao.org
```

