---
title: "osx"
date: 2016-6-2 21:01:00
---
[TOC]

## 解决 Mac OS X 安装时提示“系统在安装或下载时已破坏或篡改”

打包时系统内置的密钥在安装时已过期，故安装工具会提示“系统在安装或下载时已破坏或篡改”，可以通过命令行工具修复：

打开`实用工具 -> 终端`，输入：


```
date 122014102015.30 ＃ 打包时间，12是月，20是日，14是时，10是分，2015是年，30是秒
```

以上为示例，具体使用时请询问打包者真实的打包时间

## 在Mac OS X下安装pyyaml

Mac下默认没有libyaml这个库，所以需要使用brew安装：

```zsh
brew install libyaml
```

由于brew的库都安装在一个非常规路径下，所以我们需要将libyaml所在库路径添加到安装时的搜索路径中。
首先下载源码包：

```zsh
pip download pyyaml
```

然后修改对应pyyaml的setup.cfg文件：

```cfg
# List of directories to search for 'yaml.h' (separated by ':').
include_dirs=/usr/local/include:../../include:/usr/local/Cellar/libyaml/0.1.6_1/include

# List of directories to search for 'libyaml.a' (separated by ':').
library_dirs=/usr/local/lib:../../lib:/usr/local/Cellar/libyaml/0.1.6_1/lib
```

在路径最后加入libyaml的安装地址，根据安装的实际情况进行调整。

最后使用setuptools进行安装：

```zsh
python setup.py install
```


