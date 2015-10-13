---
layout: post
title: "迁移博客到VPS"
date: 2015-10-10 14:28
comments: true
categories: nginx vps octopress
---

####引子
种种原因让我8月份的时候决定买一台VPS，选择的是[LOCVPS](http://my.locvps.com/page.aspx?c=referral&u=23005)，优点是其香港的VPS在国内访问速度非常快，ping值稳定在100ms以内。

<!--more-->

在使用该VPS两个月之后为了中转文件，在其上面部署了[nginx](http://nginx.org/en/docs/install.html)，觉得利用率还是有点低，遂起了心思把荒废已久的博客拾起来，将博客host到VPS上。

####VPS相关设置

* 用户账户配置

    首先登陆刚刚购买的VPS，修改root用户的密码为较强密码，root账号只在**非常有必要**的时候才用作登陆账号。
    在shell中输入passwd，按提示更改密码即可.

    root密码更新完成后，输入useradd添加一个普通用户，为该普通用户修改密码（man passwd查看passwd命令帮助文件）。

    将该用户加入到sudoer文件中以避免后续执行sudo时的问题，执行

    ```
    sudo visudo
    ```

    找到其中的*root    ALL=(ALL)       ALL*这一行，仿照这个写法在下面加入你的用户名，或者将你所在的用户组加入到root中

    执行完上述命令只是让你能够以root权限运行命令，但还是需要输入密码认证，可以仿照NOPASSWD行的写法添加一条记录，后续登录后将执行sudo将不再需要密码。

* ssh相关配置

     如果你的本地机器还没有创建过ssh keys，首先要做的是

    ```bash
    ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
    ```

    照选择都选默认，按照提示输入访问密码即可。

    ```
    ssh username@vpshost "mkdir ~/.ssh && cat >> ~/.ssh/authorized_keys && chmod go-w ~/.ssh ~/.ssh/authorized_keys" < ~/.ssh/id_rsa.pub
    ```

    输入密码，上述命令会将本地的公钥传到vps上username的用户家目录的.ssh/authorized_keys中，尝试新开一个终端登录，可以看到就不再需要输入密码了（vps上.ssh文件夹的读写权限非常关键，如果手动创建了.ssh文件夹设置了authorized_keys还是不能免密码认证，检查.ssh文件夹权限）。

####博客搭建过程

   * nginx

[nginx](http://nginx.org/en/docs/install.html)是一款俄罗斯人开发的非常精简、高性能的网页服务器，在静态网页服务器方面表现尤为出色，用来搭建个人博客正是非常好的选择。

安装方法参考[官方文档](http://nginx.org/en/docs/install.html)即可。

   * octopress

个人博客一般都采用静态网页，[octopress](https://github.com/imathis/octopress)是大多数个人博客首选，配合github的pages功能可以方便在github上host自己的博客，具体方法参考[链接](http://blog.devtang.com/blog/2012/02/10/setup-blog-based-on-github/)。

   * nginx配置

   nginx安装完成后，在/etc/nginx/conf.d/下新建文件blog.conf，填入如下内容：

   {% include_code lang:sh blog.conf %}

   上诉文件中指明博客所在的位置为/var/www/blog/，你可以将其链接为你的博客所在路径（一定要确保nginx运行用户具有博客路径的读权限）。

   * 更新博客

   参考octopress，新建博客，撰写博客，预览之后，可以采用rsync的方式将博客内容上传到vps，命令如下：

   ```
   rsync -avz --delete your/local/blog/dir username@vpshost:/server/blog/dir
   ```
