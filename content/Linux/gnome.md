---
title: "gnome"
date: 2016-02-23 00:19
---
[TOC]

**本文全部内容仅在Gnome 3.14下验证通过**

## 隐藏标题栏后如何取消最大化

- alt+space可以唤出相关选单，取消最大化即可
- 使用鼠标自顶向下拖动即可解除最大化

## 修改快捷链接

有时候会出现快捷链接方式错误的现象，这个需要进入`/usr/share/applications`文件夹寻找对应的`.desktop`文件来修改。
`.desktop`文件只是一个文本文档，大致内容如下：
```
[Desktop Entry]
Version=1.0
Type=Application
Name=PyCharm
Icon=/home/xuanwo/Soft/pycharm-5.0.4/bin/pycharm.png # 指定图标
Exec="/home/xuanwo/Soft/pycharm-5.0.4/bin/pycharm.sh" %f # 指定可执行文件
Comment=Develop with pleasure!
Categories=Development;IDE; # 指定分类
Terminal=false
StartupWMClass=jetbrains-pycharm
```

只需要按照正确的地址修改链接即可~


