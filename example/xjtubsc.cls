% !Mode:: "TeX:UTF-8"
%
%
%  MCMTHESIS.cls  CopyLeft 2011/8/24 by
%  wanghongxin <hongxin_w@163.com>
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
\newif\ifXJTU@timesmath \XJTU@timesmathfalse
\newif\ifXJTU@amsthm \XJTU@amsthmfalse
\newif\ifXJTU@mtpro \XJTU@mtprofalse

\DeclareOption{print}{\XJTU@printtrue}
\DeclareOption{truetimes}{\XJTU@timestrue}
\DeclareOption{timesmath}{\XJTU@timesmathtrue}
\DeclareOption{amsthm}{\XJTU@amsthmtrue}
\DeclareOption{c5size}{\OptionNotUsed}
\DeclareOption{twocolumn}{\OptionNotUsed}

\ProcessOptions\relax

%======= base calss ======%
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexart}}
\ProcessOptions\relax
\LoadClass[cs4size, hyperref, twoside, UTF8]{ctexart}

%======= packages ======%

\RequirePackage{amssymb}
\ifXJTU@mtpro
	\let\Bbbk\undefined
	\usepackage[complete]{mtpro2}
\fi
% Comment by hy_Haoyun:
%    `amssymb` is very useful when no special designed math fonts is loaded.
%    For this cls file,  it must be loaded before TeX Gyre Termes Math.
\RequirePackage[fleqn]{mathtools} % advanced than amsmath
%\usepackage[title,titletoc]{appendix}
\RequirePackage{titlesec, titleps}
\RequirePackage{ifxetex, ifpdf}
\RequirePackage{caption}
\RequirePackage[super,sort&compress]{natbib}
	\setcitestyle{square,comma}
\RequirePackage{hypernat}
\RequirePackage{environ}
\ifxetex
	\usepackage{xeCJKfntef}
\else
	\usepackage{CJKfntef}
	\normalem % set \emph{} to be the original one, i.e., in italic font.
\fi
\RequirePackage{perpage}
\ifpdf
	% If I redefine the \thefootnote command, it will cause error with microtype package.
	%\usepackage{microtype}
\fi
\ifXJTU@amsthm
% Comment by hy_haoyun:
%	由于一些未知的原因，定理环境在 pdftex 下会出现问题。
	\RequireXeTeX
	\RequirePackage{amsthm, thmtools}
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

% Reference: http://tex.stackexchange.com/questions/41996/how-do-i-split-a-dat
\def\XJTU@begindate#1/#2/#3.{\gdef\XJTU@byear{#1}\gdef\XJTU@bmonth{#2}\gdef\XJTU@bday{#3}}
\def\bdate#1{{\edef\XJTU@tempbdate{#1}\expandafter\XJTU@begindate\XJTU@tempbdate.}}
\def\XJTU@enddate#1/#2/#3.{\gdef\XJTU@eyear{#1}\gdef\XJTU@emonth{#2}\gdef\XJTU@eday{#3}}
\def\edate#1{{\edef\XJTU@tempedate{#1}\expandafter\XJTU@enddate\XJTU@tempedate.}}
\def\XJTU@byear{\@latex@warning@no@line{No \noexpand\bdate given}}
\def\XJTU@bmonth{\@latex@warning@no@line{No \noexpand\bdate given}}
\def\XJTU@bday{\@latex@warning@no@line{No \noexpand\bdate given}}
\def\XJTU@eyear{\@latex@warning@no@line{No \noexpand\edate given}}
\def\XJTU@emonth{\@latex@warning@no@line{No \noexpand\edate given}}
\def\XJTU@eday{\@latex@warning@no@line{No \noexpand\edate given}}

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

% Reference: http://tex.stackexchange.com/questions/70016/ways-to-grab-and-store-larger-amount-of-text
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
		breaklinks=true,
		bookmarksnumbered=true,
		bookmarksopen=true,
		bookmarksopenlevel=1,
		breaklinks=true,
		colorlinks=false,
		plainpages=false,
		pdfpagelabels,
		pdfborder={0 0 0},
	}
\fi

%====== English Font =====%
\ifXJTU@times
	\RequireXeTeX
	\setmainfont{Times New Roman}
\else
	\ifxetex
		\setmainfont{TeX Gyre Termes}
	\else
% Comment by hy_haoyun:
%	Even though *newtx* is a updated package, but it isn't compatible with
%	*pifont* package; the latter package is used to produce the circled number
%	for footnote. When newtx loaded, the circled number won't appear as a superscript.
		%\usepackage[scaled=.93]{newtxtext}
%	So here we use *txfonts* instead.
		\usepackage{txfonts}
		\RequirePackage{textcomp}	
		\ProvideTextCommandDefault{\nobreakspace}{\leavevmode\nobreak\ }
	\fi
