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
%% This program is ...
%%
%% This program is free software: you can redistribute it and/or modify
%% it under the terms of the GNU General Public License as published by
%% the Free Software Foundation, either version 3 of the License, or
%% (at your option) any later version.
%%
%% This program is distributed in the hope that it will be useful,
%% but WITHOUT ANY WARRANTY; without even the implied warranty of
%% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%% GNU General Public License for more details.
%%
%% You should have received a copy of the GNU General Public License
%% along with this program.  If not, see <http://www.gnu.org/licenses/>.
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
\LoadClass[cs4size, fancyhdr, hyperref, twoside,adobefonts]{ctexart}

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
\RequirePackage[fleqn]{amsmath}
\RequirePackage{titletoc}

%====== English Font =====%
\setmainfont{Times New Roman MT Std}
% Comments by hy_hauyun:
%	Times New Roman MT Std or Times New Roman
%	I use Windows 7, the fontname is Times New Roman.
%	It's dilivered with Win7 and provied by Monotype.
%	Is Times New Roman MT Std Adobe's font?
%====== 中文字体 ======%
\setCJKmainfont{方正精宋简体}

%====== 字体属性 ======%
\renewcommand{\normalsize}{\zihao{-4}}
\renewcommand{\large}{\zihao{4}}
\renewcommand{\Large}{\zihao{-3}}
\renewcommand{\huge}{\zihao{3}}
\renewcommand{\small}{\zihao{5}}

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

