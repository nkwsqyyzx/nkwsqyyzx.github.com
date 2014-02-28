---
layout: post
title: "Fuck The Great Fucking Wall"
date: 2013-11-19 13:16
comments: true
categories: GFW https Vimperator plugin JavaScript
---

参考上一篇文章[使用https重新打开当前网页](/blog/2013/05/20/open-current-url-with-https/)，上一篇中实现了在被阻断之后用https重试的快捷命令，但最近被折腾的实在是烦不胜烦，于是想到了更进一步，如果被阻断，自动用https重试一次。

<!--more-->

基于[Vimperator](http://www.vimperator.org/vimperator)可以很方便的使用plugin来实现此功能.Vimperator的插件是基于JavaScript编写的.再次吐槽下Vimperator Script的开发文档是那么那么的不全。


在测试过程中你可以在Vimperator的normal模式下输入如下命令进行调试：

``` bash
:js liberator.echo('');
```
总之是比较苦逼的工作。各种查看网页元素之后，确定了在网页中有errorTitleText的标签元素就初步认为是被阻断的url的简单思路。然后使用正则表达式判断当前的url是否满足被阻断url的特征，如果满足则使用https替换当前url重新打开。

以下是相关代码,还是比较简单的.
{% include_code lang:javascript ReloadWithHttps.js %}

自定义命令完成之后，在你的vimperatorrc中加入如下自动命令配置就可以向GFW阻断google搜索结果说拜拜了：
``` bash
autocmd DOMLoad .* ReloadWithHttps <tab>
```

