% !Mode:: "TeX:UTF-8"
%%
%%
%%  MCMTHESIS.cls  CopyLeft 2011/8/24 by
%%  wanghongxin <>
%%  hugo <>
%%  hy_haoyun <haoyun_tex@163.com>
%%
%%  Department of mathematics, School of science, Xi'an JIaotong University
%%  No.28, Xianning West Road, Xi'an, Shaanxi, 710049, P.R. China
%%
%% This program is (description HERE!)
%%
%% This program is free software: 
%% 
%% LPPL license HERE!
%%
%%


\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{xjtubsc}[2012/12/20 xjtuthesis Ver 1.0]
\typeout{something here, if necessary}

%======= options =======%
\ProcessOptions\relax

%======= base calss ======%
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexart}}
\ProcessOptions\relax
%\LoadClass[cs4size, fancyhdr, hyperref, twoside]{ctexart}
\LoadClass[cs4size, hyperref, twoside]{ctexart}
%\def\newblock{\hskip .11em plus .33em minus .07em}

% Comments by hy_haoyun
%	option openright may by included.
%	Try using \include rather than \input in the document.

%======= packages ======%

% Comments by hy_haoyun
%	Please only include all the indispensable packages
%	Do NOT include paakges that is not needed for the template. 
%	This can save the time to load the documentclass as well as
%	to avoid the incompatibility and errors when users load packages 
%	that have been loaded in the cls.

\RequirePackage{amssymb}
\RequirePackage[fleqn]{mathtools} % advanced than amsmath
\RequirePackage{titletoc}
\RequirePackage{titleps}
\RequirePackage{ifxetex}
\RequirePackage{enumerate}
\RequirePackage{url}
\RequirePackage{cite}
%=====color=========%
\hypersetup{%
  bookmarksnumbered=true,
  bookmarksopen=true,
  bookmarksopenlevel=1,
  breaklinks=true,
  colorlinks=false,
  plainpages=false,
  pdfpagelabels,
  pdfborder=0 0 0}
%====== English Font =====%
\ifxetex
	\setmainfont{Times New Roman}
\else
	\usepackage[scaled=.93]{newtxtext}
	\RequirePackage{newtxmath}
\fi
% Comments by hy_haoyun
%	Times New Roman MT Std or Times New Roman
%	I use Windows 7, the fontname is Times New Roman.
%	It's dilivered with Win7 and provied by Monotype.
%	Is Times New Roman MT Std Adobe's font?
%	There are many alternatives for Times-like font.
%	Option 1:
%		\RequirePackage[scaled=.93]{newtxtext}
%		\RequirePackage{newtxmath}  % I think we can add an option for set mathfont in Times.
%			%or \RequirePackage{mathptmx}  
%		\ProvideTextCommandDefault{\nobreakspace}{\leavevmode\nobreak\ } % for XeTeX only.
%	Option 2:
%		\RequirePackage{times}
%	Option 3:
%		\setmainfont{TeX Gyre Termes}
%	Option 4:
%		\usepackage{unicode-math}
%		\setmainfont{XITS}
%		\setmathfont{XITS Math}

%====== Chinese Font ======%
%\setCJKmainfont{方正精宋简体}

%====== 字体属性 ======%

% Comment by hy_haoyun
%	The followings are taken from ctex-class.def 
%	I modified them to fit our requirement

\renewcommand\normalsize{% 正文——小四号
  \@setfontsize\normalsize{\CTEX@fs@sfour}{\CTEX@fs@sfourskip}%
  \abovedisplayskip 12\p@ \@plus3\p@ \@minus7\p@
  \abovedisplayshortskip \z@ \@plus3\p@
  \belowdisplayshortskip 6.5\p@ \@plus3.5\p@ \@minus3\p@
  \belowdisplayskip \abovedisplayskip
  \let\@listi\@listI}
\normalsize
\renewcommand\small{% 图题和表题、脚注、页眉、“关键词”、关键词内容、参考文献内容——五号
  \@setfontsize\small{\CTEX@fs@five}{\CTEX@fs@fiveskip}%
  \abovedisplayskip 11\p@ \@plus3\p@ \@minus6\p@
  \abovedisplayshortskip \z@ \@plus3\p@
  \belowdisplayshortskip 6.5\p@ \@plus3.5\p@ \@minus3\p@
  \def\@listi{\leftmargin\leftmargini
              \topsep 9\p@ \@plus3\p@ \@minus5\p@
              \parsep 4.5\p@ \@plus2\p@ \@minus\p@
              \itemsep \parsep}%
  \belowdisplayskip \abovedisplayskip}
