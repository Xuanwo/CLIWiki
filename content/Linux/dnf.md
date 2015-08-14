---
title: "dnf"
date: 2015-8-9 03:06:28
---
## dnf简介
dnf，全称Dandified Yum，是RPM发行版的软件包管理器Yellowdog Updater, Modified（yum）的下一代版本。dnf最早出现在Fedora 18中，并在Fedora 22中替代yum。

## dnf命令格式
```
dnf [options] <command> [<args>...]
```

## dnf参数

### --assumeno
对所有询问均回答`no`。

### --best
尝试查询结果中可提供的最优的包

### -C
> `--cacheonly`
完全从系统缓存中运行，不更新缓存

### -c
```
-c <config file>, --config=<config file>
```
指定配置文件路径

### -d
```
-d <debug level>, --debuglevel=<debug level>
```
指定Debug的等级，从0（没有多余的信息）到10（显示所有的Debug信息，包括不能被用户理解的）。
*已经被弃用，使用`-v`作为替代*

### --disableexcludes

### -e

### -x

### -h

### --installroot

### --nogpgcheck

### -q

### -R

### --releasever

### --rpmverbosity

### --showduplicates

### -v

### --version

### -y

## dnf命令

### check-update

### clean

### dist-sync

### distribution-sync

### downgrade

### erase

### group

### help

### history

### info

### install

### list

### makecache

### provides

### reinstall

### repolist

### search

### update

### update-to

### upgrade

### upgrade-to