---
title: "javascript"
date: 2016-11-18 10:00
---
[TOC]

## 判断字典或对象中是否存在某个键

判断一个key是否存在于数组中(或对象是否包含某个属性)，不能使用`ary[key] == undefined`，因为可能存在`ary = {key:undefined};`
正确的方法应该为：

```nodejs
ary.hasOwnProperty(key);
```

或

```nodejs
obj.hasOwnProperty(key);
```

## 为数组中的每个元素执行指定操作

语法：
```nodejs
array1.forEach(callbackfn[, thisArg])
```

|参数|定义|
|-|-|
|array1|必选。一个数组对象。|
|callbackfn|必选。最多可以接受三个参数的函数。对于数组中的每个元素，forEach 都会调用 callbackfn 函数一次。|
|thisArg|可选。 callbackfn 函数中的 this 关键字可引用的对象。如果省略 thisArg，则 undefined 将用作 this 值。|

对于数组中出现的每个元素，forEach 方法都会调用 callbackfn 函数一次（采用升序索引顺序）。将不会为数组中缺少的元素调用回调函数。
除了数组对象之外，forEach 方法可由具有 length 属性且具有已按数字编制索引的属性名的任何对象使用。

回调函数的语法如下所示：

```nodejs
function callbackfn(value, index, array1)
```
|回调参数|定义|
|-|-|
|Value|数组元素的值。|
|index|数组元素的数字索引。|
|array1|包含该元素的数组对象。|

样例：

```javascript
// Define the callback function.
function ShowResults(value, index, ar) {
    document.write("value: " + value);
    document.write(" index: " + index);
    document.write("<br />");
}

// Create an array.
var letters = ['ab', 'cd', 'ef'];

// Call the ShowResults callback function for each
// array element.
letters.forEach(ShowResults);

// Output:
//  value: ab index: 0
//  value: cd index: 1
//  value: ef index: 2
```

## 将Javascript值序列化为JSON字符串

`JSON.stringify()` 方法可以将任意的 JavaScript 值序列化成 JSON 字符串。若转换的函数被指定，则被序列化的值的每个属性都会经过该函数的转换和处理；若转换的数组被指定，只有包含在这个数组中的属性名才会被序列化到最终的 JSON 字符串中。

### 语法

```
JSON.stringify(value[, replacer [, space]])
```

- value  将要序列化成 JSON 字符串的值。
- replacer *可选*
如果该参数是一个函数，则在序列化过程中，被序列化的值的每个属性都会经过该函数的转换和处理；
如果该参数是一个数组，则只有包含在这个数组中的属性名才会被序列化到最终的 JSON 字符串中；
如果该参数为null或者未提供，则对象所有的属性都会被序列化；
- space *可选*
指定缩进用的空白字符串，用于美化输出（pretty-print）；
如果参数是个数字，它代表有多少的空格；上限为10。改值若小于1，则意味着没有空格；
如果该参数为字符串(字符串的前十个字母)，该字符串将被作为空格；
如果该参数没有提供（或者为null）将没有空格。

### 注意

- 非数组对象的属性不能保证以特定的顺序出现在序列化后的字符串中。
- 布尔值、数字、字符串的包装对象在序列化过程中会自动转换成对应的原始值。
- undefined、任意的函数以及 symbol 值，在序列化过程中会被忽略（出现在非数组对象的属性值中时）或者被转换成 null（出现在数组中时）。
- 所有以 symbol 为属性键的属性都会被完全忽略掉，即便 replacer 参数中强制指定包含了它们。
- 不可枚举的属性会被忽略

## 取一个数组的最后几个值

语法： `array.slice(start,end)`，支持使用负数以表示从末尾开始。

```javascript
var a=[1,2,3,5,7,9,10,11,19];
a.slice(-5);
```
