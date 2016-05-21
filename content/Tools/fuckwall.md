---
title: "fuckwall"
date: 2016-5-21 21:24
---
[TOC]

## Socks代理转为HTTP代理

> 本条目要求你已经有一个配置好的Shadowsocks代理，并将本地监听地址设为1080。

Shadowsocks代理的Win版有一个非常cool的特性是自带privoxy，可以同时输出socks代理和http代理。但是在Linux和Mac平台下，就需要自己动手了。

### Linux

**本条目适用于Fedora 23**

首先安装Privoxy。

```bash
sudo dnf install privoxy
```

然后修改配置文件`/etc/privoxy/config`，在配置文件的最后添加如下两行：

```bash
listen-address 0.0.0.0:1090
forward-socks5 / localhost:1080 .
```

Privoxy在Linux平台上是以服务形式存在的，所以启动Privoxy需要使用systemctl工具：

```bash
systemctl start privoxy
```

> 启用了selinux的系统可能会在启动时报错，可以使用命令`semanage port -a -t http_cache_port_t -p tcp 1090`来启用这个端口。

此时，你已经可以通过`127.0.0.1:1090`来使用HTTP代理了，同时公网或局域网内也能使用`IP:port`的形式来使用。

### Mac OS X

首先你需要配置好brewhome工具，然后安装privoxy：

```bash
brew install privoxy
```

然后修改配置文件`/usr/local/etc/privoxy/config`，在配置文件的最后添加如下两行：

```bash
listen-address 0.0.0.0:1090
forward-socks5 / localhost:1080 .
```

然后运行

```bash
privoxy /usr/local/etc/privoxy/config
```

此时，你已经可以通过`127.0.0.1:1090`来使用这个HTTP代理了，公网和局域网也能通过`IP:port`的形式来使用
