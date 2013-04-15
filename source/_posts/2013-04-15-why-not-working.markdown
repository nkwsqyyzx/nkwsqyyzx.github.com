---
layout: post
title: "why not working?"
date: 2013-04-15 03:36
comments: true
categories: 
---

Windows上面压根不能部署，发现是ssh证书的问题，跑到Ubuntu上发现部署之后没有效果。

update:
经过细细研究，总算找到了原因。原来再重新clone源之后需要重新运行
rake setup_github_pages.
总算能够发布博客啦.
下一步争取把公司的电脑也给弄上.
