# What is XSYUthesis_xelatex?

XSYUthesis_xelatex is an *unofficial* XeLaTeX template for preparing  master, or doctor thesis in Xi'an Shiyou University.

# 西安石油大学学位论文LaTex模板

本模板根据西安电子科技大学研究生院发布的[研究生学位论文模板（2015版）](http://gr.xidian.edu.cn/system/_content/download.jsp?urltype=news.DownloadAttachUrl&owner=1281831001&wbfileid=2041391)修改而成，并进行修改满足西安石油大学研究生学位论文规定的格式要求。西电研究生院官方发布的模板编译方式为latex，采用GBK编码，仅支持CTeX(2.9.2)。官方模板部分语法老旧，本模板修正了其中存在的一些问题，并且支持xelatex编译，使用时更为便利。模板采用UTF-8编码，支持Linux和TeX Live 2019。

## 如何使用

* 本模板的默认封面为学术性硕士封面。

* 论文和作者的相关信息可在XSYUthesis.cfg文件中进行修改。

* 参考文献在./bib/tex.bib文件中录入。百度学术和谷歌学术均支持BibTeX格式导出，但其中夹杂很多不规范的条目，应注意进行检查。


## 系统需求

本模板需要使用 XeTeX 引擎编译。Linux下编译时需首先配置windows系统中提供的SimSun和SimHei字体。原模板验证无问题的平台为Debian 8 和TeX Live 2016，TeX Live 2017，TeX Live 2019。本模板是在Windows 10(2004)下，安装TexLive2020及Visual Studio Code后，修改制作完成的。

## TexLive的安装
1. 下载[TexLive](http://mirror.ctan.org/systems/texlive/tlnet/install­tl­windows.exe)
2. [安装过程](https://blog.csdn.net/weixin_39892850/article/details/105468247)

## Visual Studio Code的安装
1. [安装过程](https://zhuanlan.zhihu.com/p/106357123)
2. vscode的Latex[环境配置](https://zhuanlan.zhihu.com/p/38178015)

## 字体的安装
我校研究生学位论文封面中使用了方正小标宋。对于windows系统而言，[字体安装](https://www.zhihu.com/question/285154415)，请谨记：安装字体时请右键选择方正小标宋.ttf文件并选择为所有用户安装。当安装好方正小标宋之后，请执行在CMD窗口中执行fc­cache。再执行fc­list :lang=zh>>D:\zh.txt。打开zh.txt找到方正小标宋.ttf所在的行，记下跟在后面的FZXiaoBiaoSong­B05S（本人系统中显示的是这个字族编号，也可能与你不同）。接下来打开XSYUthesis.cls文件，查找”设置小标宋字体”，将命令\setCJKfamilyfont{xbsong}[AutoFakeBold=true]{FZXiaoBiaoSong­B05S}中的FZXiaoBiaoSong­B05S替换为你自己系统中通过fc­list命令查到的字族编号。

## 已知问题
* 使用XeTeX时，AutoFakeBold选项导致复制乱码。模板中在`\begin{document}`后插入一个日文的空格'　'，使得除章节一级标题外其他内容可复制。

* 正文中未见参考文献列表及参考文献为[?]的情况：请在使用xelatex命令之前，多使用bibtex命令编译几遍。

* 在Chapter1.tex文件中的最后一行命令用于去除latex自动生成的偶数空白页，因为LaTeX会给奇数页结束的章节添上空白页。这是有它的道理的，一章总是要从奇数页开始的，如果上一章结束于奇数页，它就会给你加一个空白的偶数页，你把它去掉反而不合乎出版业的规矩。然而，我校奇葩的论文写作规范中给出了不允许章节中出现空白页的情况。针对这种要求，请同学们自行在章末尾添加命令\let\cleardoublepage\clearpage。
## 查重问题
本模板生成的PDF在知网查重符合学校标准，不会产生乱码。

