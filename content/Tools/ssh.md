---
title: ssh
date: 2016-06-01 14:26
---
[TOC]

## 防止SSH掉线

打开`ssh`配置文件：
```bash
sudo vim /etc/ssh/ssh_config
```
在文件中添加如下两行：
```
ServerAliveInterval 20
ServerAliveCountMax 999
```

## 修复SSH中文方块（乱码）

SSH会将当前Shell中的语言设定传递过去，如果服务器端没有安装对应的语言，就会出现中文字块等现象。

在Shell中执行：

```bash
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
```

## 设置通过密钥登陆

允许root用户通过密码登陆十分危险，容易被暴力破解，所以有条件的情况下应当尽可能的使用密钥登陆。

### 制作密钥对

如果没有自己的密钥，则需要自行创建一个。

```bash
$ ssh-keygen
```

首先选择密钥存放地址，默认为：`~/.ssh/id_rsa`。
然后输入passphrase，这个相当于给密钥加上了一个双保险，需要密钥＋密码才能登陆，根据自己需求进行设置即可。
再次回车之后，密钥就创建完毕了。

此时，在`~/.ssh`目录下会产生两个新文件：一个`id_rsa`私钥文件，一个`id_rsa.pub`公钥文件。

### 在服务器上配置公钥

> 公钥好比是锁，私钥好比是钥匙。在服务器上安装公钥，然后用户使用私钥就可以解锁。

安装公钥很简单，只需要把公钥文件输入到`.ssh`目录下的`authorized_keys`文件中即可。

```bash
cat id_rsa.pub >> authorized_keys
```

同时需要注意，`authorized_keys`文件权限应为`600`，而`.ssh`文件夹权限应为`700`，否则链接可能出现错误。

### 设置SSH，打开密钥登陆并禁止密码登陆

修改`/etc/ssh/sshd_config`：

```config
RSAAuthentication yes
PubkeyAuthentication yes
PermitRootLogin yes
```

在确认使用密钥登录成功后，再关闭密码登陆：

```config
PasswordAuthentication no
```

然后重启sshd服务：

```bash
systemctl restart sshd
```

### 下载私钥并添加到本地agent

首先使用SCP命令下载私钥到本地：

> 需要注意不要覆盖了本地的密钥

```bash
scp root@123.123.123.123:/root/.ssh/id_rsa ~/.ssh
```

然后将该密钥添加到agent：

```bash
ssh-add ~/.ssh/id_rsa
```