\fi

\ifXJTU@timesmath
	\ifxetex
		\RequirePackage{unicode-math}
		\setmathfont[math-style=ISO,bold-style=ISO,vargreek-shape=TeX]{TeX Gyre Termes Math}
	\else
		\RequirePackage{newtxmath}
	\fi
\fi

% Comments by hy_haoyun
% 	Other options about times font:
%	mathptmx (package)
%	times (package)
%	TeX Gyre Termes (font)
%	TeX Gyre Termes math (font)


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
	bottom = 3.3 true cm, %
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
\setlength{\headheight}{0.7cm}%调整页眉字中道页顶距离
\sethead[][\small 西安交通大学本科毕业设计（论文）][]	% even
		{}{\small \sectiontitle}{}	% odd
\setfoot[\thepage][][]	% even
		{}{}{\thepage}	% odd
\renewcommand{\makeheadrule}{%
	\makebox[0pt][l]{\rule[-0.28\baselineskip]{\linewidth}{0.5pt}}%
	\rule[-0.34\baselineskip]{\linewidth}{0.5pt}}
} 

\newpagestyle{document}{
\setlength{\headheight}{0.7cm}%调整页眉字中道页顶距离
\sethead[][\small 西安交通大学本科毕业设计（论文）][]	% even
		{}{\small \thesection \quad \sectiontitle}{}	% odd
\setfoot[\thepage][][] % even
		{}{}{\thepage}	% odd
\renewcommand{\makeheadrule}{%
		\makebox[0pt][l]{\rule[-0.28\baselineskip]{\linewidth}{0.5pt}}%
		\rule[-0.34\baselineskip]{\linewidth}{0.5pt}}
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
\captionsetup[table]{position=top,belowskip={12bp-\intextsep},aboveskip=6bp}
\captionsetup[figure]{position=bottom,belowskip={12bp-\intextsep},aboveskip=6bp}


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
\sectionmark{ 摘要}
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
\end{center}\par
}{\par}

