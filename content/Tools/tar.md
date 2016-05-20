---
title: "tar"
date: 2015-11-14 14:59:33
---
[TOC]

## 打包指定目录
```
tar -cvf home_backup.tar /home
```
将`/home`目录下的所有文件打包入`home_backup.tar`文件中。

## 解开tar文件
```
tar -xvf xxx.tar
```
将tar文件解压缩至当前目录下

## 解开gzip压缩的文件
> 后缀一般为：`.tar.gz`或`.tgz`

```
tar -xvzf xxx.tar.gz
```
把gzip压缩的文件解开至当前目录下

## 解开compress压缩的文件
> 后缀一般为：`.tar.Z`或`.taz`

```
tar -xvZf xxx.tar.Z
```
把compress压缩的文件解开至当前目录下

## 解开bzip2压缩的文件
> 后缀一般为：`.tar.bz2`或`.tbz`

```
tar -xvjf xxx.tar.bz2
```
把bzip2压缩的文件解开至当前目录下

## 解开XZ Utils压缩的文件
> 后缀一般为：`.tar.xz`或`.txz`或`.tar.lzma`或`.tlz`

```
tar -xvJf xxx.tar.xz
```
把xz压缩的文件解开至当前目录下