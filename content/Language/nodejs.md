---
title: "nodejs"
date: 2016-06-12 21:00
---
[TOC]

## 配置国内镜像源

由于特殊国情，在国内需要配置镜像源才能正常使用npm下载及更新包。

### 临时使用

```
npm --registry https://registry.npm.taobao.org install <package>
```

### 持久使用

```
npm config set registry https://registry.npm.taobao.org
```

## 发布包到npm

首先你需要添加一个账户：

```
npm adduser
```

然后输入用户名，密码，邮箱即可。

然后你需要创建跟包有关的信息：

```
npm init
```

按照指引输入相关信息即可，暂时留空也没关系，你可以后续再修改`package.json`文件。

编辑好之后执行：

```
npm publish
```

即可将包推送到npm上。
