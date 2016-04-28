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

## 支持网页自动跳转

有的网址是自动跳转的。使用`-L`参数，curl就会跳转到新的网址。

```
curl -L www.google.com
```

使用上述命令会自动跳转到 https://www.google.com/?gws_rd=ssl

## 发送表单信息

### GET

GET只需要直接curl带有数据的网址即可。

```
curl example.com/form.cgi?data=xxx
```

### POST

POST则需要使用POST动词再加上`--data`参数

```
curl -X POST --data "data=xxx" example.com/form.cgi
```

还可以让curl进行urlencode编码：

```
curl -X POST--data-urlencode "date=April 1" example.com/form.cgi
```


