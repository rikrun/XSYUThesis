# What is XSYUthesis_xelatex?

XSYUthesis_xelatex is an *unofficial* XeLaTeX template for preparing  master, or doctor thesis in Xi'an Shiyou University.

# 西安石油大学学位论文LaTex模板

本模板根据[西安电子科技大学学位论文latex模板](https://github.com/103yiran/XDUthesis_xelatex)修改制作而成，该模板是根据西安电子科技大学研究生院发布的[研究生学位论文模板（2015版）](http://gr.xidian.edu.cn/system/_content/download.jsp?urltype=news.DownloadAttachUrl&owner=1281831001&wbfileid=2041391)修改而成，并进行修改满足西安石油大学研究生学位论文规定的格式要求。西电研究生院官方发布的模板编译方式为latex，采用GBK编码，仅支持CTeX(2.9.2)。官方模板部分语法老旧，本模板修正了其中存在的一些问题，并且支持xelatex编译，使用时更为便利。模板采用UTF-8编码，支持Linux, TeX Live 2020 和MacOS。

本模板未经官方认证，但本人尽力使其接近于西安石油大学《硕士学位论文写作规范》。由于精力有限，目前只有论文首页经过严密比对，近似度达到90%。其他文档组成部分近似度也应该达到85%。可能需要微调的地方例如页边距，行间距，页眉横线的长度等等这样的边边角角。
## 如何使用

* 本模板的默认封面为学术型硕士封面。

* 论文和作者的相关信息可在XSYUthesis.cfg文件中进行修改。

* 参考文献在./bib/tex.bib文件中录入。百度学术和谷歌学术均支持BibTeX格式导出，但其中夹杂很多不规范的条目，应注意进行检查。


## 系统需求

本模板需要使用 XeTeX 引擎编译。Linux/MacOs 下编译时需首先配置 Windows 系统中提供的 SimSun 和SimHei字体。原模板验证无问题的平台为 Debian 8 和 TeX Live 2016，TeX Live 2017，TeX Live 2019。本模板是在Windows 10(2004)下，安装TexLive2020及Visual Studio Code后，修改制作完成的, 并在 TexLive2021, MacTex2021 下验证无问题。

## TexLive的安装
1. 下载[TexLive](http://mirror.ctan.org/systems/texlive/tlnet/install­tl­windows.exe)
2. [安装过程](https://blog.csdn.net/weixin_39892850/article/details/105468247)

## Visual Studio Code的安装
1. [安装过程](https://zhuanlan.zhihu.com/p/106357123)
2. Vscode的Latex[环境配置](https://zhuanlan.zhihu.com/p/38178015)

## 字体的安装
我校研究生学位论文封面中使用了方正小标宋，需要自行安装。请谨记：非必要请勿移动 font/FZxiaobiao.ttf的文件位置，如需移动，请将 XSYUthesis.cls 文件中的命令 \setCJKfamilyfont{xbsong}[AutoFakeBold=true,Path=./font/]{FZxiaobiao.ttf} 中的 Path 设置为移动后的路径。

## 参考文献格式标准
本模板使用gbt7714-2015.bst文件控制参考文献样式，而学校文件中指出的是GB7714-87（显然已经远远落后于时代步伐），用户想要使用不同的参考文献格式，请自行准备.bst文件。将文件放置于模板目录中，并在XSYUthesis.cls文件中找到\bibliographystyle{gbt7714-numerical}命令行进行修改。

## 已知问题
* 使用XeTeX时，AutoFakeBold选项导致复制乱码。模板中在`\begin{document}`后插入一个日文的空格'　'，使得除章节一级标题外其他内容可复制。

* 正文中未见参考文献列表及参考文献为[?]的情况：请在使用xelatex命令之前，多使用bibtex命令编译几遍。

* 在Chapter1.tex文件中的最后一行命令用于去除latex自动生成的偶数空白页，因为LaTeX会给奇数页结束的章节添上空白页。这是有它的道理的，一章总是要从奇数页开始的，如果上一章结束于奇数页，它就会给你加一个空白的偶数页，你把它去掉反而不合乎出版业的规矩。然而，我校奇葩的论文写作规范中给出了不允许章节中出现空白页的情况。针对这种要求，请同学们自行在章末尾添加命令\let\cleardoublepage\clearpage。
* 根据2021届毕业生提供的信息，学校在印刷论文的时候，正文之前部分印刷时采用单面打印且不能包含页眉页脚，本人对XSYUThesis.cls文件进行了修改。修改并不是很完美，目前遇到的问题是，目录页跨页时页码会重复，因此请同学们使用时注意这一点，处理办法是可以采用inkscape软件导入出问题的页手工修改目录页码。切记，打印正文前内容时，请使用单面打印。
## 查重
* 本模板生成的PDF在知网查重符合西电要求，不会产生乱码。
* 本模板生成的PDF于2021年6月被西安石油大学计算机学院研究生首次使用，并通过了知网查重。

## 论文提交
* 本模板生成的PDF论文已通过我校图书馆的提交和审核。
