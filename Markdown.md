# 一、Github 问题集（1）
## 1.github是什么

Github是一个IT技术人员的社交网站，面向开源的以及私有软件项目的托管平台。vcs git svn git版本控制系统，hub
## 2.git是什么
Git版本控制系统
## 3.学习github的5个理由
1）大牛出没，个人主页上的资料资源

2）第一时间了解到产品，技术更新的动向

3）基于git版本控制工具，开发技术，编程语言，测试，项目协调组织记录积累过程。

4）开源。所有项目代码文档和中间过程开放，参与项目，积累项目经验。贡献代码。

5）优质学习资源。托管文档教程，程序代码，自然语言代码。技术资料。Courses库
## 4.github的优势
只支持git 完整协议支持 在线文件编辑 社交网络元素 特色工作模式 私有仓库托管 ruby on rails架构
## 5.通过github年度报告让你记忆最深刻的信息有哪些
GitHub 已经有超过 520 万的用户和超 30 万的组织。这十二月以来，有超过 81 万的人发起了人生第一个 PR，更有 280 万人创造了他自己的第一个仓库。
　而中国，是新用户注册增长最多的国家，基本上翻了一番。

## 6.github上有可以个人账号 还可以有（ 企业）账号
## 7.github上面的两个组成要素是什么
## 8.github上两个重要页面
## 9.主页菜单都包含什么
## 10.仓库的心跳线代表什么
项目活跃度
## 11.star的作用是？
star 翻译过来应该是星星，但是这个翻译没任何具体意义，这里解释为`关注`或者`点赞`更合适，当你点击 star,表示你喜欢这个项目或者通俗点，可以把他理解成朋友圈的点赞吧，表示对这个项目的支持。不过相比朋友圈的点赞，github 里面会有一个列表，专门收集了你所有 start 过的项目，
## 12.fork的作用是？
可译为复刻， 就是把别人的项目clone一份，但是owner变成自己。 这样你就可以在遵守Open source license的前提下任意修改这个项目
## 13.watch的作用是？
关注
watch翻译过来可以称之为观察，点击watch可以看到如下的列表。默认每一个用户都是处于Not watching的状态，当你选择Watching，表示你以后会关注这个项目的所有动态，以后只要这个项目发生变动，如被别人提交了pull request、被别人发起了issue等等情况，你都会在自己的个人通知中心，收到一条通知消息，如果你设置了个人邮箱，那么你的邮箱也可能收到相应的邮件。

## 14.搜索结果分别有哪些类别
## 15.你在github上挖到什么宝

# 二、Github问题集（2）
## 1.个人主页上的“+”下拉菜单可创建的四种类别分别有？分别的意思？
新存储库，导入存储库，新要点，新组织
## 2.如何能将仓库中的html文件直接解析成页面？
在仓库的setting中有网址
## 3.如何删除仓库
在setting中最后一栏
## 4.Bash是什么操作系统的命令
Linux命令
## 5.Pwd是什么命令
显示当前目录路径
## 6.Cd是什么命令
在当前路径创建一个新的文件
## 7.Echo是什么命令
在网页中输出
## 8.配置git用户名的命令
$ git config　user.name nickname#将用户名设为nickname
## 9.配置邮箱的命令
$ git config　user.email nickname@gmail.com #将用户邮箱设为nickname@gmail.com
## 10.命令行换行方式
Echo \
## 11.命令行终结方式
Ctrl+c
## 12.使用命令行比GUI方式有何优势
bash使用的是命令行
GUI
## 13.提交到本地仓库时为什么有暂存区
git是分为工作区和版本库的，工作区就是我们本地看到的工作目录，版本库就是你工作目录中的.git文件第一步是通过add命令将文件添加到暂存区stage中；第二步将暂存区中的数据提交到版本库中，用commit命令，其实就是将stage中的内容提交到当前分支
## 14.新建代码仓库的命令
（1）$ git init
（2）git clone [url]远程控制到本地
## 15.git clone [url] 这个命令的作用是
克隆仓库（下载一个项目和它的整个代码历史）
## 16.添加指定文件到暂存区的命令
$ git add [file1] [file2] ... # 添加指定文件到暂存区
## 17.删除工作区文件，并且将这次删除放入暂存区的命令
$ git rm [file1] [file2] ... 
## 18.改名文件，并且将这个改名文件放入暂存区的命令
    $ git mv [file-original] [file-renamed]
## 19.提交暂存区到仓库的命
$ git commit -m [message] # 提交暂存区所有文件到仓库区,并指定提交说明
## 20.直接从工作区提交到仓库的命令(前提是该文件已经有仓库中的历史版本)
$ git commit -a -m[message]

## 21.显示变更信息的命令
$ git statu
## 22.显示当前分支的历史版本
Git log
Git log --oneline

## 23.查看历史信息的命令
显示commit历史，以及每次commit发生变更的文件   $ git log --stat

## 24.Commit的意义是
提交，是提交代码到仓库。
## 25.Pull的意义是
## 26.Push的意义是

# 三、MarkDown相关问题整理


## 1.MarkDown是什么？
Markdown是一种可以使用普通文本编辑器编写的标记语言，通过简单的标记语法，它可以使普通文本内容具有一定的格式。
## 2.MarkDown的特点？
轻量、简单、通用
## 3.MarkDown的用途？
  文档快速排版。
  
  用于编写说明文档，并且以“README.MD”的文件名保存在软件的目录下面。
  
  除此之外，现在由于我们有了RStudio这样的神级编辑器，我们还可以快速将Markdown转化为演讲PPT、Word产品文档、LaTex论文甚至是用非常少量的代码完成最小可用原型。在数据科学领域，Markdown已经被确立为科学研究规范，极大地推进了动态可重复性研究的历史进程。
## 4.MarkDown的编辑工具有哪些？
  MAC OS：Mou
  
  Linux:Atom  ReText  UberWriter  RStudio  Windows：Mark Pad,MarkdownPad,HBuilder
  
  RStudio  iOS  Byword
## 5.MarkDown的区块元素和区段元素分别包含哪些？          