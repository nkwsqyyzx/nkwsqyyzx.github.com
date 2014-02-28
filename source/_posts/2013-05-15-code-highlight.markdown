---
layout: post
title: "代码高亮"
date: 2013-05-15 21:09
comments: true
categories: octopress 高亮 Windows
---

<!--more-->
Windows系统需要注意的是,**Python只能使用2.7的版本.**

先来一段JavaScript高亮示例(使用3个反\`):
```javascript JavaScript代码
    var s = "this is javascript test string.";
    alert(s);
```
Objc代码(使用codeblock):
{% codeblock objective-c代码 lang:objc %}
+(void)print:(NSString *)string
{
    NSLog(@"%@",string);
}
{% endcodeblock %}

遗憾的是现在软件中的markdown编辑器都不支持代码高亮预览功能.

下面引入一段包含在文件中的C#代码:
{% include_code lang:csharp testcode.cs %}
以上就是加入代码高亮最常用的3中方法.其中3个反\`看起来更简洁明了.codeblock方式更适合阅读.使用文件方式引入则适合大段代码插入.
