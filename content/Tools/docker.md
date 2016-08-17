---
title: "docker"
date: 2016-8-17 22:26
---
[TOC]

## 以JSON形式输出信息

```
docker inspect --format '{{json .Mounts}}' container
```
