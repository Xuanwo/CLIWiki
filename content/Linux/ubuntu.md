---
title: "ubuntu"
date: 2016-02-23 00:37
---
[TOC]

## 解决/usr/bin/ld: cannot find -lxxx错误

**原因：**

1. 系统没有安装相对应的lib
1. 相对应的lib版本不对
1. lib(.so档)的符号链接不正确，没有连结到正确的函式库文件(.so)

**解决方案：**

1. 先判断在`/usr/lib`下的相对应的函式库文件(.so)的符号链接是否正确，若不正确改成正确的连结目标即可解决问题。
1. 若不是符号链接的问题引起，而是系统缺少相对应的lib，则安装lib即可解决。

**样例：**

> 包名格式
> `lxxx`对应so档一般为`libxxx.so`，对应apt软件包一般为`libxxx-dev`

**符号链接不正确**
```
/usr/bin/ld: cannot find -lXtst
```
检查发现存在`libXtst.so.6`，使用命令`ln -s libXtst.so.6 libXtst.so`建立软连接即可。

**未安装对应包**
```
/usr/bin/ld: cannot find -lc
```
不是符号链接的问题，则使用命令`apt-get install libc-dev`

## 解决fatal error: Python.h: No such file or directory错误
安装指定的Python版本

```
apt-get install python3.5-dev
```

*具体版本取决于编译需要*

## aira2及其前端的配置

### 安装aria2

```bash
sudo apt-get install aria2
```
### 前端配置

可以选择uget或者Web化前端，uget直接在设置中开启即可，此处主要介绍一下前端配置。

首先clone代码：

```bash
git clone https://github.com/ziahamza/webui-aria2.git
```

然后创建`~/.aria2/aria2.conf`，内容请参考[此处](http://aria2c.com/usage.html)

根据自己的需要修改即可，需要注意的有以下地方：

- 涉及到地址的地方最好使用绝对路径，相对路径会出现找不到文件之类的奇怪问题
- 不支持中文路径
- 按照自己的需要设置`rpc-secre`并修改`webui-aria2`路径下的`configuration.js`文件（*直接在浏览器中填写的话，无法保存*）

### 后台启动

首先使用`aria2c`命令尝试启动，若测试一切正常，则可以使用`aria2c -D`命令使其在后台运行。

### 开机自启

在Ubuntu上可以通过修改`/etc/rc.local`的方式设置开机自启，只需要填写自己需要的命令即可。使用Sudo权限打开文件，在`exit 0`的上方加入：

```
/usr/bin/aria2c --conf-path=/home/xuanwo/.aria2/aria2.conf &
```

按照自己的需求修改，需要注意以下地方：

- `rc.local`在启动时没有初始化path，故aria2c不会自动加载配置文件，需要自己手动指定配置文件地址并使用绝对地址运行aria2c，否则无法正确开机自启。
- `-D`参数错误退出是不会输出stderr信息，推荐使用`&`来让进程运行于后台
- 一定要确保命令正确退出，否则，轻则程序没有正确自启，重则无法进入桌面

> 如果发现没有正确自启，可以使用`systemctl status re.loacl.service -l`命令查看输出的信息。


## Ubuntu支持Cisco Anyconnent VPN [Todo]
openconnect

## pycharm的安装 [Todo]


