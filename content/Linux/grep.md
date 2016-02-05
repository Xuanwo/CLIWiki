---
title: "grep"
date: 2015-11-14 15:50:36
---
[TOC]

## 只输出匹配的部分

现有文件`sample.txt`，内容如下：
```
                      13457172   9331692   3441888  74% /
tmpfs                   509288         0    509288   0% /lib/init/rw
varrun                  509288       160    509128   1% /var/run
varlock                 509288         0    509288   0% /var/lock
udev                    509288       156    509132   1% /dev
tmpfs                   509288       548    508740   1% /dev/shm
/dev/sda6             39070048  14621620  24448428  38% /host
lrm                     509288      2392    506896   1% /lib/modules/2.6.28-11-generic/volatile
/dev/sda7             29317692  11334916  17982776  39% /apple
/dev/sda5             48828008    389116  48438892   1% /opt
/dev/sda9             28327964  14598436  12290508  55% /apple/vmware
```
现在我们只想获取所有的百分比，可以使用下列命令：

```
grep -o '..%' sample.txt
```

参数说明

- `-o`,`--only-matching` : 只输出表达式中匹配的部分

得到的输出如下：
```
74%
 0%
 1%
 0%
 1%
 1%
38%
 1%
39%
 1%
55%
```