\renewcommand\footnotesize{% 小五、规定前后矛盾，一处“脚注一律五号”，一处“一般小五号字”。
  \@setfontsize\footnotesize{\CTEX@fs@sfive}{\CTEX@fs@sfiveskip}%
  \abovedisplayskip 10\p@ \@plus2\p@ \@minus5\p@
  \abovedisplayshortskip \z@ \@plus3\p@
  \belowdisplayshortskip 6\p@ \@plus3\p@ \@minus3\p@
  \def\@listi{\leftmargin\leftmargini
              \topsep 6\p@ \@plus2\p@ \@minus2\p@
              \parsep 3\p@ \@plus2\p@ \@minus\p@
              \itemsep \parsep}%
  \belowdisplayskip \abovedisplayskip}
\renewcommand\scriptsize{% 六号
  \@setfontsize\scriptsize{\CTEX@fs@six}{\CTEX@fs@sixskip}}
\renewcommand\tiny{% 小六
  \@setfontsize\tiny{\CTEX@fs@ssix}{\CTEX@fs@ssixskip}}
\renewcommand\large{% 三级标题——四号
  \@setfontsize\large{\CTEX@fs@four}{\CTEX@fs@fourskip}}
\renewcommand\Large{% 二级标题——小三
  \@setfontsize\Large{\CTEX@fs@sthree}{\CTEX@fs@sthreeskip}}
\renewcommand\LARGE{% 一级标题、“摘要”，“Abstract”——三号
  \@setfontsize\LARGE{\CTEX@fs@three}{\CTEX@fs@threeskip}}
\renewcommand\huge{% 二号
  \@setfontsize\huge{\CTEX@fs@two}{\CTEX@fs@twoskip}}
\renewcommand\Huge{% 一号
  \@setfontsize\Huge{\CTEX@fs@one}{\CTEX@fs@oneskip}}

%====== page layout ======%
\RequirePackage[hmargin = 2.6 true cm, %
	top = 3.0 true cm, %
	bottom = 2.5 true cm, %
	a4paper,]%
{geometry}

% comments by hy_haoyun:
%	it's required that
%		纸型为A4（21.0 cm×29.7cm）标准，双面打印。
%		页边距：上、下、左、右、装订线的页边距分别为：3.0cm, 2.5cm, 2.6cm, 2.6cm, 0cm，
%		装订线位置：左。
%		左右对称页边距。
% 	I think we may take care about the definition of margin in TeX and the Word. 

% Comments by hy_haoyun:
%	I didn't modify the following settings for header, pagenumber and linespread.

% Note! There is an warnning HERE! (2013-01-22)
%	Package Fancyhdr Warning: \headheight is too small (12.0pt): 
%	Make it at least 14.14998pt.
%	We now make it that large for the rest of the document.
%	This may cause the page layout to be inconsistent, however.

%\renewcommand{\headrule}{%设置页眉双线
	%\hrule height 0.5pt width \textwidth
	%\vspace{0.5pt}
	%\hrule height 0.5pt width \textwidth
%}

% Comment by hy_haoyun
% I would like to set the header and foot using *titleps* in an uniform way.
% There are more things to do than my expectation. 
% QUICK HELP
% \sethead[偶页眉左][偶页眉中][偶页眉右]{奇页眉左}{奇页眉中}{奇页眉右}
%\setfoot[偶页脚左][偶页脚中][偶页脚右]{奇页脚左}{奇页脚中}{奇页脚右}
%
%	\newpagestyle{document}{
%		\headrule
%		\sethead%
%		[][\small西安交通大学本科毕业设计（论文）][]{}{}{}
%		\setfoot%
%		[\thepage][][]{}{}{\thepage}
%		}
%	\pagestyle{document}
%
%== frontmatter ==%
\def\frontmatter{%
		\cleardoublepage
	\pagestyle{document}\pagenumbering{roman}}
	\def\mainmatter{%
		\cleardoublepage
		\pagestyle{document}\pagenumbering{arabic}}	
	

%设置行距
\renewcommand{\baselinestretch}{1.2}%1.2为1.5倍行距，1.6为2倍行距
	

