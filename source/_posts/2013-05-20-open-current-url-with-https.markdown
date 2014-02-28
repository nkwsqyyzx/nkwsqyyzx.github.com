---
layout: post
title: "使用https重新打开当前网页"
date: 2013-05-20 00:38
comments: true
categories: GFW https Vimperator plugin JavaScript
---

由于众所周知的原因,使用Google搜索的时候搜索结果可能会被阻断.这种情况在https下面可能会稍稍好一些.如果你不幸中招,可以使用https再试一下.

基于[Vimperator](http://www.vimperator.org/vimperator)可以很方便的使用plugin来实现此功能.Vimperator的插件是基于JavaScript编写的.比较麻烦的是Vimperator官方的插件文档好像并不是很容易找到.反正我是没有找到啦.

<!--more-->

以下是相关代码,还是比较简单的.
{% include_code lang:javascript OpenWithHttps.js %}

拿到当前buffer的URL,将URL替换为https后重新打开.

当然,如果在你的vimperatorrc中加上
```
:map ,s :OpenWithHttps<CR>
```
使用起来就更加得心应手了.

Enjoy!
