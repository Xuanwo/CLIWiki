---
title: "ubuntu"
date: 2016-03-12 15:57
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


## Ubuntu支持Cisco Anyconnent VPN

由于Cisco的Anyconnect是一个私有的程序，只有在部署了Cisco VPN的地方才能够下载到相应的程序。因此我们可以转而使用开源的Openconnent：

```
sudo apt-get install network-manager-openconnect-gnome
```

安装完毕后，在网络管理器中添加网络-VPN，就能看到关于`Cisco Anyconnect兼容的VPN`选项。

## JetBrains开发工具的安装

在官网上下载压缩包，在合适的位置解压缩，然后运行`bin`文件夹中对应sh文件即可。

> 运行完毕后建议不要在移动文件夹，否则自动创建的快捷方式会失效，需要自行修改位置。


## 查看端口占用情况

```bash
netstat -ap | grep <port>
```

使用过程中经常出现端口被占用导致无法启动程序的情况，只要使用此命令查看端口占用，然后使用`kill`杀死占用端口的进程即可

## 查看运行中的进程

```bash
ps -aux
```
> 需要注意的是，只会显示当前用户开启的进程，如果想查看所有进程，需要添加`sudo`

## 杀死某个僵死的进程

```bash
kill pid
```

> 在ZSH中输入`kill`然后敲击`tab`，会出现所有运行中的进程，输入名字即可自动转换为pid。

## 开机自动挂载NTFS分区

打开磁盘应用，选中自己想要自动挂载的NTFS分区，点击下方的设置-编辑挂载选项，然后勾选`启动时挂载`即可。

## 安装英伟达私有驱动并进行双显卡切换

安装英伟达的驱动有两种方法：

- 执行`sudo apt-get install nvidia-<version>`
- 在`附加驱动`中勾选NVIDIA闭源驱动

这两种方法本质上是一样的，当前的最新版本号为352。
安装完成后，在程序菜单中找到`NVIDIA X Server Setting`，然后在`PRIME Setting`中可以选择是使用`低能耗（Intel）`还是`高性能（NVIDIA）`模式。勾选完成后重启即可。

> 按照程序的提示是只需要logout即可，但是我测试之后发现无法正常进入桌面，所以还是直接重启吧~

## 转换MP3编码
转换MP3编码可以使用`EasyTag`。
```
sudo apt-get install easytag
```
然后选择乱码的MP3，读取使用对应的语言，然后写入为`UTF-8`即可。

## 在后台运行程序

- `<command> &`：后台运行
- `Ctrl+z`： 将命令转到后台并停止运行
- `jobs`：查看后台运行的任务
- `fg %<id>`：将后台任务调至前台运行
- `bg %<id>`：让后台任务从停止状态转为运行状态用

**注意，以上所有的后台任务在退出当前Shell时都会中断**，如果想在退出Shell或者SSH后，任务依然执行，可以使用下列命令：

- `(<command> &)`：将命令使用括号包裹，使其在另一个shell中运行
- `nohup <command> &`：在命令之前加`nohup`，使得命令不受中断信号影响

## 通过SSH传输文件

只需要使用scp命令：

```bash
scp source target
```

这里的源和目标均支持文件和目录，如果复制的是一个目录，需要在scp后添加`-r`参数。

## 将密钥加入SSH-Agent

```bash
ssh-add + <private key>
```

## 查看内核

```bash
uname -a
```

## 修改分屏分辨率

执行如下命令，显示目前显示器支持的分辨率：
```
xrandr
```
结果如下：
```
Screen 0: minimum 8 x 8, current 3286 x 1080, maximum 32767 x 32767
LVDS1 connected primary 1366x768+0+0 (normal left inverted right x axis y axis) 344mm x 194mm
   1366x768      60.01*+
   1360x768      59.80    59.96
   1280x720      60.00
   1024x768      60.00
   1024x576      60.00
   960x540       60.00
   800x600       60.32    56.25
   864x486       60.00
   640x480       59.94
   720x405       60.00
   680x384       60.00
   640x360       60.00
DP1 disconnected (normal left inverted right x axis y axis)
DP2 disconnected (normal left inverted right x axis y axis)
HDMI1 disconnected (normal left inverted right x axis y axis)
HDMI2 disconnected (normal left inverted right x axis y axis)
VGA1 connected 1920x1080+1366+0 (normal left inverted right x axis y axis) 0mm x 0mm
   1024x768      60.00
   800x600       60.32    56.25
   848x480       60.00
   640x480       59.94
VIRTUAL1 disconnected (normal left inverted right x axis y axis)
```

我们可以看到显示器目前是不支持1920x1080分辨率的，因此我们需要首先自行生成相关分辨率的配置参数：
```
cvt 1920 1080
```
输出如下：
```
# 1920x1080 59.96 Hz (CVT 2.07M9) hsync: 67.16 kHz; pclk: 173.00 MHz
Modeline "1920x1080_60.00"  173.00  1920 2048 2248 2576  1080 1083 1088 1120 -hsync +vsync
```

然后新建显示模式并添加到配置列表中去：
```
sudo xrandr --newmode "1920x1080_60.00"  173.00  1920 2048 2248 2576  1080 1083 1088 1120 -hsync +vsync
sudo xrandr --addmode VGA1 "1920x1080_60.00"
```

然后我们就可以设定显示屏的分辨率了：
```
xrandr --output VGA1 --mode 1920x1080_60.00
```

如果担心自己设定的分辨率不支持，可以再追加一个`sleep`命令以保证不会困在无效的分辨率下：

```
xrandr --output VGA1 --mode 1920x1080_60.00 && sleep 5
```

此配置仅在当前会话下生效，如果需要永久生效可以考虑修改`xorg.conf`或者设定一个开机执行的脚本。

> 已知问题：
> 使用英伟达的官方驱动会导致分屏分辨率切换异常，暂时无解，使用Intel的Power Save模式可以正常开启分屏

## 去除恼人的错误报告提示

Ubuntu非常令人讨厌的一点就是时不时弹出的错误报告，又不能给出有效的诊断信息，还总是打乱自己当前正在运行的全屏程序，使用下列命令可以去除这个错误报告提示：

```
sudo apt-get purge apport*
```

## 修改网卡的物理地址

在某些需要网卡物理地址和IP绑定的情形下，会有需要修改网卡物理地址的需求，可以通过如下命令进行修改：

```bash
sudo ifconfig enp5s0 down
sudo ifconfig enp5s0 hw ether XX:XX:XX:XX:XX:XX
sudo ifconfig enp5s0 up
```

