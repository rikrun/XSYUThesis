\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{XSYUthesis}[2020/06/01 XSYU, Thesis document class, version 0.1.0]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%   class and packages

%%%%%%%%%%%%%%%%%%%%
%% Options
%%%%%%%%%%%%%%%%%%%%

%% disable oneside option
\DeclareOption{oneside}{\OptionNotUsed}


%% print version or electronic version
\newif\ifXSYU@Option@PrintVersion \XSYU@Option@PrintVersiontrue
\DeclareOption{pversion}{\XSYU@Option@PrintVersiontrue}
\DeclareOption{eversion}{\XSYU@Option@PrintVersionfalse}

%% info
\newif\ifXSYU@Option@info \XSYU@Option@infotrue
\DeclareOption{noinfo}{\XSYU@Option@infofalse}

%% ref
\newif\ifXSYU@Option@ref@sort \XSYU@Option@ref@sortfalse
\newif\ifXSYU@Option@ref@compress \XSYU@Option@ref@compressfalse
\DeclareOption{refsort}{\XSYU@Option@ref@sorttrue}
\DeclareOption{refcompress}
  {\XSYU@Option@ref@sorttrue\XSYU@Option@ref@compresstrue}

%% others
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessOptions\relax

%%%%%%%%%%%%%%%%%%%%
%% load class and packages
%%%%%%%%%%%%%%%%%%%%

%% book
%%
%\LoadClass[zihao=-4,UTF8,twoside,fontset=windows]{ctexbook}
\LoadClass[zihao=-4,UTF8,twoside,fontset=none]{ctexbook}
\RequirePackage[a4paper]{geometry}
%% calc
\RequirePackage{calc}

%% ifthen
\RequirePackage{ifthen}


\RequirePackage[titles]{tocloft}

\RequirePackage{caption}

\RequirePackage{diagbox}
%% natbib
\ifXSYU@Option@ref@sort
  \ifXSYU@Option@ref@compress
    \RequirePackage[numbers,sort&compress,super,square]{natbib}
  \else
    \RequirePackage[numbers,sort,super,square]{natbib}
  \fi
