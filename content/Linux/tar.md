---
title: "tar"
date: 2015-9-7 00:05:26
---
## tar简介
Unix和类Unix系统上的压缩打包工具，可以将多个文件合并为一个文件，打包后的文件名亦为“tar”。目前，tar文件格式已经成为POSIX标准，最初是POSIX.1-1988，目前是POSIX.1-2001。本程序最初的设计目的是将文件备份到磁带上(tape archive)，因而得名tar。

## tar命令格式
```
tar 功能 选项 文件
```
可以将代表功能和选项的单个字母合并；当使用单个字母时，可以不用在字母前面加`-`。某些版本的tar要求严格按照功能字、选项字的顺序，而有些版本的tar并不在意这个顺序。

## tar功能参数

### -c，--create
创建新的tar文件

### -x，--extract，--get
解开tar文件

### -t，--list
列出tar文件中包含的文件的信息

### -r，--append
附加新的文件到tar文件中

### -u，--update
用已打包的文件的较新版本更新tar文件

### -A，--catenate，--concatenate
将tar文件作为一个整体追加到另一个tar文件中

### -d，--diff，--compare
将文件系统里的文件和tar文件里的文件进行比较

### --delete
删除tar文件里的文件。
**这个功能不能用于已保存在磁带上的tar文件！**

## tar选项参数

### -v，--verbose
列出每一步处理涉及的文件的信息，只用一个“v”时，仅列出文件名，使用两个“v”时，列出权限、所有者、大小、时间、文件名等信息。

### -k，--keep-old-files
不覆盖文件系统上已有的文件

### -f，--file
[主机名:]文件名 指定要处理的文件名。可以用“-”代表标准输出或标准输入。

### -P，--absolute-names
使用绝对路径（默认使用相对路径）。

### -j，--bzip2
调用bzip2执行压缩或解压缩。

### -J，--xz，--lzma
调用XZ Utils执行压缩或解压缩。依赖XZ Utils。

### -z，--gzip，--gunzip，--ungzip
调用gzip执行压缩或解压缩

### -Z，--compress，--uncompress
调用compress执行压缩或解压缩

## tar应用举例

### 打包指定目录
```
tar -cvf home_backup.tar /home
```
将`/home`目录下的所有文件打包入`home_backup.tar`文件中。

### 解开tar文件
```
tar -xvf xxx.tar
```
将tar文件解压缩至当前目录下

### 解开gzip压缩的文件
> 后缀一般为：`.tar.gz`或`.tgz`

```
tar -xvzf xxx.tar.gz
```
把gzip压缩的文件解开至当前目录下

### 解开compress压缩的文件
> 后缀一般为：`.tar.Z`或`.taz`

```
tar -xvZf xxx.tar.Z
```
把compress压缩的文件解开至当前目录下

### 解开bzip2压缩的文件
> 后缀一般为：`.tar.bz2`或`.tbz`

```
tar -xvjf xxx.tar.bz2
```
把bzip2压缩的文件解开至当前目录下

### 解开XZ Utils压缩的文件
> 后缀一般为：`.tar.xz`或`.txz`

```
tar -xvJf xxx.tar.xz
```
把xz压缩的文件解开至当前目录下