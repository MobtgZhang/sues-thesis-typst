#import "../info.typ": *

= 绪论 <intro>

== 关于Typst模板

本模板是本文为拓展同学门编写硕士学位论文而写的，本项目地址代码均在#link("https://github.com/mobtgzhang/sues-thesis-typst","GitHub")。
论文模板硕士学位论文模板目前问题比较小，可以尝试使用一段时间，所以可以尝试使用以下用其写一些基本的论文。

== 关于Typst
Typst 是一门面向出版与学术写作的可编程标记语言，从2023年4月正式开源v0.1.0版本以来，到现在的2024年2月v0.10.0(2023年12月4日版本)。
这个项目是用Rust语言写的轻量级项目，相对于LaTeX，Typst较为轻量级、编译速度较快，而且语法相对来说较为简单，具有用户友好的文档和教程，适合于文档开发的操作。
目前相对来说对于中文支持比较好，特别是有了CJK语言的支持，成熟稳定了一些。
由于更新速度比较快，所以网上一些Typst教程可能随时失效，注意关注Typst社区最新版本的教程。

== 关于使用平台和方法
Typst是跨平台的文档标记语言，包括有Linux、MacOS和Windows环境中，具体安装方法如下所示：

#figure(
  image("../figures/plugs.jpg", width: 80%),
  caption:"插件的安装方式"
)<section01-plugs-vscode>

+ 安装VSCode：在微软VScode官方上下载即可；
+ 安装LSP：在左边的插件搜索栏中查找对应的插件即可，如#ref(<section01-plugs-vscode>) 所示。
+ 最后可以通过同步编辑`typ`文件可以对文档进行编辑处理，如#ref(<section01-vscode>)所示。


#figure(
  image("../figures/vscode.jpg", width: 80%),
  caption:"VSCode 最后的显示结果"
)<section01-vscode>

== 相关学习资料

- #link("http://ai-assets.404.net.cn/pdf/typst/typst-zh_CN-20230409.pdf","Typst官方文档中文翻译版")；
- #link("http://ai-assets.404.net.cn/pdf/typst/typst-zh_CN-20230409.pdf","Typst中文教程")；
- #link("http://ai-assets.404.net.cn/pdf/typst/typst-zh_CN-20230409.pdf","Typst教程及其参考")；
- #link("http://ai-assets.404.net.cn/pdf/typst/typst-zh_CN-20230409.pdf","Symbol符号速查表 ")；
- #link("http://ai-assets.404.net.cn/pdf/typst/typst-zh_CN-20230409.pdf","Awesome Typst中文版")。



