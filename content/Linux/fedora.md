---
title: "fedora"
date: 2016-05-12 10:20
---
[TOC]

## 安装博通 BCM43142 网卡驱动

> 首先应当确认自己的网卡型号： `lspci | grep Network`
> 如果后面的芯片型号包括 BCM4312，BCM43142 等可以应用本教程

首先需要添加 RPMFusion 以支持添加更多软件来源：

Fedora 22 and later:

```bash
su -c 'dnf install http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm'
```

更多版本请参见： http://rpmfusion.org/Configuration

然后执行下列命令以安装需要的包：

```bash
sudo dnf install kernel-devel akmod-wl 
```

然后执行下列命令以重新编译内核模块：

```bash
sudo akmods
```

然后执行下列命令以加载内核代码：

```bash
sudo modprobe wl
```

最后重启网络管理器：

```bash
sudo systemctl restart NetworkManager
```


