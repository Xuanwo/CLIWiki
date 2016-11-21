---
title: "css"
date: 2016-11-10 12:06
---
[TOC]

## ul li 横向不换行

```css
#canvaslist{
    list-style:none;
}
#canvaslist li{
    display: inline;
}
```

只需要设置`li`元素的`display`属性为`inline`即可

## 解决CSS缓存问题

如果想让浏览器强制缓存css文件,使用带版本号后缀或内容摘要算法(MD5)的方式来加后缀或者命名文件.

> 带版本号和MD5方式的区别, 假设你让所有css文件都缓存了, 那么当你只更新部分文件, 又不想用户放弃未更新文件的缓存时, 就可以用md5的方式, 这样就只有更新过的文件引用的URL才会变化,导致重新向服务器请求, 而未改变的则继续取用本地缓存.
