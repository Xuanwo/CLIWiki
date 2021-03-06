---
title: "python"
date: 2016-03-30 10:37
---
[TOC]

## 通过迭代创建字符串

``` python
>>> '+'.join('abc')
a+b+c

>>> '-'.join([1,2,3])
1-2-3
```

`join`函数要求传入一个可迭代的字符型参数，然后会在字符之间插入分隔符。

## 字符串分隔

``` python
>>> '1,2,3'.split(',')
['1', '2', '3']

>>> '1,2,,3,'.split(',')
['1', '2', '', '3', '']
```

`split`函数要求传入一个分隔符，并使用该分隔符来分割字符串，产生一个列表。

> 注意样例2，连续的分隔符同样会在列表中插入一个空值

## 对迭代器的所有元素进行同一操作

``` python
>>> list(map(int, ['1','2','3']))
[1,2,3]
```

`map`函数第一个参数传入一个函数，第二个参数传入一个迭代器。之后会对该迭代器的每一个元素执行传入函数定义的操作，函数返回的结果是一个迭代器，将其转换为list之后再做下一步使用。

## 对迭代器进行求和

``` python
>>> sum([1,2,3])
6
```

`sum`函数非常简单，传入一个可迭代元素即可~

## 字母的大小写变换

``` python
>>> 'pyThon'.upper()
'PYTHON'

>>> 'pyThon'.lower()
'python'

>>> 'pyThon'.capitalize()
'Python'
```

`upper`是将字符串均变为大写，`lower`则是变为小写，而`capitalize`是将字符串第一个字符大写，其它均为小写。


## 字符串去重

### 改变原来顺序

``` python
>>> set('bbaacc')
{'c','b','a'}
```

如果不要求保持原来的顺序的话，只需要直接使用`set()`进行类型转换即可

### 不改变原来顺序（需要优化）

``` python
>>> ans = []
>>> for i in 'bbaacc':
...     if i not in ans:
...             ans.append(i)
['b', 'a', 'c']
```

非常直观而且暴力的写法- -，可能需要更好的姿势。。

## 对迭代器的所有元素判断是否为真

```
>>> all([47%i for i in[4,7,47,74,447,474,477,747,774]])
False
```

`all`函数用于对迭代器的每一个元素判断是否为真，如果全部为真，则返回真，如果为假，则返回假并break。

## 正则模块

```
>>> import re
>>> re.search('h.*e.*l.*l.*o', 'heeeeelxlo')
True
```

`re.search`第一个参数是一个正则表达式，第二参数是待匹配的字符串，匹配成功返回`True`，失败则返回`False`。

## 字符串替换

``` python
>>> '1 3'.replace(' ', '-')
'1-3'
>>> '1 3 4'.replace(' ', '-', 1)
'1-3 4'
```

`replace`函数第一个参数是待替换的字符串，第二个参数是替换后的字符串，第三个参数是替换次数。如果不赋值，则替换全部，如果有值，则只替换给定值次。

> `repalce`返回的是一个拷贝，不会修改原字符串

## 计算表达式的值

``` python
>>> eval('1-3')
-2
```

`eval`函数用于计算字符串所代表的表达式的值。

## 返回元素在列表中的位置

``` python
>>> '2123'.index('1')
1
```

`index`函数用于返回指定元素在迭代器中的位置。

## 统计某元素出现次数

``` python
>>> '112233'.count('1')
2
```

`count`函数用于统计某元素在迭代器中出现的次数

## 控制输出的分隔符与换行符

``` python
>>> print('abc','def')
abc def

>>> print('abc', 'def', end='#')
abc def#
>>> print('abc', 'def', sep='+')
abc+def
```

在`print`函数中：

- `sep`参数用于控制待输出项之间的分隔符，默认为空格
- `end`参数用于控制输出完毕后的结束符号，默认为换行

## 计算元素的个数

```python
>>> len(['1','2','3'])
3
```

`len`函数用于计算容器中元素的个数，区别于`['1','2','3'].__sizeof__()`

## 字符串逆序输出

```python
>>> 'abc'[::-1]
'cba'
```

字符串逆序只需要使用切片的小技巧即可

## 上传wheel分发包

```python
python setup.py bdist_wheel upload
```

## 获取Python版本号

```python
import platform  
print platform.python_version()
# '3.5.1'
```

或者

```python
import sys  
print sys.version
# '3.5.1 (default, Jun 25 2016, 11:22:53) \n[GCC 5.3.1 20160413]'
print sys.version_info
# sys.version_info(major=3, minor=5, micro=1, releaselevel='final', serial=0)
```
