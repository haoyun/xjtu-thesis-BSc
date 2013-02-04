% !Mode:: "TeX:UTF-8"
%
%
%  MCMTHESIS.cls  CopyLeft 2011/8/24 by
%  wanghongxin <>
%  hugo <>
%  hy_haoyun <haoyun_tex@163.com>
%
%  Department of mathematics, School of science, Xi'an JIaotong University
%  No.28, Xianning West Road, Xi'an, Shaanxi, 710049, P.R. China
%
% This program is (description HERE!)
%
% This work may be distributed and/or modified under the
% conditions of the LaTeX Project Public License, either version 1.3
% of this license or (at your option) any later version.
% The latest version of this license is in
%   http://www.latex-project.org/lppl.txt
% and version 1.3 or later is part of all distributions of LaTeX
% version 2005/12/01 or later.
%
% This work has the LPPL maintenance status `maintained'.
% 
% The Current Maintainer of this work is M. Y. Name.
%
% This work consists of the files pig.dtx and pig.ins
% and the derived file pig.sty.


\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{xjtubsc}[2012/12/20 xjtuthesis Ver 1.0]
%\typeout{something here, if necessary}

%======= options =======%

\newif\ifXJTU@print \XJTU@printfalse
\newif\ifXJTU@times \XJTU@timesfalse

\DeclareOption{print}{\XJTU@printtrue}
\DeclareOption{truetimes}{\XJTU@timestrue}
\DeclareOption{c5size}{\OptionNotUsed}
\DeclareOption{twocolumn}{\OptionNotUsed}


\ProcessOptions\relax

%======= base calss ======%
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexart}}
\ProcessOptions\relax
\LoadClass[cs4size, hyperref, twoside, UTF8]{ctexart}

%======= packages ======%

\RequirePackage{amssymb}
\RequirePackage[fleqn]{mathtools} % advanced than amsmath
%\usepackage[title,titletoc]{appendix}
\RequirePackage{titlesec, titleps}
\RequirePackage{ifxetex, ifpdf}
\RequirePackage{caption}
\RequirePackage[numbers,sort&compress]{natbib}
\RequirePackage{hypernat}
\RequirePackage{environ}
\ifxetex
	\usepackage{xeCJKfntef}
\else
	\usepackage{CJKfntef}
\fi

%====== Command ======%

\def\college#1{\gdef\XJTU@college{#1}} % 学院
\def\XJTU@college{\@latex@warning@no@line{No \noexpand\college given}}
\def\department#1{\gdef\XJTU@department{#1}} % 系（专业）
\def\XJTU@department{\@latex@warning@no@line{No \noexpand\department given}}
\def\class#1{\gdef\XJTU@class{#1}} % 班级
\def\XJTU@class{\@latex@warning@no@line{No \noexpand\class given}}
\def\place#1{\gdef\XJTU@place{#1}} % 地点
\def\XJTU@place{\@latex@warning@no@line{No \noexpand\place given}}
\def\beginyear#1{\gdef\XJTU@beginyear{#1}} % 开始年
\def\XJTU@beginyear{\@latex@warning@no@line{No \noexpand\beginyear given}}
\def\beginmonth#1{\gdef\XJTU@beginmonth{#1}} % 开始月
\def\XJTU@beginmonth{\@latex@warning@no@line{No \noexpand\beginmonth given}}
\def\begindate#1{\gdef\XJTU@begindate{#1}} % 开始日
\def\XJTU@begindate{\@latex@warning@no@line{No \noexpand\begindate given}}
\def\endyear#1{\gdef\XJTU@endyear{#1}} % 结束年
\def\XJTU@@endyear{\@latex@warning@no@line{No \noexpand\endyear given}}
\def\endmonth#1{\gdef\XJTU@endmonth{#1}} % 结束月
\def\XJTU@endmonth{\@latex@warning@no@line{No \noexpand\endmonth given}}
\def\enddate#1{\gdef\XJTU@enddate{#1}} % 解释日
\def\XJTU@enddate{\@latex@warning@no@line{No \noexpand\enddate given}}

% Comment by hy_haoyun
%	The following interface is not perfect.
%	it should be modified to be more user friendly.

\def\title#1#2{\gdef\XJTU@title@cn{#1}\gdef\XJTU@title@en{#2}} % 题目
\def\XJTU@title@cn{\@latex@warning@no@line{No \noexpand\title for cn given}}
\def\XJTU@title@en{\@latex@warning@no@line{No \noexpand\title for en given}}
\def\author#1#2{\gdef\XJTU@author@cn{#1}\gdef\XJTU@author@en{#2}} % 作者
\def\XJTU@author@cn{\@latex@warning@no@line{No \noexpand\author for cn given}}
\def\XJTU@author@en{\@latex@warning@no@line{No \noexpand\author for en given}}
\def\advisor#1#2{\gdef\XJTU@advisor@cn{#1}\gdef\XJTU@advisor@en{#2}} % 导师
\def\XJTU@advisor@cn{\@latex@warning@no@line{No \noexpand\advisor for cn given}}
\def\XJTU@advisor@en{\@latex@warning@no@line{No \noexpand\advisor for en given}}

\newcommand\XJTU@uline[2][6]{\hskip1pt\underline{\hb@xt@ #1\ccwd{\hss#2\hss}}\hskip3pt}

\NewEnviron{fieldinline}[2][5]{#2 \CJKunderline*{\BODY\hfill}
\par\ifnum\prevgraf<#1
\newcount\numberoflines
\numberoflines=\prevgraf
\loop \par\noindent\CJKunderline{\hfill}\advance\numberoflines 1 \ifnum\numberoflines<#1 \repeat
\fi}

\NewEnviron{fieldbreak}[2][5]{#2 \par\CJKunderline*{\BODY\hfill}
\par\ifnum\prevgraf<#1
\newcount\numberoflines
\numberoflines=\prevgraf
\loop \par\noindent\CJKunderline{\hfill}\advance\numberoflines 1 \ifnum\numberoflines<#1 \repeat
\fi}

% 如下参考 http://tex.stackexchange.com/questions/70016/ways-to-grab-and-store-larger-amount-of-text
\NewEnviron{INFObackground}{\global\let\XJTU@field@background\BODY} % background significance goal
\def\XJTU@field@background{\@latex@warning@no@line{No \noexpand\XJTU@field@background given}}
\NewEnviron{INFOdata}{\global\let\XJTU@field@data\BODY} % data
\def\XJTU@field@data{\@latex@warning@no@line{No \noexpand\XJTU@field@data given}}
\NewEnviron{INFOtask}{\global\let\XJTU@field@task\BODY} % task
\def\XJTU@field@task{\@latex@warning@no@line{No \noexpand\XJTU@field@task given}}
\NewEnviron{INFOrequirement}{\global\let\XJTU@field@requirement\BODY} % requiement
\def\XJTU@field@requirement{\@latex@warning@no@line{No \noexpand\XJTU@field@requirement given}}
\NewEnviron{INFOsubmit}{\global\let\XJTU@field@submit\BODY} % submit
\def\XJTU@field@submit{\@latex@warning@no@line{No \noexpand\XJTU@field@submit given}}
\NewEnviron{INFOreference}{\global\let\XJTU@field@reference\BODY} % reference
\def\XJTU@field@reference{\@latex@warning@no@line{No \noexpand\XJTU@field@reference given}}


%======color=========%

\ifXJTU@print
	\hypersetup{%
		bookmarksnumbered=true,
		bookmarksopen=true,
		bookmarksopenlevel=1,
		breaklinks=true,
		colorlinks=false,
		plainpages=false,
		pdfpagelabels,
		pdfborder=0 0 0
	}
\fi

%====== microtype ======%
\ifpdf
\usepackage{microtype}
\fi

%====== English Font =====%
\ifXJTU@times
	\RequireXeTeX
	\setmainfont{Times New Roman}
\else
	\usepackage[scaled=.93]{newtxtext}
	\RequirePackage{newtxmath}
	\ProvideTextCommandDefault{\nobreakspace}{\leavevmode\nobreak\ }
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

%====== 字体属性 ======%

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

%====== Page Layout ======%
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

% Note! There is an warnning HERE! (2013-01-22)
%	Package Fancyhdr Warning: \headheight is too small (12.0pt): 
%	Make it at least 14.14998pt.
%	We now make it that large for the rest of the document.
%	This may cause the page layout to be inconsistent, however.
	
\renewcommand{\baselinestretch}{1.2} % 1.2为1.5倍行距，1.6为2倍行距

\newpagestyle{main}{
\sethead[][\small西安交通大学本科毕业设计（论文）][]	% even
		{}{\sectiontitle}{}	% odd
\setfoot[\thepage][][]	% even
		{}{}{\thepage}	% odd
\renewcommand{\makeheadrule}{%
	\makebox[0pt][l]{\rule[-0.2\baselineskip]{\linewidth}{0.5pt}}%
	\rule[-0.28\baselineskip]{\linewidth}{0.5pt}}
} 

\newpagestyle{document}{
\sethead[][\small西安交通大学本科毕业设计（论文）][]	% even
		{}{\thesection \quad \sectiontitle}{}	% odd
\setfoot[\thepage][][] % even
		{}{}{\thepage}	% odd
\renewcommand{\makeheadrule}{%
		\makebox[0pt][l]{\rule[-0.2\baselineskip]{\linewidth}{0.5pt}}%
		\rule[-0.28\baselineskip]{\linewidth}{0.5pt}}
} 

\def\frontmatter{%
	\clearpage
	\pagestyle{main}
	\pagenumbering{Roman}}
\def\mainmatter{%
	\clearpage
	\pagestyle{document}
	\pagenumbering{arabic}}
\def\backmatter{%
	\clearpage
	\pagestyle{main}}	

%====== displaymath ======%

\setlength{\mathindent}{2\ccwd}
\numberwithin{equation}{section}
\renewcommand{\theequation}{\arabic{section}-\arabic{equation}}

%====== titles ======%
%\renewcommand{\section}{\clearpage\@startsection{section}{1}{0pt}{0.1ex}{5ex}{\vspace*{2ex}\huge\centering}}
%\renewcommand{\subsection}{\@startsection{subsection}{1}{0pt}{9.4mm}{4.7mm}{\Large}}
%\renewcommand{\subsubsection}{\@startsection{subsubsection}{1}{0pt}{1ex}{0.1ex}{\large}}

% Comment by hy_haoyun:
%	1. 下面的代码使用 titlesec 宏包重新改写。源代码有误。
%	2. 不可以把 \clearpage 放到 \titleformat 的 {<format>} 中，否则目录会出现两次。
%	3. 下面定义了 \sectionname，是为了照顾附录。利用 titleformat 设置标题为 \thesection
%	会导致文章中附录标题不显示“附录二字”，appendix 宏包重新定义了 \sectionname 为 \appendixname
%	这里仅仅是应急方案，是否还有其他的解决方案呢？

\def\sectionname{}
\titleformat{\section} 
	[hang]
	{\filcenter\LARGE\bfseries} % 一级标题三号\LARGE
	{\sectionname\thesection}
	{1em}{}[] 
\titleformat{\subsection}
	[hang]
	{\Large\bfseries} % 二级标题小三号\Large
	{\thesubsection}
	{1em}{}[] 
\titleformat{\subsubsection}
	[hang]
	{\large\bfseries} % 三级标题三号\large
	{\hspace{2\ccwd}\thesubsubsection}
	{1em}{}[]
\titlespacing{\section}
	{0pt}
	{2.2\ccwd plus 1ex minus .2ex}
	{2\baselineskip plus .2ex}
\titlespacing{\subsection}
	{0pt}
	{9.4mm plus 1ex minus .2ex}%1\baselineskip plus 1ex minus .2ex}
	{.5\baselineskip plus .2ex}
\titlespacing{\subsubsection}
	{0pt}
	{.5\baselineskip plus 1ex minus .2ex}
	{0pt plus .2ex}
\newcommand{\sectionbreak}{\clearpage\vspace*{0pt}}

%====== captions ======%

% Comments by hy_haoyun:
%	The followings should be improved.

\captionsetup{labelformat=simple,labelsep=quad,font=small}
\captionsetup[table]{position=top,belowskip={1bp},aboveskip=-2bp}
\captionsetup[figure]{position=bottom,belowskip={1bp},aboveskip=-2bp}

\numberwithin{figure}{section}
\numberwithin{table}{section}
\renewcommand{\thefigure}{\arabic{section}-\arabic{figure}}
\renewcommand{\thetable}{\arabic{section}-\arabic{table}}

%====== Abstract ======%
\renewenvironment{abstract}{}{
	% 这里应该给出报错，提示使用abstractcn或者absctracten
}
%=== Chinese === %
\newcommand\XJTU@abstract@cn{\LARGE 摘\hspace{2\ccwd}要}
\newenvironment{abstractcn}{\clearpage
\sectionmark{\small 摘要}
\ifXJTU@front
	\setcounter{page}{5}
\fi
{\bfseries
	\noindent 论文题目：\XJTU@title@cn \par
	\noindent 学生姓名：\XJTU@author@cn \par
	\noindent 指导教师：\XJTU@advisor@cn \par
}
\begin{center}
	{\XJTU@abstract@cn\vspace{-.5em}\vspace {\z@}}
\end{center} \par
}{\par}

% Comment by hy_haoyun:
%	我想知道下面的这些距离是从哪里抄来的？
\newcommand{\keywordscn}[1]{\hskip-0.92cm{\vspace{1ex} \small {\bfseries 关键词：}#1}\relax}

%=== English ===%
\newcommand{\XJTU@abstract@en}{\LARGE ABSTRACT}
\newenvironment{abstracten}{\clearpage
\sectionmark{\small ABSTRACT}
{\bfseries
	\noindent Title：\XJTU@title@en \par
	\noindent Name：\XJTU@author@en \par
	\noindent Supervisor：\XJTU@advisor@en \par
}
\setlength\parskip{1ex}	% 设置段行距
\setlength\parindent{0em}	% 设置段首缩进
	\begin{center}
		{\XJTU@abstract@en\vspace{-.5em}\vspace{\z@}}
	\end {center} \par
}{%
\setlength\parskip{0ex}	% 恢复行距
\setlength\parindent{2\ccwd} % 恢复段首缩进
\par}

% Comment by hy_haoyun:
%	我想知道下面的这些距离是从哪里抄来的？
\newcommand{\keywordsen}[1]{\hskip -0.88cm{\vspace{1ex}\small {\bfseries KEY WORDS ：}#1}\relax}

%====== Table of Contents ======%

\let\oldtableofcontents\tableofcontents
\renewcommand{\tableofcontents}{
	\clearpage
	\sectionmark{\small 目录}
	\oldtableofcontents
}
%\titlecontents{section}
%	[0pt]
%	{}
%	{\contentslabel{1em}}
%	{}
%	{\titlerule*[1mm]{.}\contentspage}
%	[]
%\titlecontents{subsection}
%	[2\ccwd]
%	{}
%	{\contentslabel{2em}}
%	{}
%	{\titlerule*[1mm]{.}\contentspage\normalsize}
%	[]
%\titlecontents{subsubsection}
%	[4\ccwd]
%	{}
%	{\contentslabel{2.8em}
%	\normalsize}
%	{}
%	{\titlerule*[1mm]{.}\contentspage\normalsize}
%	[]
\renewcommand{\contentsname}{目\hspace{2\ccwd}录}
% Comment by hy_haoyun：
%	下面几句源自 article.cls
\renewcommand*\l@section{\@dottedtocline{1}{0pt}{1em}}
\renewcommand*\l@subsection{\@dottedtocline{2}{2em}{2em}}
\renewcommand*\l@subsubsection{\@dottedtocline{3}{4em}{3em}}

%====== Appendix ======%
% Comment by hy_haoyun:
%	附录的实现应该还有更"好"的方法。

\newcounter{appends} % 附录计数器
\newcounter{appendshead} % 附录页眉计数器
\setcounter{appends}{1} % 初始化为1
\setcounter{appendshead}{0} % 初始化为0
\newcommand{\appendixs}[1]{\clearpage
\sectionmark{\small 附录\arabic{appends}  \hspace{0.15cm}#1}
\section*{附录\arabic{appends}  \hspace{0.15cm}#1}
\addcontentsline{toc}{section}{附录\arabic{appends} \hspace{0.15cm} #1} 
\addtocounter{appends}{1} 
\addtocounter{appendshead}{1} 
}


%\renewcommand{\appendixname}{附录}
%\let\oldbeginappendices\appendices
%\let\oldendappendices\endappendices
%\let\oldsection\section
%\renewenvironment{appendices}{%
%\oldbeginappendices
%\gdef\thesecion{\@arabic\c@section}}%
%{\oldendappendices}


%=============主要符号================%

% Comment by hy_haoyun:
%	我感觉这个东西没有必要。

\newenvironment{denotation}{\section*{主要符号表}
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

%====== Bibliography ======%

%\def\newblock{\hskip .11em plus .33em minus .07em}

\def\mybibliography#1
{
\sectionmark{\small 参考文献}
\bibliographystyle{GBT7714-2005NLang-UTF8-mod}
\mbox{}
\addcontentsline{toc}{section}{参考文献}
%\renewcommand{\refname}{\small 参考文献}
\bibliography{#1}
}


%====== Footnote ======%
%\renewcommand{\thefootnote}{\raisebox{.5pt}{\textcircled{\raisebox{-.5pt}{\scriptsize\arabic{footnote}}}}} 

% Comment by hy_haoyun
%	原来的实现在 pdflatex 报错，具体原因不明，下面参考了 Neals 的做法，
%	见 http://blog.sina.com.cn/s/blog_5e16f1770100moqv.html

\usepackage{pifont}
\usepackage[perpage,symbol*]{footmisc}
\DefineFNsymbols{circled}{{\ding{192}}{\ding{193}}{\ding{194}}
{\ding{195}}{\ding{196}}{\ding{197}}{\ding{198}}{\ding{199}}{\ding{200}}{\ding{201}}}
\setfnsymbol{circled}

%====== Acknowledgment ======%
\newcommand{\XJTU@acknowledgment}{致\hspace{2\ccwd}谢}
\newenvironment{acknowledgment}{
       \section*{\XJTU@acknowledgment} 
		\sectionmark{\small 致谢}
\addcontentsline{toc}{section}{致谢}%使用\addcontentsline{toc}{chapter}{致谢}将致谢添加到目录中.
}{\par}


%====== Frontmatter ======%

\newif\ifXJTU@front \XJTU@fronttrue

\ifXJTU@front
	\newcommand{\extrapages}{%
	\frontmatter\makeatletter
	\input{frontpage.cfg}
	\makeatother
	\XJTU@frontfalse
}

\let\maketitle\undefined