\fi
\newcommand*{\citens}[2][]{%
  \begingroup
  \let\NAT@mbox=\mbox
  \let\@cite\NAT@citenum
  \let\NAT@space\NAT@spacechar
  \let\NAT@super@kern\relax
  \renewcommand\NAT@open{[}%
  \renewcommand\NAT@close{]}%
  \cite[#1]{#2}%
  \endgroup
}


%% hyperref
\RequirePackage[pdfencoding=auto]{hyperref}

%% color
\ifXSYU@Option@PrintVersion\relax\else
  \RequirePackage{color}
\fi

%% config file
\AtEndOfPackage{\makeatletter\input{XSYUthesis.def}\makeatother}
\AtEndOfPackage{\makeatletter\input{XSYUthesis.cfg}\makeatother}
\AtEndOfPackage{\makeatletter\renewcommand{\numberline}[1]{%
\settowidth\@tempdimb{#1\hspace{0.25em}}%
\ifdim\@tempdima<\@tempdimb%
  \@tempdima=\@tempdimb%
\fi
\hb@xt@\@tempdima{\@cftbsnum #1\@cftasnum\hfil}\@cftasnumb}\makeatother}
\AtEndOfPackage{\makeatletter\@addtoreset{equation}{chapter}\makeatother}
\AtEndOfPackage{\makeatletter \renewcommand{\figurename}{图} \renewcommand{\tablename}{表}
 \def\@caption#1[#2]#3{%
   \\
   \addcontentsline{\csname ext@#1\endcsname}{#1}%
                   {\protect\numberline{\csname #1name\endcsname\hskip0.5em\csname the#1\endcsname}%
                   {\ignorespaces #2}}%
   \begingroup
   \@parboxrestore
   \if@minipage
   \@setminipage
   \fi
   \normalsize
   \@makecaption{\csname fnum@#1\endcsname}{\ignorespaces #3}\\
   \endgroup}
 \renewcommand*\l@figure{\@dottedtocline{1}{0em}{4em}}
 \let\l@table\l@figure \makeatother}



%%%%%%%%%%%%%%%%%%%%
%% setup packages
%%%%%%%%%%%%%%%%%%%%
%% setup
\ifXSYU@Option@PrintVersion
  \hypersetup{
    CJKbookmarks,
    bookmarksnumbered,
    plainpages    = false,
    pdfstartview  = FitH
  }
\else
  \definecolor{XSYU@hypercolor@darkgreen}{rgb}{0.1,0.5,0.1}
  \hypersetup{
    CJKbookmarks,
    bookmarksnumbered,
    colorlinks,
    linkcolor     = black,
    anchorcolor   = black,
    citecolor     = black,
    urlcolor      = black,
    plainpages    = false,
    pdfstartview  = FitH
  }
\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%   utilities

\DeclareRobustCommand{\XSYU@toc@add}[1]
  {\phantomsection\addcontentsline{toc}{chapter}{#1}}

%% underline
\def\CJKunderlinecolor{}
\def\XSYU@@underline[#1]#2{\underline {\hbox to #1{\hfill{#2}\hfill}}}
\DeclareRobustCommand{\XSYU@underline}
  {\@ifnextchar[\XSYU@@underline\underline }

\DeclareRobustCommand*{\XSYU@bold}{\bfseries}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%    font
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{mathrsfs}
\RequirePackage{calrsfs}
\@ifpackageloaded{fontspec}{
    \PassOptionsToPackage{no-math}{fontspec}
}{
    \RequirePackage[no-math]{fontspec}
}
\setmainfont{Times New Roman}
\RequirePackage{mathspec}
\setmathsfont{Times New Roman}
%\usepackage{xeCJK}
% 设置文档正文字体为宋体
%\setCJKmainfont[BoldFont=SimHei]{SimSun}
%\setCJKmonofont{SimSun}     % 设置缺省中文字体
%\setCJKfamilyfont{song}[AutoFakeBold=1]{SimSun}                             %宋体 song
\setCJKfamilyfont{song}[AutoFakeBold=true]{SimSun}                             %宋体 song
\newcommand{\song}{\CJKfamily{song}}
\setCJKfamilyfont{fsong}[AutoFakeBold=true]{STFangsong}                             %宋体 song
\newcommand{\fsong}{\CJKfamily{fsong}}
%设置小标宋字体
%\setCJKfamilyfont{xbsong}[AutoFakeBold=true]{FZXiaoBiaoSong-B05S}
\setCJKfamilyfont{xbsong}[AutoFakeBold=true,Path=./font/]{FZxiaobiao.ttf}                           %宋体 song
\newcommand{\xbsong}{\CJKfamily{xbsong}}
%\setCJKfamilyfont{hei}{SimHei}                              %黑体  hei
%\setCJKfamilyfont{hei}[AutoFakeBold=1]{SimHei}                              %黑体  hei
\setCJKfamilyfont{hei}[AutoFakeBold=true]{SimHei}                              %黑体  hei
\newcommand{\hei}{\CJKfamily{hei}}

%% family
\DeclareRobustCommand*{\XSYU@font@st}{\song}
\DeclareRobustCommand*{\XSYU@font@ht}{\hei}

%% size
\DeclareRobustCommand*{\XSYU@font@zihao}[1]{\zihao{#1}\setlength{\baselineskip}{20pt}}

\renewcommand*{\baselinestretch}{1}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%    document setting
%% 页面设置区域
%% 参考网址：https://en.wikibooks.org/wiki/LaTeX/Page_Layout
%% page ql head
\RequirePackage{geometry}
\geometry{a4paper,left=29mm,right=20mm,top=25mm,bottom=25mm,includefoot=false,includehead=false}
\setlength{\voffset}{-10mm}
\setlength{\topmargin}{0mm}
\setlength{\headheight}{25pt}
\setlength{\headsep}{0mm}
\setlength{\footskip}{7.5mm}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%    head and foot

\RequirePackage{fancyhdr}
%% remove header from empty page

%\setlength{\headwidth}{\textwidth-4pt-4pt}%
%% label of even page header
\def\XSYU@hdr@thesistitle
  {\XSYU@label@university\XSYU@value@degreemark\XSYU@value@thesis}

\newcommand{\makeheadrule}{%定义正文页页眉线绘制命令，单线
\rule[0.7\baselineskip]{\headwidth}{0.4pt}}
%% the double line under header
\renewcommand{\headrulewidth}{0.5pt}
\newcommand{\makedoubleheadrule}{%
\makebox[0pt][l]{\rule[9pt]{\headwidth}{0.5pt}}%
\rule[8pt]{\headwidth}{0.5pt}}
\renewcommand{\headrule}{%
{\if@fancyplain\let\headrulewidth\plainheadrulewidth\fi
\makeheadrule}}


%\renewcommand{\headrule}{%
%    {\if@fancyplain\let\headrulewidth\plainheadrulewidth\fi
%    %\vskip 1pt%
%    \hrule\@height\headrulewidth\@width\headwidth
%    \hrule\@height\headrulewidth\@width\headwidth
%    \vskip-1\headrulewidth
%    %\vskip-1pt
%    }
%}
\let\origheadrule\headrule
\let\origfootrule\footrule
\fancypagestyle{normalpage}{%
  \fancyhf{}%
  \renewcommand{\headrulewidth}{0.0pt}%
  \renewcommand{\footrulewidth}{0.0pt}%
  \fancyhf[cof,reh]{\XSYU@font@zihao{5}\thepage}%
  %\fancyhf[lof,leh]{{\footnotesize  \textbf{Title}} \textbullet ~ \footnotesize Vol. 1, Number 1, 2016 \textbullet ~Text}%
  \def\headrule{%
      \ifodd\value{page}\relax\else\origheadrule\fi}%
  \def\footrule{%
    \ifodd\value{page}\origfootrule\else\fi}%

}
%% set header
\fancypagestyle{plain}{
    \pagestyle{fancy}
}
\fancypagestyle{abstractfancy}{
  \thispagestyle{fancy}
  \fancyhf{}
  \fancyhead[C]{{\XSYU@font@st\XSYU@font@zihao{5}中文摘要}}
  \fancyfoot[C]{{\XSYU@font@st\XSYU@font@zihao{-5}\thepage}}
}
\fancypagestyle{abstractefancy}{
  \thispagestyle{fancy}
  \fancyhf{}
  \fancyhead[C]{{\XSYU@font@st\XSYU@font@zihao{5}英文摘要}}
  \fancyfoot[C]{{\XSYU@font@st\XSYU@font@zihao{-5}\thepage}}
}
\fancypagestyle{contentfancy}{
  \thispagestyle{fancy}
  \fancyhf{}
  \fancyhead[C]{{\XSYU@font@st\XSYU@font@zihao{5}目\hspace*{3em}录}}
  \fancyfoot[C]{{\XSYU@font@st\XSYU@font@zihao{-5}\thepage}}
}
\fancypagestyle{resumefancy}{
  \thispagestyle{fancy}
  \fancyhf{}
  \fancyhead[C]{{\XSYU@font@st\XSYU@font@zihao{5}攻读硕士学位期间参加科研情况及获得的学术成果}}
  \fancyfoot[C]{{\XSYU@font@st\XSYU@font@zihao{-5}\thepage}}
}
\fancypagestyle{appendixfancy}{
  \thispagestyle{fancy}
  \fancyhf{}
  \fancyhead[C]{{\XSYU@font@st\XSYU@font@zihao{5}附录}}
  \fancyfoot[C]{{\XSYU@font@st\XSYU@font@zihao{-5}\thepage}}
}

\fancypagestyle{mainfancy}{
    \thispagestyle{fancy}
    \fancyhf{}
    \fancyhead[CE]{{\XSYU@font@st\XSYU@font@zihao{5}\XSYU@hdr@thesistitle}}
    \fancyhead[CO]{{\XSYU@font@st\XSYU@font@zihao{5}\nouppercase\leftmark}}
    \fancyfoot[C]{{\XSYU@font@st\XSYU@font@zihao{-5}\thepage}}
}

\fancyhf{}
\fancyhead[C]{{\XSYU@font@st\XSYU@font@zihao{5}\nouppercase\leftmark}}
\fancyfoot[C]{{\XSYU@font@st\XSYU@font@zihao{-5}\thepage}}

%% par skip
%\parskip 0pt plus 6pt minus 0pt

%% section level
\setcounter{secnumdepth}{4}

%% chapter
\ctexset { chapter = {
                        name={\XSYU@font@st\XSYU@chapter@prenumber,\XSYU@font@st\XSYU@chapter@afternumber },
                        number={\XSYU@font@st\chinese {chapter}},
                        format={\centering  \XSYU@font@zihao {3}},
                        nameformat={},
                        numberformat={},
                        aftername={\quad },
                        titleformat={},
                        beforeskip={6pt},
                        afterskip={18pt},
                        indent={0pt}
                    }
}

%% chapter without number
\DeclareRobustCommand{\XSYU@nchapter}[1]{\chapter*{#1}\markboth{#1}{}}
\DeclareRobustCommand{\XSYU@nlchapter}[1]{\chapter*{#1}\markboth{#1}{}}
%% section
\ctexset { section = {
                      name={,},
                      number={\thesection },
                      format={\raggedright \XSYU@bold \XSYU@font@st \XSYU@font@zihao {4}},
                      nameformat={},
                      numberformat={},
                      aftername={\quad },
                      titleformat={},
                      beforeskip={18pt plus 0pt minus 0pt},
                      afterskip={12pt},
                      indent={0pt}
                     }
}

%% subsection
\ctexset { subsection = {
                         name={,},
                         number={\thesubsection},
                         format={\raggedright \XSYU@bold \XSYU@font@st \XSYU@font@zihao {4}},
                         nameformat={},
                         numberformat={},
                         aftername={\quad },
                         titleformat={},
                         beforeskip={12pt plus 0pt minus 0pt},
                         afterskip={6pt},
                         indent={0em}
                        }
}

%% subsubsection
\ctexset { subsubsection = {
                            name={,},
                            number={\thesubsubsection},
                            format={\raggedright \XSYU@font@st \XSYU@font@zihao {4}},
                            nameformat={},
                            numberformat={},
                            aftername={\quad },
                            titleformat={},
                            beforeskip={6pt plus 0pt minus 0pt},
                            afterskip={0pt}, indent={4em}
                           }
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%    figure and table

%% figure name
\ctexset { figurename={\XSYU@font@zihao {5}\XSYU@label@figure@cap } }

%% table name
\ctexset { tablename={\XSYU@font@zihao {5}\XSYU@label@table@cap } }
\newcommand{\tabincell}[2]{\begin{tabular}{@{}#1@{}}#2\end{tabular}} %转行

\renewcommand{\theequation}{\arabic{chapter}-\arabic{equation}}
%% 使用短线图、表编号
\renewcommand {\thetable} {\thechapter{}-\arabic{table}}
\renewcommand {\thefigure} {\thechapter{}-\arabic{figure}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%    chinese  cover 封面设置
%% ql first
\DeclareRobustCommand{\XSYU@make@cover}
{{\setlength{\parindent}{0pt}\thispagestyle{empty}%
    \normalfont\XSYU@font@st\XSYU@font@zihao{2}\setlength{\baselineskip}{30pt}%
    \makebox[\textwidth]{\rule{0pt}{12cm}}
    \rule[-3.2cm]{0pt}{3.2cm}\parbox[t]{\textwidth}{%
    \begin{center}%
        {\XSYU@bold\XSYU@value@thesis@title}%
    \end{center}%
    }
    \makebox[\textwidth]{\rule{0pt}{3.5cm}}
    \rule[-3.2cm+15pt]{0pt}{3.2cm}\hspace{3cm}\parbox[t]{9cm}{%
    \XSYU@font@zihao{4}\setlength{\baselineskip}{30pt}%
    \newlength{\linelength}
    \setlength{\linelength}{9cm-4.5em}
    \XSYU@bold\XSYU@font@ht{作者姓名~}\XSYU@font@st\XSYU@underline[\linelength]{\XSYU@value@author@name}\\%
    \setlength{\linelength}{9cm-9.5em}
    \XSYU@bold\XSYU@font@ht{指导教师姓名、职称~}\XSYU@font@st\XSYU@underline[\linelength]{\XSYU@value@advisor@name~\XSYU@value@advisor@title}\\%
    \setlength{\linelength}{9cm-6.5em}
    \XSYU@bold\XSYU@font@ht{申请学位类别~}\XSYU@font@st\XSYU@underline[\linelength]{\XSYU@value@degree}%
    }
\clearpage\thispagestyle{empty}\setlength{\parindent}{2\ccwd}\cleardoublepage}}

\DeclareRobustCommand{\XSYU@make@title}
  {{\setlength{\parindent}{0pt}\thispagestyle{empty}%

  \vspace{-10pt}
  \hspace{-20pt}
    \normalfont\XSYU@font@st\renewcommand{\baselinestretch}{1.2}\zihao{4}%
    \rule{0pt}{1.35cm}\parbox[b]{6cm}{
        \XSYU@bold\XSYU@label@cover@classification\XSYU@underline[3cm]{\XSYU@value@thesis@classification}\par%
        %\XSYU@bold\XSYU@label@cover@UDC\XSYU@underline[73pt]{\XSYU@value@thesis@UDC}\par%
        \vspace{2pt}%
        \XSYU@bold\XSYU@label@cover@confidential\XSYU@underline[3cm]{\XSYU@value@thesis@confidential}%
    }
    \hfill\parbox[b]{8cm}{
      \hspace{65pt}
        \XSYU@bold\XSYU@label@cover@studentNo\XSYU@underline[3cm]{\XSYU@value@thesis@studentNo}\par%
        \vspace{2pt}%
        \quad{}%
    }
\vspace{0pt}
\renewcommand{\baselinestretch}{1}%

    %\vspace{2.05cm}%
    \vspace{10pt}
    \begin{figure}[htbp]
      \centering
      \includegraphics[width=0.4\linewidth]{figures/uni_name}
    \end{figure}%
    \vspace{-70pt}
    \makebox[\textwidth]{\rule{0pt}{4.5cm}\shortstack[c]{
        \XSYU@bold\XSYU@font@ht\XSYU@font@zihao{1}\setlength{\baselineskip}{30pt}\xbsong\zihao{-2}\XSYU@label@stutype\\%
        \vspace{10pt} \\%
        \hspace{-15pt}\XSYU@bold\XSYU@font@st\XSYU@font@zihao{-1}\setlength{\baselineskip}{30pt}\zihao{0}\XSYU@value@cover@degreemark\XSYU@value@cover@thesis%
    }}
    \vspace{35pt}
    \begin{figure}[htbp]
      \centering
      \hspace{-10pt}\includegraphics[width=4cm]{figures/uni_logo}
    \end{figure}%

    \vspace{35pt}
    \hspace{0cm}\parbox{14.88cm}{
        \hei\XSYU@font@zihao{3}\setlength{\baselineskip}{32pt}%
        {\hspace{0.1cm}\XSYU@label@cover@title}\hspace{0.5em}\XSYU@underline[10.56cm]\XSYU@value@thesis@title\\
        \vspace{0.5em}
        {\XSYU@label@cover@empty}\hspace{0.5em}\XSYU@underline[10.56cm]\XSYU@value@THesis@titles\\
        \vspace{0.5em}
        {\XSYU@label@cover@author}\hspace{0.5em}\XSYU@underline[10.56cm]\XSYU@value@author@name\\%
        \vspace{0.5em}
        {\zihao{-4}\XSYU@label@cover@advisor}\hspace{0.5em}\XSYU@underline[10.56cm]\XSYU@value@advisor@name\\%
        \vspace{0.5em}
        {\XSYU@label@cover@major}\hspace{0.5em}\XSYU@underline[10.56cm]\XSYU@value@author@major\\%
        \vspace{0.5em}
        {\XSYU@label@cover@submit@date}\hspace{0.5em}\XSYU@underline[10.56cm]\XSYU@value@thesis@submit@date%

    }
   \clearpage\thispagestyle{empty}%
   \renewcommand{\baselinestretch}{1}%
   \setlength{\parindent}{2\ccwd}\cleardoublepage}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%    english  cover

%\DeclareRobustCommand{\XSYU@make@titleenglish}
%  {{\cleardoublepage\setlength{\parindent}{0pt}\thispagestyle{empty}%
%    \normalfont\XSYU@font@st%
%
%    \rule[-3.5cm]{0pt}{3.5cm}\parbox[t]{\textwidth}{%
%    \XSYU@font@zihao{2}\setlength{\baselineskip}{30pt}%
%    \begin{center}%
%        {\XSYU@bold\XSYU@evalue@thesis@title}%
%    \end{center}%
%    }
%    \rule{0pt}{2.5cm}%
%    \rule[-5.5cm]{0pt}{5.5cm}\parbox[t]{\textwidth}{%
%    \XSYU@font@zihao{3}\setlength{\baselineskip}{30pt}%
%    \begin{center}%
%A\space\XSYU@evalue@papertype\space submitted to\\\XSYU@elabel@university\\%
%in partial fulfillment of the requirements \\ for the degree of\space\XSYU@evalue@degree%
%\\ in\space\XSYU@evalue@author@major%
%    \end{center}%
%    }
%    \rule{0pt}{7.2cm}%
%    \rule[-4.5cm]{0pt}{4.5cm}\parbox[t]{\textwidth}{%
%    \XSYU@font@zihao{3}\setlength{\baselineskip}{30pt}%
%    \begin{center}%
%By \\%
%\XSYU@evalue@author@name\\%
%\XSYU@elabel@cover@advisor\XSYU@evalue@advisor@name~~{Title:}\XSYU@evalue@advisor@title\\%
%\XSYU@evalue@thesis@submit@date\\%
%    \end{center}%
%    }
%   \clearpage\thispagestyle{empty}%
%   \setlength{\parindent}{2\ccwd}\cleardoublepage}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 去除空白页页码clearemptydoublepage
\let\origdoublepage\cleardoublepage
\newcommand{\clearemptydoublepage}{%
  \clearpage
  {\pagestyle{empty}\origdoublepage}%
}
%% 加强版的cleardoublepage命令
\renewcommand\cleardoublepage{%
\clearpage
%\ifodd\value{page}\else\stepcounter{page}\fi
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%    statement and copyright 配置创新性声明使用授权的说明
\DeclareRobustCommand{\XSYU@make@statementandcopyright}
  {{\cleardoublepage\setlength{\parindent}{0pt}
  \thispagestyle{empty}%
  \thispagestyle{normalpage}%应用normalpage风格，去除页眉横线
  \normalfont\XSYU@font@st%
   \begin{center}%
     \bfseries\XSYU@font@zihao{3}\hei%
     \XSYU@label@stat@statement%
   \end{center}%
   \XSYU@font@zihao{-4}%
   \hspace*{2em}\setlength{\parindent}{2\ccwd}\XSYU@value@stat@statement\setlength{\parindent}{0pt}%
  \vskip 20pt%
   \hspace*{2em}\XSYU@lable@stat@auther\XSYU@underline[100pt]{}\hspace*{1em}%
    \hfill \XSYU@lable@stat@date\XSYU@underline[100pt]{}\hspace*{1em}
  \vskip 120pt%
   \begin{center}%
     \bfseries\XSYU@font@zihao{3}\hei%
     \XSYU@lable@stat@copyright%
   \end{center}%
   \XSYU@font@zihao{-4}%
   \hspace*{2em}\setlength{\parindent}{2\ccwd}\XSYU@value@stat@copyright\setlength{\parindent}{0pt}%
  \vskip 20pt%
   \normalfont\XSYU@font@st\XSYU@font@zihao{-4}%
   \hspace*{2em}\XSYU@lable@stat@auther\XSYU@underline[100pt]{}\hspace*{1em}%
    \hfill \XSYU@lable@stat@date\XSYU@underline[100pt]{}\hspace*{1em}%
  \vskip 20pt%
   \hspace*{2em}\XSYU@lable@stat@advisor\XSYU@underline[100pt]{}\hspace*{1em}%
    \hfill \XSYU@lable@stat@date\XSYU@underline[100pt]{}\hspace*{1em}%
    \vskip 60pt%
    \XSYU@value@stat@confidential
  \vskip \stretch{1}%
  \clearpage\thispagestyle{empty}%
  \setlength{\parindent}{2\ccwd}\cleardoublepage}}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%    abstract

%%下文中的\addtocounter{page}{-1}用于调整页码编号
%% chinese abstract
\newenvironment{abstract}
  {%\XSYU@toc@add{\XSYU@toc@abstract}
  \thispagestyle{empty}
  \pagestyle{abstractfancy}
  %\thispagestyle{abstractfancy}
  \noindent{\textbf{\XSYU@label@abstract@title\XSYU@value@thesis@title\XSYU@value@THesis@titles}\\%
  \textbf{\XSYU@label@abstract@procession\XSYU@value@author@major}\\%
  \textbf{\XSYU@label@abstract@stu\XSYU@value@author@name\XSYU@value@thesis@signature\XSYU@underline[3cm]}\\%
  \textbf{\XSYU@label@abstract@instructor\XSYU@value@advisor@name\XSYU@value@thesis@signature\XSYU@underline[3cm]}}\\%
  \vskip 10pt
  \begin{center}
    \XSYU@font@zihao{4}\textbf{\XSYU@label@abstract}\\
  \end{center}
  \vskip -10pt
  \par{\XSYU@font@zihao{-4}}}
  \clearpage
  %{\addtocounter{page}{-1}}%如果不要页眉页脚，改为\clearemptydoublepage

%% chinese keywords
\DeclareRobustCommand{\keywords}[1]
  {{\setlength{\parindent}{0pt}%
   \normalfont\XSYU@font@st\bfseries\XSYU@font@zihao{-4}%
   \vskip 0pt
   \XSYU@label@keywords%
   \normalfont\XSYU@font@st\XSYU@font@zihao{-4}%
   {#1}\setlength{\parindent}{2\ccwd}}\\
   \textbf{\XSYU@label@abstract@studytype\XSYU@value@thesis@studytype}\\\\
   \XSYU@label@abstract@acknowledgement
   }


%% english abstract
\newenvironment{englishabstract}
  {%\XSYU@toc@add{\XSYU@etoc@abstract}
  \thispagestyle{empty}
  %\thispagestyle{abstractefancy}
  \pagestyle{abstractefancy}
  \begin{table}[]
    \setlength{\tabcolsep}{0mm}{
      \begin{tabular}{lp{13cm}}
        \textbf{\XSYU@elabel@abstract@title}&\textbf{\XSYU@evalue@thesis@title} \\
        \textbf{\XSYU@elabel@abstract@speciality}&\textbf{\XSYU@evalue@author@major}  \\
        \textbf{\XSYU@elabel@abstract@name}&\textbf{\XSYU@evalue@author@name\XSYU@evalue@thesis@signature\XSYU@underline[3cm]}\  \\
        \textbf{\XSYU@elabel@abstract@instructor}&\textbf{\XSYU@evalue@advisor@name\XSYU@evalue@thesis@signature\XSYU@underline[3cm]}
      \end{tabular}}
      \end{table}
  \begin{center}
    \XSYU@font@zihao{4}\textbf{\XSYU@elabel@abstract}\\
  \end{center}
   \vspace{-2ex}\setlength{\parindent}{0pt}\normalfont\XSYU@font@zihao{-4}%
   \setlength{\parindent}{0pt}}
   \clearpage

%% english keywords
\DeclareRobustCommand{\englishkeywords}[1]
  {{\setlength{\parindent}{0pt}\vspace{2ex}%
   \normalfont\XSYU@font@st\bfseries\XSYU@font@zihao{-4}%
   \vskip -10pt
   \XSYU@elabel@keywords~%
   \normalfont\XSYU@font@st\XSYU@font@zihao{-4}%
   {#1}\setlength{\parindent}{2\ccwd}}\\
   \XSYU@elabel@abstract@acknowledgement}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%    content
    \renewcommand{\cftdot}{\ldots}
    \renewcommand{\cftdotsep}{0.1}
    \setlength{\cftbeforechapskip}{0pt}
    \setlength{\cftbeforesecskip}{0pt}
    \setlength{\cftbeforesubsecskip}{0pt}
    \renewcommand{\cftchapfont}{\XSYU@font@st\XSYU@font@zihao{-4}}
    \renewcommand{\cftsecfont}{\XSYU@font@st\XSYU@font@zihao{-4}}
    \renewcommand{\cftsubsecfont}{\XSYU@font@st\XSYU@font@zihao{-4}}
    \renewcommand{\cftchapleader}{\cftdotfill{\cftchapdotsep}}
    \renewcommand{\cftchapdotsep}{\cftdotsep}
    \renewcommand{\cftchappagefont}{\XSYU@font@st\XSYU@font@zihao{-4}}
    \renewcommand{\cftsecpagefont}{\XSYU@font@zihao{-4}}
    \renewcommand{\cftsubsecpagefont}{\XSYU@font@zihao{-4}}
    \renewcommand{\cftfigfont}{\XSYU@font@st\XSYU@font@zihao{-4}}
    \renewcommand{\cftloftitlefont}{\XSYU@font@st\XSYU@font@zihao{-4}}
    \renewcommand{\cftfigpagefont}{\XSYU@font@st\XSYU@font@zihao{-4}}
    \renewcommand{\cfttabfont}{\XSYU@font@st\XSYU@font@zihao{-4}}
    \renewcommand{\cftlottitlefont}{\XSYU@font@st\XSYU@font@zihao{-4}}
    \renewcommand{\cfttabpagefont}{\XSYU@font@st\XSYU@font@zihao{-4}}

    \setlength{\abovecaptionskip}{0pt}
    \setlength{\belowcaptionskip}{0pt}
    %%\renewcommand{\captionlabeldelim}{\ ~}%去冒号
    \DeclareCaptionLabelSeparator{twospace}{\ ~}
    \captionsetup{labelsep=twospace}
    %% 图表标题字体及字体大小设置
    \renewcommand{\captionfont}{\XSYU@font@ht\XSYU@font@zihao{5}}

%% list of figures
%\ctexset { listfigurename={\XSYU@label@listoffigures } }
%\DeclareRobustCommand{\XSYU@listoffigures}
%  {\XSYU@toc@add{\XSYU@toc@listoffigures}%
%    \listoffigures}

%% list of tables
%\ctexset { listtablename={\XSYU@label@listoftables } }
%\DeclareRobustCommand{\XSYU@listoftables}
%  {\XSYU@toc@add{\XSYU@toc@listoftables}%
%    \listoftables}

%% list of Symbols
\newenvironment{symbollist}
  {\setlength{\parindent}{0pt}%\XSYU@toc@add{\XSYU@toc@symbollist@title}%
   \XSYU@nchapter{\XSYU@label@symbollist@title}\setlength{\parindent}{2\ccwd}%
   \begin{list}{}
    {\setlength{\topsep}{0pt}\setlength{\itemsep}{0pt}\setlength{\parsep}{0pt}
    \setlength{\parindent}{0pt}\normalfont\XSYU@font@st\XSYU@font@zihao{-4}
     \setlength{\leftmargin}{0.5\labelwidth}}}
  {\end{list}\setlength{\parindent}{2\ccwd}\clearpage}

%% list of abbreviations
\newenvironment{abbreviationlist}
  {\setlength{\parindent}{0pt}%\XSYU@toc@add{\XSYU@toc@abbreviationlist@title}%
   \XSYU@nchapter{\XSYU@label@abbreviationlist@title}\setlength{\parindent}{2\ccwd}%
   \begin{list}{}
    {\setlength{\topsep}{0pt}\setlength{\itemsep}{0pt}\setlength{\parsep}{0pt}
    \setlength{\parindent}{0pt}\normalfont\XSYU@font@st\XSYU@font@zihao{-4}
     \setlength{\leftmargin}{0.5\labelwidth}}}
  {\end{list}\setlength{\parindent}{2\ccwd}\cleardoublepage}

%% content
\ctexset {contentsname={\vskip -20pt  \XSYU@label@content \vskip -15pt  }}
\DeclareRobustCommand{\XSYU@tableofcontents}
  {\tableofcontents}
%\renewcommand{\cftdotsep}{0.3pt}
%\newcommand\mydot[1]{\scalebox{#1}{.}}
%\renewcommand\cftdot{\mydot{1}} % change the size of dots
%\renewcommand\cftdotsep{0.3} % change the space between dots

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%    referrence
\RequirePackage{url}
\renewcommand{\UrlFont}{\XSYU@font@zihao{-4}}
\ctexset { bibname={\XSYU@label@ref@title } }
\bibliographystyle{gbt7714-numerical}

\renewenvironment{thebibliography}[1]
  {\XSYU@toc@add{\XSYU@toc@ref@title}%
   \XSYU@nchapter{\bibname}%
   \XSYU@font@zihao{-4}%
   \@mkboth{\MakeUppercase\bibname}{\MakeUppercase\bibname}%
   \list{\@biblabel{\@arabic\c@enumiv}}%
    {\setlength{\topsep}{0pt}\setlength{\itemsep}{0pt}\setlength{\parsep}{0pt}
    \settowidth\labelwidth{\@biblabel{#1}}%
     \leftmargin\labelwidth\advance\leftmargin\labelsep%
     \@openbib@code\usecounter{enumiv}\let\p@enumiv\@empty%
     \renewcommand\theenumiv{\@arabic\c@enumiv}}%
   \sloppy\clubpenalty4000\@clubpenalty\clubpenalty%
   \widowpenalty4000\sfcode`\.\@m}
  {\def\@noitemerr{\@latex@warning{Empty `thebibliography' environment}}%
   \endlist
   \cleardoublepage
   }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%    thanks

\renewenvironment{thanks}
  {\XSYU@toc@add{\XSYU@toc@thanks}%
   \XSYU@nchapter{\XSYU@label@thanks}}
  {\cleardoublepage}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%    appendix

\renewenvironment{appendix}
  {\XSYU@toc@add{\XSYU@toc@appendix}%
   \thispagestyle{empty}

   \thispagestyle{appendixfancy}
   ~
   \flushleft\XSYU@font@zihao{4}\textbf{\XSYU@label@appendix}\\
  }
  {\cleardoublepage}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%    resume

%% environment
\newenvironment{resume}
  {\setlength{\parindent}{0pt}\XSYU@toc@add{\XSYU@toc@resume@title}%
  ~
  \thispagestyle{empty}
  \thispagestyle{resumefancy}
  \begin{center}
    \XSYU@font@zihao{4}\textbf{\XSYU@toc@resume@title}\\
  \end{center}
   %\XSYU@nchapter{\bf\XSYU@label@resume@title}%
   \renewcommand{\thesection}{\arabic{section}}\setlength{\parindent}{2\ccwd}}
  {\cleardoublepage}

%% resume list
\newcounter{XSYU@counter@resumelistcounter}
\newenvironment{resumelist}[1]
  {{\subsection*{\textbf{#1}}\setlength{\parindent}{2\ccwd}}%
   \begin{list}{[\arabic{XSYU@counter@resumelistcounter}]}
    {\usecounter{XSYU@counter@resumelistcounter}
     \setcounter{XSYU@counter@resumelistcounter}{0}
     \setlength{\topsep}{0pt}\setlength{\itemsep}{0pt}\setlength{\parsep}{0pt}
     \setlength{\parindent}{0pt}\normalfont\XSYU@font@st\XSYU@font@zihao{-4}
     \setlength{\leftmargin}{2\labelwidth}}}
  {\end{list}}

\newenvironment{resumelist*}
  {\begin{list}{}
    {\setlength{\topsep}{0pt}\setlength{\itemsep}{0pt}\setlength{\parsep}{0pt}
    \setlength{\parindent}{0pt}\normalfont\XSYU@font@st\XSYU@font@zihao{-4}
     \setlength{\leftmargin}{\labelwidth}}}
  {\end{list}}

%% resume list item
\DeclareRobustCommand{\resumelistitem}{\item{}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%    thesis structure

%% front matter
\DeclareRobustCommand{\XSYUfrontmatter}
  {\XSYU@make@title%
   %\XSYU@make@titleenglish%
   %\XSYU@make@cover%
   \frontmatter\pagenumbering{Roman}
   \XSYU@make@statementandcopyright%
   %
   \setlength{\baselineskip}{20pt}
   }

%% premain matter
\DeclareRobustCommand{\XSYUpremainmatter}
  {\clearemptydoublepage
    \pagestyle{contentfancy}
    \XSYU@tableofcontents\cleardoublepage%

    %\XSYU@listoffigures\cleardoublepage%
   %\XSYU@listoftables\cleardoublepage%
  }
%% main matter
\DeclareRobustCommand{\XSYUmainmatter}
  { \pagestyle{mainfancy}
    \mainmatter
  }

%% back matter
\DeclareRobustCommand{\XSYUbackmatter}[1]
  {\backmatter{}#1{}}