%设置页眉
\fancyhf{}
\renewcommand{\headrule}{%设置页眉双线
\hrule height0.5pt width\headwidth
\vspace{0.5pt}
\hrule height0.5pt width\headwidth
}
\renewcommand{\sectionmark}[1]{\markleft{\thesection #1}}
\pagestyle{fancy}
\fancyhead[CE]{ \small西安交通大学本科毕业设计（论文）}
%设置页脚
\fancyfoot[RO]{\Roman{page}}
\fancyfoot[LE]{\Roman{page}}
%设置行距
\renewcommand{\baselinestretch}{1.2}%1.2为1.5倍行距，1.6为2倍行距

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

\renewcommand{\section}{\@startsection{section}{1}{0pt}{3ex}{5ex}{\vspace*{2ex}\huge\centering}}
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
\newcommand{\chabstractname }{\huge 摘 \quad 要}
\newenvironment{chabstract}{
%页眉
\fancyhead[CO]{ \small 摘 \quad 要}
      \if@twocolumn \section *{\chabstractname }\else \zihao
{-4} \begin {center}{ \chabstractname \vspace {-.5em}\vspace {\z@
}}\end {center} \par \fi
}{\par}
\newcommand{\chkeywords}[1]{\hskip -0.92cm{\vspace{1ex} \small {\bf关键词：}#1}\relax}

%=== English ===%
\newcommand{\enabstractname }{\huge \fontspec{Times New Roman MT Std} ABSTRACT}
\newenvironment{enabstract}{
%设置段行距
\setlength\parskip{1ex}
%设置段首缩进
\setlength\parindent{0em}
%摘要内容
      \if@twocolumn \section *{\enabstractname }\else \zihao
{-4} \fontspec{Times New Roman MT Std} \begin {center}{ \enabstractname \vspace {-.5em}\vspace {\z@
}}\end {center} \par\fi
%页眉
\fancyhead[CO]{ \small ABSTRACT}
}{
%恢复行距
\setlength\parskip{0ex}
%恢复段首缩进
\setlength\parindent{2\ccwd}
\par}
\newcommand{\enkeywords}[1]{\hskip -0.88cm{\vspace{1ex}\small \fontspec{Times New Roman MT Std} {\bf KEY WORDS ：}#1}\relax}
%且英文关键词字号设置有问题，不知是否为大小写的差异
%关键词并没有左对齐，且英文摘要内容用小四号Times New Roman MT Std，摘要正文每段开头不空格，每段之间空一行，未实现
%QinYuguo::英文摘要字体使用了\fontspec实现,现在是Times New Roman MT Std.
%QinYuguo::实现英文摘要段首不缩进，段间空一行

%====== TOC ======%

%页眉
\let\oldtableofcontents\tableofcontents
\renewcommand{\tableofcontents}{
\fancyhead[CO]{ \small 目\quad录}
\oldtableofcontents
}
%设置目录格式
\titlecontents{section}[0pt]{}{\contentslabel{1em}}{}{\titlerule*[1mm]{.}\contentspage}[]
\titlecontents{subsection}[2em]{}{\contentslabel{2em}}{}{\titlerule*[1mm]{.}\contentspage\normalsize}[]
\titlecontents{subsubsection}[4em]{}{\contentslabel{2.8em}\normalsize}{}{\titlerule*[1mm]{.}\contentspage\normalsize}[]
\renewcommand{\contentsname}{\huge 目\quad录}

%====== mainmatter ======%

\newcommand{\mainbodyformat}{
%页眉
\fancyhead[CO]{ \small \leftmark}
%页脚
\ifodd\thepage{}
\else{\mbox{}\newpage}%如果正文开始在偶数页则自动补充一页空白
\setcounter{page}{1}
\lfoot{}
\rfoot{}
\fancyfoot[RO]{\arabic{page}}
\fancyfoot[LE]{\arabic{page}}
%设置字体
\normalsize 
}



%====== Appendix ======%
%附录在自动生成目录时并未出现在目录中，不知如何处理
\newcounter{appends} %附录计数器
\newcounter{appendshead}%附录页眉计数器
\setcounter{appends}{1} %初始化为1
\setcounter{appendshead}{0}%初始化为0
\newcommand{\appendixs}[1]{
%设置页眉
\fancyhead[CO]{ \small 附录\theappendshead \hspace{0.15cm} #1}
\section*{附录\arabic{appends}  \hspace{0.15cm}#1}
\addcontentsline{toc}{section}{附录\arabic{appends} \hspace{0.15cm} #1} 
%计数器加1
\addtocounter{appends}{1} 
\addtocounter{appendshead}{1} 
}



%=============主要符号================%
%试图复制清华模板，但失败了。。。
\newenvironment{denotation}[1][2.5cm]{
  \section*[]{主要符号表} % no tocline
  \noindent\begin{list}{}%
    {\vskip-30bp\normalsize
     \renewcommand\makelabel[1]{##1\hfil}
     \setlength{\labelwidth}{#1} % 标签盒子宽度
     \setlength{\labelsep}{0.5cm} % 标签与列表文本距离
     \setlength{\itemindent}{0cm} % 标签缩进量
     \setlength{\leftmargin}{\labelwidth+\labelsep} % 左边界
     \setlength{\rightmargin}{0cm}
     \setlength{\parsep}{0cm} % 段落间距
     \setlength{\itemsep}{0cm} % 标签间距
    \setlength{\listparindent}{0cm} % 段落缩进量
    \setlength{\topsep}{0pt} % 标签与上文的间距
   }}{\end{list}}


%============参考文献与标注==============%

% Comments by hy_haoyun:
%	To design a bst is a lot of pain. There seems to be no need to modify this.


%清华模板中有已设置好的格式，但不知如何使用thubib.bst。如若自己设置应如何做？

%=================脚注==================sh
\renewcommand{\thefootnote}{\raisebox{.5pt}{\textcircled{\raisebox{-.5pt}{\scriptsize \arabic{footnote}}}}} 

%====== Acknowledgement ======%
\newcommand{\mythanksname}{\huge 致 \quad 谢}
\newenvironment{mythanks}{
\fancyhead[CO]{ \small 致 \quad 谢}
       \section *{\mythanksname } 
}{\par 
\addcontentsline{toc}{section}{致谢}
%使用\addcontentsline{toc}{chapter}{致谢}将致谢添加到目录中.
}