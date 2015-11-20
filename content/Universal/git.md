---
title: "git"
date: 2015-11-19 19:02:04
---
[TOC]

## 不再跟踪指定文件

```
git rm --cached <file>
```

命令说明：

- `rm --cached` : 从缓存中清除指定文件，支持正则

## 取消对文件的修改

```
git checkout -- <file>
```

命令说明：

- `checkout --` : 抛弃文件修改，返回之前的版本（会覆盖当前文件）

## 取消已经暂存的文件

```
git reset HEAD <file>
```

命令说明：

- `reset HEAD` : 撤销先前的add操作（不会覆盖当前文件）

## 合并多个commit

合并之前的三个提交，首先运行：

```
git rebase -i HEAD~3
```

或者

```
git rebase -i <commitid>
```

*注意，要合并之前的三个提交，后面应当使用你的倒数第四个提交作为参数*

然后文本编辑器将会自动打开，并出现类似如下内容：
```
pick f7f3f6d changed my name a bit
pick 310154e updated README formatting and added blame
pick a5f4a0d added cat-file

# Rebase 710f0f8..a5f4a0d onto 710f0f8
#
# Commands:
#  p, pick = use commit
#  e, edit = use commit, but stop for amending
#  s, squash = use commit, but meld into previous commit
#
# If you remove a line here THAT COMMIT WILL BE LOST.
# However, if you remove everything, the rebase will be aborted.
#
```

> 正如git的注释所说，`pick`将会采用这次commit，而`squash`将会把这个commit合并到前一个当中。

我们将后面两个`pick`修改为`squash`，现在内容如下：

```
pick f7f3f6d changed my name a bit
squash 310154e updated README formatting and added blame
squash a5f4a0d added cat-file
```

保存并退出后，git将会自动应用并产生一个新的提交，保存后三个提交就被合并成了一个。

## 修改line endings之后更新index

首先清除缓存
```
git rm --cached -r .
```

然后重建index
```
git reset --hard
```

参考[此处](https://help.github.com/articles/dealing-with-line-endings/#refreshing-a-repository-after-changing-line-endings)

## Fork后的项目与上游同步

首先需要为自己的库添加上游的同步地址：

```
git remote add upstream https://github.com/place/to/where/you/fork
```

然后就可以执行下列命令来更新本地库：

```
git pull upstream master
git push
```

*如果有志于让自己的代码合并到上游项目，建议保持master始终与上游同步，另开分支来写自己的提交。*