\newcommand{\keywordscn}[1]{\vspace{\baselineskip}\par\noindent {\small {\bfseries 关键词：}#1}}

%=== English ===%
\newcommand{\XJTU@abstract@en}{\LARGE ABSTRACT}
\newenvironment{abstracten}{\clearpage
\sectionmark{ ABSTRACT}
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

\newcommand{\keywordsen}[1]{\vspace{\baselineskip}\par\noindent {\small {\bfseries KEY WORDS ：}#1}}

%==========proof========%

\ifXJTU@amsthm
	\renewcommand{\proofname}{\normalfont\bfseries 证明}
	\renewenvironment{proof}[1][\hskip 2\ccwd \proofname]{\par
		\pushQED{\qed}%
		\normalfont \topsep6\p@\@plus6\p@\relax
		\trivlist
			\item[\hskip\labelsep\itshape#1\@addpunct{}]\ignorespaces
	}{%
		\popQED\endtrivlist\@endpefalse
	}
	
	\declaretheoremstyle[
	spaceabove=6pt, spacebelow=6pt,
	headfont=\normalfont\bfseries,
	notefont=\mdseries, notebraces={(}{)},
	bodyfont=\normalfont,
	postheadspace=1em,
	headindent=2\ccwd,
	headpunct={},
	]{theoremstyle}
	
	\declaretheorem[name={公理},numberwithin=section,style=theoremstyle]{axiom}
	\declaretheorem[name={定理},numberwithin=section,style=theoremstyle]{theorem}
	\declaretheorem[name=定义,numberwithin=section,style=theoremstyle]{definition}
	\declaretheorem[name=命题,numberwithin=section,style=theoremstyle]{proposition}
	\declaretheorem[name=引理,numberwithin=section,style=theoremstyle]{lemma}
	\declaretheorem[name=推论,numberwithin=section,style=theoremstyle]{corollary}
	\declaretheorem[name=假设,numberwithin=section,style=theoremstyle]{assumption}
	\declaretheorem[name=问题,numberwithin=section,style=theoremstyle]{problem}
	\declaretheorem[name=猜想,numberwithin=section,style=theoremstyle]{conjecture}
\fi

%====== Table of Contents ======%

\let\oldtableofcontents\tableofcontents
\renewcommand{\tableofcontents}{
	\clearpage
	\sectionmark{目录}
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
\sectionmark{ 附录\arabic{appends}  \hspace{0.15cm}#1}
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
\sectionmark{主要符号表}
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

%	\def\mybibliography#1
%	{
%	\sectionmark{参考文献}
%	\bibliographystyle{GBT7714-2005NLang-UTF8-mod}
%	\mbox{}
%	\addcontentsline{toc}{section}{参考文献}
%	%\renewcommand{\refname}{\small 参考文献}
%	\bibliography{#1}
%	}

\let\oldbibliography\bibliography
\renewcommand{\bibliography}[1]{
\sectionmark{参考文献}
\addcontentsline{toc}{section}{参考文献}
\oldbibliography{#1}
}


%====== Footnote ======%
%\renewcommand{\thefootnote}{\raisebox{.5pt}{\textcircled{\raisebox{-.5pt}{\scriptsize\arabic{footnote}}}}} 

% Comment by hy_haoyun
%	原来的实现在 pdflatex 报错，具体原因不明，下面参考了 Neals 的做法，
%	见 http://blog.sina.com.cn/s/blog_5e16f1770100moqv.html
%\usepackage[perpage,symbol*]{footmisc}
%\DefineFNsymbols{circled}{{\ding{192}}{\ding{193}}{\ding{194}}
%{\ding{195}}{\ding{196}}{\ding{197}}{\ding{198}}{\ding{199}}{\ding{200}}{\ding{201}}}
%\setfnsymbol{circled}

\usepackage{pifont}
\renewcommand\thefootnote{\ding{\numexpr171+\value{footnote}}}
\MakePerPage{footnote} % Package `perpage` is needed.



%====== Acknowledgment ======%
\newcommand{\XJTU@acknowledgment}{致\hspace{2\ccwd}谢}
\newenvironment{acknowledgment}{
       \section*{\XJTU@acknowledgment} 
		\sectionmark{致谢}
\addcontentsline{toc}{section}{致谢} % 使用\addcontentsline{toc}{chapter}{致谢}将致谢添加到目录中.
}{\par}


%====== Frontmatter ======%

\newif\ifXJTU@front \XJTU@fronttrue

\ifXJTU@front
	\newcommand{\extrapages}{%
	\frontmatter
	\makeatletter
	
%===========================================
%	开始 extrapages
%===========================================

%===========================================
%	毕业设计(论文)任务书
%===========================================

\parindent=0pt
%\setlength\parskip{1ex}
\renewcommand{\baselinestretch}{1.6}\selectfont
\sectionmark{毕业设计(论文)任务书}

\begin{center}
\begin{minipage}[c]{.55\textwidth}\centering
	{\ziju{0.5}{\bfseries\songti\huge 西安交通大学}}
\end{minipage}%
\begin{minipage}[c]{.35\textwidth}
	\begin{tabular}{rl}
		系\hfill(\hfil所\hfil)&\XJTU@uline{}\\
		系\hfil(所)\hfil主\hfil任&\XJTU@uline{}\\
		批\hfil准\hfil日\hfil期&\XJTU@uline{}
	\end{tabular}
\end{minipage}
\end{center}

\vspace{\baselineskip}

\begin{center}
	{\songti\bfseries\huge 毕业设计(论文)任务书} % 字号可能需要修改一下
	\vspace{\baselineskip}
\end{center}

\small
\XJTU@uline{\XJTU@college}~院~\XJTU@uline{\XJTU@department}~系~\XJTU@uline{\XJTU@class}~班\hspace{\ccwd}学生\CJKunderline{\hfill \XJTU@author@cn \hfill}

\vspace{1ex}
毕业设计(论文)课题\hspace{1ex}\CJKunderline{\hfill \XJTU@title@cn \hfill}

\vspace{1ex}
毕业设计(论文)工作自~\XJTU@uline[3]{\XJTU@byear}~年~\XJTU@uline[3]{\XJTU@bmonth}~月~\XJTU@uline[3]{\XJTU@bday}~日起至\XJTU@uline[3]{\XJTU@eyear}~年~\XJTU@uline[3]{\XJTU@emonth}~月~\XJTU@uline[3]{\XJTU@eday}~日止

\vspace{1ex}
毕业设计(论文)进行地点\hspace{1ex}\CJKunderline{\hfill \XJTU@place \hfill}

\vspace{1ex}
\begin{fieldbreak}[5]{{\songti\bfseries 课题的背景、意义及培养目标}}
	\XJTU@field@background
\end{fieldbreak}

\vspace{1ex}
\begin{fieldbreak}[6]{{\songti\bfseries 设计(论文)的原始数据与资料}}
	\XJTU@field@data
\end{fieldbreak}

\vspace{1ex}
\begin{fieldbreak}[7]{{\songti\bfseries 课题的主要任务}}
	\XJTU@field@task
\end{fieldbreak}

\vspace{1ex}
\begin{fieldbreak}[7]{{\songti\bfseries 课题的基本要求(工程设计类题应有技术经济分析要求)}}
	\XJTU@field@requirement
\end{fieldbreak}

\vspace{1ex}
\begin{fieldbreak}[6]{{\songti\bfseries 完成任务后提交的书面材料要求(图纸规格、数量，论文字数，外文翻译字数等)}}
	\XJTU@field@submit
\end{fieldbreak}

\vspace{1ex}
\begin{fieldbreak}[6]{{\songti\bfseries 主要参考文献}}
	\XJTU@field@reference
\end{fieldbreak}

\vspace{2\baselineskip}

\begin{center}
\begin{minipage}[b]{.4\textwidth}\centering
\relax\vfill
（注：由指导教师填写）
\end{minipage}%
\begin{minipage}[b]{.6\textwidth}
	\begin{flushright}
		指导教师\XJTU@uline[18]{}

		接受设计（论文）任务日期\XJTU@uline[10]{}

		学生签名 \XJTU@uline[10]{}
	\end{flushright}
\end{minipage}%
\end{center}
\normalsize
%===========================================
%	毕业设计(论文)考核评议书、毕业设计(论文)评审意见书
%===========================================

\newpage\vspace*{0pt}
\parindent=2\ccwd
\sectionmark{毕业设计(论文)考核评议书}

\begin{center}
	{\ziju{1.5}\bfseries\songti\LARGE 西安交通大学}
	
	\vspace{.5\baselineskip}
	{\huge\bfseries\songti 毕业设计(论文)考核评议书}
\end{center}

\noindent\XJTU@uline[10]{\XJTU@college}~院~\XJTU@uline[10]{\XJTU@department}~系(专业)~\XJTU@uline[8]{\XJTU@class}~班级

\vspace{\baselineskip}

指导教师对学生\XJTU@uline[10]{\XJTU@author@cn}所完成课题为
\begin{fieldinline}[2]{}\XJTU@title@cn\end{fieldinline}
\par\noindent 的毕业设计(论文)进行的情况，完成的质量及评分的意见：
\begin{fieldinline}[7]{}\end{fieldinline}

\begin{flushright}
指导教师\XJTU@uline[13]{}

{\ziju{3}年月日}\hspace*{2em}
\end{flushright}

\begin{center}
	{\huge\bfseries\songti 毕业设计(论文)评审意见书}
	\vspace{\baselineskip}
\end{center}

\begin{fieldinline}[6]{评审意见：}\end{fieldinline}

\begin{flushright}
评阅人\XJTU@uline[9]{} 职称\XJTU@uline[7]{}

{\ziju{3}年月日}\hspace*{2em}
\end{flushright}

%===========================================
%	毕业设计(论文)答辩结果
%===========================================

\newpage\vspace*{\baselineskip}
\sectionmark{毕业设计(论文)答辩结果}
% The \vspace command adds the vertical space length, i.e., a rubber length. length can be negative or positive. Ordinarily, LaTeX removes vertical space added by \vspace at the top or bottom of a page. With the optional * argument, the space is not removed.

\begin{center}
	{\huge\bfseries\songti 毕业设计(论文)答辩结果 }

	\bigskip
	\begin{tabular}{rl}
		\XJTU@uline[8]{\XJTU@college} & {\large\bfseries\songti 院} \\                      
		\XJTU@uline[8]{\XJTU@department} & \large\bfseries\songti{系(专业)}
	\end{tabular}
\end{center}

\vspace{\baselineskip}

毕业设计(论文)答辩组对学生\XJTU@uline[10]{\XJTU@author@cn}所完成课题为
\begin{fieldinline}[3]{}\XJTU@title@cn\end{fieldinline}
\par\noindent 的毕业设计(论文)经过答辩，其意见为：
\begin{fieldinline}[7]{}\end{fieldinline}

\vspace{\baselineskip}\noindent 并确定成绩为~\CJKunderline*{\hfill}

\newlength\templength
\settowidth{\templength}{答辩组成员 }

\vspace{4\baselineskip}
\begin{flushright}
\begin{tabular}{c}
毕业设计(论文)答辩组负责人 \CJKunderline{\hfill}\\
答辩组成员 \XJTU@uline[8]{}\hspace{.6ex}\XJTU@uline[9]{}\\
\hspace{\templength}\XJTU@uline[8]{}\hspace{.6ex}\XJTU@uline[9]{}\\
\hspace{\templength}\XJTU@uline[8]{}\hspace{.6ex}\XJTU@uline[9]{}
\end{tabular}

\vspace{1ex}{\ziju{3}年月日}\hspace*{2em}
\end{flushright}

\renewcommand{\baselinestretch}{1.2}\selectfont
%===========================================
%	结束 extrapages
%===========================================

	\makeatother
	\XJTU@frontfalse
}
\fi


\let\maketitle\undefined