%设置页眉
%\fancyhf{}
%\renewcommand{\headrule}{%设置页眉双线
%\hrule height0.5pt width\headwidth
%\vspace{0.5pt}
%\hrule height0.5pt width\headwidth
%}
%\renewcommand{\sectionmark}[1]{\markleft{\thesection #1}}
%\pagestyle{fancy}
%\fancyhead[CE]{\small西安交通大学本科毕业设计（论文）}
%设置页脚
%\fancyfoot[RO]{\Roman{page}}
%\fancyfoot[LE]{\Roman{page}}



%== mainmatter ==%
%\newcommand{\mainmatter}{
%页眉
%\fancyhead[CO]{ \small \leftmark}
%页脚
%\ifodd
	%\thepage{}
%\else
	%{\mbox{}\newpage}%如果正文开始在偶数页则自动补充一页空白
%\fi
%\setcounter{page}{1}
%\lfoot{}
%\rfoot{}
%\fancyfoot[RO]{\arabic{page}}
%\fancyfoot[LE]{\arabic{page}}
%设置字体
%\normalsize 
%}
\newpagestyle{main}{
\sethead[][\small西安交通大学本科毕业设计（论文）][] % even
{}{\sectiontitle}{}       % odd
\setfoot[\thepage][][] % even
{}{}{\thepage}              % odd
\renewcommand{\makeheadrule}{%
\makebox[0pt][l]{\rule[-0.2\baselineskip]{\linewidth}{0.5pt}}%
\rule[-0.28\baselineskip]{\linewidth}{0.5pt}}
} 

\newpagestyle{document}{
\sethead[][\small西安交通大学本科毕业设计（论文）][] % even
{}{\thesection \quad \sectiontitle}{}       % odd
\setfoot[\thepage][][] % even
{}{}{\thepage}              % odd
\renewcommand{\makeheadrule}{%
\makebox[0pt][l]{\rule[-0.2\baselineskip]{\linewidth}{0.5pt}}%
\rule[-0.28\baselineskip]{\linewidth}{0.5pt}}
} 


%===== matter =====%
	\def\frontmatter{%
		\cleardoublepage
		\pagestyle{main}\pagenumbering{Roman}}
	\def\mainmatter{%
		\cleardoublepage
	\pagestyle{document}\pagenumbering{arabic}}
	\def\latermatter{%
		\cleardoublepage
	\pagestyle{main}}	

%====== displaymath ======%

% Comments by hy_haoyun:
%	\ccwd is defined in ctex package. It's the length of one Chinese
%	character with the separation between two characters considered.

\setlength{\mathindent}{2\ccwd}
\numberwithin{equation}{section}
\renewcommand{\theequation}{\arabic{section}-\arabic{equation}}


%====== titles ======%

% Comments by hy_haoyun:
%	The titles can be formated using the \CTEXsetup defined in ctex package.
%	I will make it when I am free.
%	The followings are contributed by Hugo.

\renewcommand{\section}{\@startsection{section}{1}{0pt}{0.1ex}{5ex}{\vspace*{2ex}\huge\centering}}
\renewcommand{\subsection}{\@startsection{subsection}{1}{0pt}{9.4mm}{4.7mm}{\Large}}
\renewcommand{\subsubsection}{\@startsection{subsubsection}{1}{0pt}{1ex}{0.1ex}{\large}}
%已经实现对一、二、三级标题的要求（包括上下空行），虽然Ugly。。。有图片的章节不太正常。。。如果适当调整图片大小可以正常


%====== captions ======%

% Comments by hy_haoyun:
%	The followings should be improved.
\RequirePackage{float}
\RequirePackage{caption}
\captionsetup{labelformat=simple,labelsep=quad,font=small}
\captionsetup[table]{position=top,belowskip={1bp},aboveskip=-2bp}
\captionsetup[figure]{position=bottom,belowskip={1bp},aboveskip=-2bp}
%图表按章编号
\numberwithin{figure}{section}
\numberwithin{table}{section}
\renewcommand{\thefigure}{\arabic{section}-\arabic{figure}}
\renewcommand{\thetable}{\arabic{section}-\arabic{table}}


%==============封面及任务书===========%

%这个嘛，到时再处理

%====== Abstract ======%

% Comments by hy_haoyun:
%	The followings should be improved.
% 	\fontspec should be avoided!
%	\zihao should be avoided!
%	\sontti should be avoided!

%=== Chinese ===%
\newcommand{\chabstractname }{\LARGE 摘\hspace{2\ccwd}要}
\newenvironment{chabstract}{
%页眉
%\fancyhead[CO]{\small 摘\hspace{2\ccwd}要}
\sectionmark{\small 摘要}
\if@twocolumn 
	\section*{\chabstractname}
\else
	\begin{center}
		{\chabstractname \vspace {-.5em}\vspace {\z@}}
	\end{center}\par
\fi}{\par}
\newcommand{\chkeywords}[1]{\hskip -0.92cm{\vspace{1ex} \small {\bfseries 关键词：}#1}\relax}

%=== English ===%
\newcommand{\enabstractname}{\LARGE ABSTRACT}
\newenvironment{enabstract}{
\sectionmark{\small ABSTRACT}
\setlength\parskip{1ex}	% 设置段行距
\setlength\parindent{0em}	% 设置段首缩进
%\fancyhead[CO]{\small ABSTRACT}
\if@twocolumn
	\section*{\enabstractname}
\else 
	\begin{center}
		{\enabstractname \vspace {-.5em}\vspace{\z@}}
	\end {center}\par
\fi}{%
\setlength\parskip{0ex}	% 恢复行距
\setlength\parindent{2\ccwd}% 恢复段首缩进
\par}

\newcommand{\enkeywords}[1]{\hskip -0.88cm{\vspace{1ex}\small {\bfseries KEY WORDS ：}#1}\relax}

%且英文关键词字号设置有问题，不知是否为大小写的差异
%关键词并没有左对齐，且英文摘要内容用小四号Times New Roman MT Std，摘要正文每段开头不空格，每段之间空一行，未实现
%QinYuguo::英文摘要字体使用了\fontspec实现,现在是Times New Roman MT Std.
%QinYuguo::实现英文摘要段首不缩进，段间空一行

%====== TOC ======%

%页眉
\let\oldtableofcontents\tableofcontents
\renewcommand{\tableofcontents}{
%\fancyhead[CO]{目\hspace{\ccwd}录}
\sectionmark{\small目录}
\oldtableofcontents
}
%设置目录格式
\titlecontents{section}[0pt]{}{\contentslabel{1em}}{}{\titlerule*[1mm]{.}\contentspage}[]
\titlecontents{subsection}[2em]{}{\contentslabel{2em}}{}{\titlerule*[1mm]{.}\contentspage\normalsize}[]
\titlecontents{subsubsection}[4em]{}{\contentslabel{2.8em}\normalsize}{}{\titlerule*[1mm]{.}\contentspage\normalsize}[]
\renewcommand{\contentsname}{目\hspace{2\ccwd}录}




%====== Appendix ======%
%附录在自动生成目录时并未出现在目录中，不知如何处理
\newcounter{appends} %附录计数器
\newcounter{appendshead}%附录页眉计数器
\setcounter{appends}{1} %初始化为1
\setcounter{appendshead}{0}%初始化为0
\newcommand{\appendixs}[1]{
%设置页眉
%\fancyhead[CO]{ \small 附录\theappendshead \hspace{0.15cm} #1}
\sectionmark{\small 附录\arabic{appends}  \hspace{0.15cm}#1}
\section*{附录\arabic{appends}  \hspace{0.15cm}#1}
\addcontentsline{toc}{section}{附录\arabic{appends} \hspace{0.15cm} #1} 
\refstepcounter{appendshead}
%计数器加1
\addtocounter{appends}{1} 
\addtocounter{appendshead}{1} 
}



%=============主要符号================%
\newenvironment{denotation}{\section*{主要符号表}
%\fancyhead[CO]{\small 主要符号表}
\sectionmark{\small 主要符号表}
\addcontentsline{toc}{section}{主要符号表}
\begin{list}{}{
\renewcommand{\makelabel}[1]{##1\hfil}
\vskip-30bp\normalsize
\setlength{\labelwidth}{2.5cm}
\setlength{\labelsep}{0.5cm} % 标签与列表文本距离
\setlength{\itemindent}{\ccwd} % 标签缩进量
\setlength{\leftmargin}{3cm} % 左边界
\setlength{\rightmargin}{0cm}
\setlength{\parsep}{0cm} % 段落间距
\setlength{\itemsep}{0cm} % 标签间距
\setlength{\listparindent}{0cm} % 段落缩进量
\setlength{\topsep}{0pt} % 标签与上文的间距
}
}{\end{list}}


%============参考文献与标注==============%

% Comments by hy_haoyun:
%	To design a bst is a lot of pain. There seems to be no need to modify this.


%QinYuguo::哥重写了个bst~~
\def\mybibliography#1
{%\fancyhead[CO]{ \small 参考文献}
\sectionmark{\small 参考文献}
\bibliographystyle{newbibsty}
\renewcommand{\refname}{\huge 参考文献}
\mbox{}
\addcontentsline{toc}{section}{参考文献}
\bibliography{#1}

}


%=================脚注==================sh
\renewcommand{\thefootnote}{\raisebox{.5pt}{\textcircled{\raisebox{-.5pt}{\scriptsize \arabic{footnote}}}}} 

%====== Acknowledgement ======%
\newcommand{\mythanksname}{致 \quad 谢}
\newenvironment{mythanks}{
%\fancyhead[CO]{致 \quad 谢}
       \section *{\mythanksname } 
         \sectionmark{\small 致 \quad 谢}
\addcontentsline{toc}{section}{致谢}%使用\addcontentsline{toc}{chapter}{致谢}将致谢添加到目录中.
}{\par}