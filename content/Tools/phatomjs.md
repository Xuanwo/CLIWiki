---
title: "phatomjs"
date: 2016-8-20 23:06:36
---
[TOC]

## QXcbConnection: Could not connect to display

这个问题一般出现在没有X11环境下有运行phatomjs，只需要在运行前执行：

```bash
export QT_QPA_PLATFORM=offscreen
```

即可。
