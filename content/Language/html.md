---
title: html
date: '2016-08-20 23:59'
---

[TOC]

# 浏览器自适应播放视频

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

可以使用带有媒体类型和其他属性的

<source>

 标签指定媒体文件。video 元素允许使用多个 source 元素，浏览器会使用第一个认可的格式：

# HTML `<option>` 标签的 selected 属性

设置 `selected="selected"` 即可

# 设置 Bootstrap 模态对话框只加载一次 remote 数据

首先准备好一个模态对话框：

```html
<div id="myModal" class="modal hide fade">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">x</button>
        <h3>对话框标题</h3>
    </div>
    <div class="modal-body">
        <p>对话框主体</p>
    </div>
    <div class="modal-footer">
        <a href="#" class="btn" data-dismiss="modal">取消</a>
        <a href="#" class="btn btn-primary" data-dismiss="modal">确定</a>
    </div>
</div>
```

调用时可以这样：

```html
<button type="button" data-toggle="modal" data-target="#myModal">打开对话框</button>

or

<a href="#myModal" role="button" class="btn" data-toggle="modal">打开对话框</button>
```

还可以远程加载数据，设置`href`属性即可：

```html
<a href="page.jsp" data-toggle="modal" data-target="#myModal">打开对话框</a>
```

不过这个只会加载一次，需要自己hack一下hidden事件：

```javascript
$("#myModal").on("hidden.bs.modal", function() {
    $(this).removeData("bs.modal");
});
```

# 强制刷新浏览器缓存

![](https://sfault-image.b0.upaiyun.com/292/124/2921246151-5836cbedc9134_articlex)

在打开审查工具的情况下，右键刷新按钮
