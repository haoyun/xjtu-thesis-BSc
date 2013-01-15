\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{xjtubsc}[2012/12/20 xjtuthesis Ver 1.0]

%=========加入ctexart类==============%
\LoadClass[cs4size,twoside,adobefonts]{ctexart}

%=========宏包===================%
\usepackage{amsfonts,verbatim}
\usepackage{amssymb}
\usepackage{amsmath}
\usepackage{array}
\usepackage{graphicx}
\usepackage{ragged2e}
\usepackage{tabularx}
\usepackage{listings}
\usepackage{subfigure}
\usepackage{float}
\usepackage{fancyhdr}
%\usepackage{titlesec}
\usepackage{titletoc}




%\def\section{\@startsection{section}{1}{\z@}
 % {-3ex\@plus -1ex \@minus -.2ex}
 % {2ex \@plus.2ex}
 % {\normalfont\Large\bfseries}}


%==========页面设置===============%

\RequirePackage[left=2.6cm,right=2.6cm,top=3.0cm,bottom=2.5cm,a4paper]{geometry}

%设置页眉
\fancyhf{}
\renewcommand{\headrule}{%设置页眉双线
\hrule height0.5pt width\headwidth
\vspace{0.5pt}
\hrule height0.5pt width\headwidth
}

\renewcommand{\sectionmark}[1]{\markleft{\thesection #1}}
\pagestyle{fancy}
\fancyhead[CE]{\songti \zihao{5}西安交通大学本科毕业设计（论文）}
%设置页脚
\fancyfoot[RO]{\roman{page}}
\fancyfoot[LE]{\roman{page}}


%======实现三级标题==============%

\CTEXsetup[format={\centering\zihao{3}\songti}]{section}
\CTEXsetup[format={\raggedright\zihao{-3}\songti}]{subsection}
\CTEXsetup[format={\hskip 0.15cm\zihao{4}}\songti]{subsubsection}
%未实现手册中的“单倍行距，段前空三行，段后空两行“要求。其次有一个丑陋的做法：在实现”三级标题：左起空两字符“用了”\hskip 0.15cm“



%============插图、表格及公式设置=============%
\usepackage{caption}
\captionsetup{labelformat=simple,labelsep=quad,font=small}
\captionsetup[table]{position=top,belowskip={1bp},aboveskip=-2bp}
\captionsetup[figure]{position=bottom,belowskip={1bp},aboveskip=-2bp}
%以上并未按章节编号，且还需多次调整

%加载booktabs绘制三线表
\usepackage{booktabs}


%==============封面及任务书===========%

%这个嘛，到时再处理


%==============中文摘要====================%
\newcommand{\chabstractname }{\zihao{3} 摘 \quad 要}
\newenvironment{chabstract}{
%页眉
\fancyhead[CO]{\songti \zihao{5} 摘要}
      \if@twocolumn \section *{\chabstractname }\else \zihao
{-4} \begin {center}{\songti \chabstractname \vspace {-.5em}\vspace {\z@
}}\end {center}\quotation \fi



}{\par}
\newcommand{\chkeywords}[1]{\par{\vspace{1ex} \zihao{5} {\bf关键词：}#1}\relax}

%==========英文摘要=====================%

\newcommand{\enabstractname }{\zihao{3} \fontspec{Times New Roman MT Std} ABSTRACT}
\newenvironment{enabstract}{
      \if@twocolumn \section *{\enabstractname }\else \zihao
{-4} \fontspec{Times New Roman MT Std} \begin {center}{ \enabstractname \vspace {-.5em}\vspace {\z@
}}\end {center}\quotation \fi
%页眉
\fancyhead[CO]{\songti \zihao{5} ABSTRACT}
}{\par}
\newcommand{\enkeywords}[1]{\par{\vspace{1ex}\zihao{5} \fontspec{Times New Roman MT Std} {\bf KEY WORDS ：}#1}\relax}
%且英文关键词字号设置有问题，不知是否为大小写的差异
%关键词并没有左对齐，且英文摘要内容用小四号Times New Roman，摘要正文每段开头不空格，每段之间空一行，未实现
%QinYuguo::英文摘要字体使用了\fontspec实现,现在是Times New Roman MT Std.



%===============目录=================%
%页眉
\let\oldtableofcontents\tableofcontents
\renewcommand{\tableofcontents}{
\fancyhead[CO]{\songti \zihao{5} 目\quad录}
\oldtableofcontents
}
%设置目录格式
\titlecontents{section}[0pt]{}{\contentslabel{1em}}{}{\titlerule*[1mm]{.}\contentspage}[]
\titlecontents{subsection}[2em]{}{\contentslabel{2em}}{}{\titlerule*[1mm]{.}\contentspage\zihao{-4}\songti}[]
\titlecontents{subsubsection}[4em]{}{\contentslabel{2.8em}\zihao{-4}\songti}{}{\titlerule*[1mm]{.}\contentspage\zihao{-4}\songti}[]
\renewcommand{\contentsname}{\zihao{3}\songti 目\quad录}
%=============正文================%
\newcommand{\mainbodyformat}{
%页眉
\fancyhead[CO]{\songti \zihao{5} \leftmark}
%页脚
\fancyfoot[RO]{\arabic{page}}
\fancyfoot[LE]{\arabic{page}}
}
%附录在自动生成目录时并未出现在目录中，不知如何处理
%=============附录================%
\newcounter{appends} %附录计数器
\newcounter{appendshead}%附录页眉计数器
\setcounter{appends}{1} %初始化为1
\setcounter{appendshead}{0}%初始化为0
\newcommand{\appendixs}[1]{
%设置页眉
\fancyhead[CO]{\songti \zihao{5} 附录\theappendshead \hspace{0.15cm} #1}
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
    {\vskip-30bp\zihao{-4}
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



%清华模板中有已设置好的格式，但不知如何使用thubib.bst。如若自己设置应如何做？




%================致谢===================%
\newcommand{\mythanksname}{\zihao{3} 致 \quad 谢}

\newenvironment{mythanks}{
\fancyhead[CO]{\songti \zihao{5} 致谢}
      \if@twocolumn \section *{\mythanksname }  \else \zihao
{-4} \begin {center}{\songti \mythanksname \vspace {-.5em}\vspace {\z@
}}\end {center}\quotation \fi
}{\par 
\addcontentsline{toc}{section}{致谢}
%使用\addcontentsline{toc}{chapter}{致谢}将致谢添加到目录中.
}









