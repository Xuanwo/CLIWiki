---
title: "html"
date: 2016-08-20 23:59
---
[TOC]

## 浏览器自适应播放视频

```html
<!DOCTYPE HTML>
<html>
<body>
   <video  width="300" height="200" controls autoplay>
       <source src="/html5/foo.ogg" type="video/ogg" />
       <source src="/html5/foo.mp4" type="video/mp4" />
       Your browser does not support the <video> element.
   </video>
</body>
</html>
```

可以使用带有媒体类型和其他属性的 <source> 标签指定媒体文件。video 元素允许使用多个 source 元素，浏览器会使用第一个认可的格式：
